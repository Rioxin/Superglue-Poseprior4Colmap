#!/bin/sh
# The project folder must contain a folder "images" with all the images.

dataset_path="/home/qcraft/super_point/test4"
vocab_path="/home/qcraft/super_point/vocab_tree_flickr100K_words256K.bin"

if [ ! -f "${dataset_path}/pose1.db" ]; then
    echo "touch ${dataset_path}/pose1.db "
    touch ${dataset_path}/pose1.db 
fi


 # --ImageReader.mask_path ${dataset_path}/panonet \

# ./build/src/exe/colmap feature_extractor \
#     --database_path ${dataset_path}/pose1.db \
#     --image_path ${dataset_path}/images \
#     --ImageReader.mask_path ${dataset_path}/panonet \
#     --ImageReader.camera_model=PINHOLE \
#     --ImageReader.single_camera_per_folder=true \
#     --SiftExtraction.estimate_affine_shape=true \
#     --SiftExtraction.domain_size_pooling=true


# ./build/src/exe/colmap feature_extractor \
#     --database_path ${dataset_path}/pose1.db \
#     --image_path ${dataset_path}/images \
#     --ImageReader.camera_model=PINHOLE \
#     --ImageReader.single_camera_per_folder=true \
#     --SiftExtraction.estimate_affine_shape=true \
#     --SiftExtraction.domain_size_pooling=true

python3 tools/sql.py --project_dir ${dataset_path}
echo "python sql.py has done"

# ./build/src/exe/colmap sequential_matcher \
#    --database_path ${dataset_path}/pose1.db \
#    --SequentialMatching.loop_detection=true \
#    --SequentialMatching.vocab_tree_path ${vocab_path}
# echo "end with sequential_matcher"

if [ ! -d "${dataset_path}/sparse/" ]; then
    echo "mkdir sparse"
    mkdir ${dataset_path}/sparse
fi

./build/src/exe/colmap mapper \
   --database_path ${dataset_path}/pose1.db \
   --image_path ${dataset_path}/images \
   --output_path ${dataset_path}/sparse 
echo "end with colmap mapper"

# if [ ! -d "${dataset_path}/dense/" ]; then
#     echo "mkdir dense"
#     mkdir ${dataset_path}/dense
# fi

# ./build/src/exe/colmap image_undistorter \
#     --image_path ${dataset_path}/images \
#     --input_path ${dataset_path}/sparse/0/ \
#     --output_path ${dataset_path}/dense \
#     --output_type COLMAP 
# echo "end with colmap image_undistorter"

# ./build/src/exe/colmap patch_match_stereo \
#     --workspace_path ${dataset_path}/dense \
#     --workspace_format COLMAP \
#     --PatchMatchStereo.geom_consistency=true
# echo "end with colmap patch_match_stereo"

# ./build/src/exe/colmap stereo_fusion \
#     --workspace_path ${dataset_path}/dense \
#     --workspace_format COLMAP \
#     --input_type geometric \
#     --output_path ${dataset_path}/dense/fused.ply
# echo "end with colmap stereo_fusion"

# ./build/src/exe/colmap poisson_mesher \
#     --input_path ${dataset_path}/dense/fused.ply \
#     --output_path ${dataset_path}/dense/meshed-poisson.ply
