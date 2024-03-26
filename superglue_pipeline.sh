#!/bin/sh
set -e

dataset_path=${dataset_path:-""/home/test1""}
script_directory="$(dirname "$script_path")"
dataset_path="$1"
colmap_path="$2"

echo ${script_directory}
pair_nums=2 #定义匹配的对数

# 给图片加上mask
python ${colmap_path}/super_glue/mask.py "${dataset_path}/panonet" "${dataset_path}/mask"

# # 生成匹配对
python ${colmap_path}/super_glue/generatePair.py "${dataset_path}/images" "${dataset_path}/image_pairs.txt" "${pair_nums}"

if [ -d "${dataset_path}/desc" ]; then
    rm -rf "${dataset_path}/desc"
    echo "已删除目录：${dataset_path}/desc"
fi
mkdir -p "${dataset_path}/desc"
echo "目录已创建：${dataset_path}/desc"

# 用superglue生成特征点和匹配对
python ${colmap_path}/super_glue/match_pairs.py \
--input_dir "${dataset_path}/images" \
--output_dir "${dataset_path}/desc" \
--mask_dir "${dataset_path}/mask" \
--input_pairs "${dataset_path}/image_pairs.txt" \
--superglue outdoor \
--max_keypoints 2048 \
--nms_radius 3 \
--resize_float \
--add_mask "T"
# --viz

# 转换格式
python ${colmap_path}/super_glue/super.py --working_dir="${dataset_path}"

# 把pose和内参初始化到数据库里,并导入特征点和匹配对
python ${colmap_path}/super_glue/feature_match_to_database.py --projpath "${dataset_path}"

# 手动导入：
# - Processing > 特征提取，转到导入窗口(Import)，选择 colmap_desc 目录的路径，然后单击提取
# - Processing > 特征匹配，转到自定义窗口(Custom)，选择类型“Inlier feature matches”，然后使用“选择文件”选择 superglue_matches.txt 文件，单击“运行”

if [ ! -d "${dataset_path}/sparse/" ]; then
    echo "mkdir sparse"
    mkdir ${dataset_path}/sparse
fi

${colmap_path}/build/src/exe/colmap mapper \
   --database_path ${dataset_path}/database.db \
   --image_path ${dataset_path}/images \
   --output_path ${dataset_path}/sparse 
echo "end with colmap mapper"

python3 ${colmap_path}/tools/txt2json.py --input_dir=${dataset_path}
