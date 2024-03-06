#!/bin/sh
set -e

dataset_path="/home/qcraft/colmap_test/test/test_right_s"
pair_nums=1 #定义匹配的对数
# 定义图片的宽和高
Width=1024
Height=512

# 生成匹配对
python super_glue/generatePair.py "${dataset_path}/images" "${dataset_path}/image_pairs.txt" "${pair_nums}"

# 用superglue生成特征点和匹配对
python super_glue/match_pairs.py \
--input_dir "${dataset_path}/images" \
--output_dir "${dataset_path}/desc" \
--input_pairs "${dataset_path}/image_pairs.txt" \
--superglue outdoor \
--max_keypoints 2048 \
--resize ${Width} ${Height} \
--nms_radius 3 \
--resize_float

# 转换格式
python super_glue/super.py --working_dir="${dataset_path}"

# 把pose和内参初始化到数据库里
python super_glue/feature_match_to_database.py --projpath "${dataset_path}"

# 手动导入：
# - Processing > 特征提取，转到导入窗口(Import)，选择 colmap_desc 目录的路径，然后单击提取
# - Processing > 特征匹配，转到自定义窗口(Custom)，选择类型“Inlier feature matches”，然后使用“选择文件”选择 superglue_matches.txt 文件，单击“运行”

# ./build/src/exe/colmap mapper \
#    --database_path ${dataset_path}/database.db \
#    --image_path ${dataset_path}/images \
#    --output_path ${dataset_path}/sparse 
# echo "end with colmap mapper"