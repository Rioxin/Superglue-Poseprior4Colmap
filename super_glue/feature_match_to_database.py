# 导入所需模块和库
import cv2
import os, time
import numpy as np
import argparse
from database import COLMAPDatabase
import json
import sys
import sqlite3

from scipy.spatial.transform import Rotation

# 相机模型的字典，用于映射相机模型到数字
camModelDict = {'SIMPLE_PINHOLE': 0,
                'PINHOLE': 1,
                'SIMPLE_RADIAL': 2,
                'RADIAL': 3,
                'OPENCV': 4,
                'FULL_OPENCV': 5,
                'SIMPLE_RADIAL_FISHEYE': 6,
                'RADIAL_FISHEYE': 7,
                'OPENCV_FISHEYE': 8,
                'FOV': 9,
                'THIN_PRISM_FISHEYE': 10}

# 根据相机模型初始化相机参数
def get_init_cameraparams(width, height, modelId):
    f = max(width, height) * 1.2
    cx = width / 2.0
    cy = height / 2.0
    if modelId == 0:
        return np.array([f, cx, cy])
    elif modelId == 1:
        return np.array([f, f, cx, cy])
    elif modelId == 2 or modelId == 6:
        return np.array([f, cx, cy, 0.0])
    elif modelId == 3 or modelId == 7:
        return np.array([f, cx, cy, 0.0, 0.0])
    elif modelId == 4 or modelId == 8:
        return np.array([f, f, cx, cy, 0.0, 0.0, 0.0, 0.0])
    elif modelId == 9:
        return np.array([f, f, cx, cy, 0.0])
    return np.array([f, f, cx, cy, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])

IS_PYTHON3 = sys.version_info[0] >= 3
def array_to_blob(array):
    if IS_PYTHON3:
        return array.tobytes()
    else:
        return np.getbuffer(array)
    
# 初始化相机和图像到数据库中
def init_cameras_database(db, images_path, cameratype, single_camera):
    print("initial database ......................................")
    images_name = []
    width = None
    height = None
    for name in sorted(os.listdir(images_path)):
        if 'jpg' in name or 'png' in name:
            images_name.append(name)
            if width is None:
                img = cv2.imread(os.path.join(images_path, name))
                height, width = img.shape[:2]
    cameraModel = camModelDict[cameratype]
    params = get_init_cameraparams(width, height, cameraModel)
    if single_camera:
        db.add_camera(cameraModel, width, height, params, camera_id=0)
    for i, name in enumerate(images_name):
        if single_camera:
            db.add_image(name, 0, image_id=i)
            continue
        db.add_camera(cameraModel, width, height, params, camera_id=i)
        db.add_image(name, i, image_id=i)
    return images_name

def read_json_poses(pose_path):
  with open(pose_path, 'r') as file:
    poses = json.load(file)
  
  data={}
  for pose in poses:
    
    rotation = Rotation.from_euler('zyx', [pose["yaw"], pose["pitch"], pose["roll"]], degrees=True)
    quaternion = rotation.as_quat()
    
    data["{:.3f}".format(pose["timestamp"])]=[pose["x"],pose["y"],pose["z"] \
      ,quaternion[0],quaternion[1],quaternion[2],quaternion[3]]

  return data

def read_json_intrinsics(param_path):
  with open(param_path, 'r') as file:
    param = json.load(file)

  intrinsics = [param["fx"], param["fy"], \
    param["cx"], param["cy"]]
  return intrinsics

def update_poses_in_db(cursor, poses, intrinsics):
  # c.execute("SELECT name FROM images WHERE name=\'{0}\'".format('000.png'))
  cursor.execute("SELECT name, camera_id FROM images")
  contents = cursor.fetchall()
  camera_id_to_key = {}
  # print(poses)
  for content in contents:
      name, camera_id = content
      # print("name ",name)
      key = name.strip(".png").split('/')[0]
      camera_id_to_key[camera_id] = key
      tx, ty, tz, qw, qx, qy, qz = poses[key]
      cmd = "UPDATE images SET prior_tx={0}, prior_ty={1}, prior_tz={2}, prior_qx={3}, prior_qy={4}, prior_qz={5}, prior_qw={6} WHERE name=\'{7}\'".format(
          tx, ty, tz, qx, qy, qz, qw, name
      )
      # print(cmd)
      cursor.execute(cmd)
  for cam_id, key in camera_id_to_key.items():
      fx, fy, cx, cy = intrinsics
      params = array_to_blob(np.array([fx, fy, cx, cy], dtype=np.float64))
      cursor.execute("UPDATE cameras SET params=(?) WHERE camera_id=(?)", (params, cam_id))

def add_keypoints(self, image_id, keypoints):
        assert(len(keypoints.shape) == 2)
        assert(keypoints.shape[1] in [2, 4, 6])

        keypoints = np.asarray(keypoints, np.float32)
        self.execute(
            "INSERT INTO keypoints VALUES (?, ?, ?, ?)",
            (image_id,) + keypoints.shape + (array_to_blob(keypoints),))

# 执行命令并计时
def operate(cmd):
    print(cmd)
    start = time.perf_counter()
    os.system(cmd)
    end = time.perf_counter()
    duration = end - start
    print("[%s] 耗时 %f 秒" % (cmd, duration))

# 创建目录
def makedir(path):
    if not os.path.exists(path):
        os.makedirs(path)

def process_txt_files(folder_path, db):
    # 遍历文件夹中的所有txt文件，并按文件名排序
    txt_files = sorted([filename for filename in os.listdir(folder_path) if filename.endswith('.txt')])

    # 初始化image_id计数器
    image_id_counter = 1
    # 总特征点计数器
    total_keypoints = 0
    
    # 遍历排序后的txt文件
    for filename in txt_files:
        # 使用image_id计数器作为image_id
        image_id = image_id_counter
        image_id_counter += 1
        
        # 构建txt文件的完整路径
        txt_file_path = os.path.join(folder_path, filename)
        
        # 打开txt文件
        keypoints_data = []
        with open(txt_file_path, 'r') as file:
            # 跳过第一行
            next(file)
            # 遍历文件中的每一行
            for line in file:
                # 按空格拆分行
                data = line.split()
                # 提取相关信息
                rows = int(round(float(data[0])))  # 第一个是rows
                cols = int(round(float(data[1])))  # 第二个是cols
                # 将特征点数据转换为numpy数组
                keypoints_data.append([rows, cols])
        
        # 将特征点数据转换为NumPy数组
        keypoints_data = np.array(keypoints_data)
        
        # 统计特征点数量
        total_keypoints += len(keypoints_data)
        
        # 将特征点添加到数据库
        db.add_keypoints(image_id, keypoints_data)
    
    # 返回总特征点数量
    return total_keypoints


# 主函数入口
if __name__ == "__main__":
    # 解析命令行参数
    parser = argparse.ArgumentParser(description='super glue')
    parser.add_argument("--projpath", required=True, type=str)
    args = parser.parse_args()

    # 数据库路径
    database_path = os.path.join(args.projpath, "database.db")

    # 如果数据库文件存在，则删除
    if os.path.exists(database_path):
        cmd = "rm -rf %s" % database_path
        operate(cmd)

    # 图像路径
    images_path = os.path.join(args.projpath, "images")
    pose_path=os.path.join(images_path, "pose.json")
    poses = read_json_poses(pose_path)
    param_path=os.path.join(images_path, "camera_param.json")
    intrinsics = read_json_intrinsics(param_path)

    # 连接数据库并创建表格
    db = COLMAPDatabase.connect(database_path)
    db.create_tables()
    c = db.cursor()

    # 初始化相机和图像到数据库中
    images_name = init_cameras_database(db, images_path, "PINHOLE", True)
    update_poses_in_db(c, poses, intrinsics)
    # 从图像中提取特征并存储到数据库
    # 指定包含txt文件的文件夹路径
    folder_path = os.path.join(args.projpath, "colmap_desc")

    total_keypoints=process_txt_files(folder_path,db)
    # 匹配图像特征并存储到数据库(TODO)
    match_list_path = os.path.join(args.projpath, "image_pairs_to_match.txt")
    # 打印总特征点数量
    print("Total keypoints:", total_keypoints)
    # 提交事务并关闭数据库连接
    db.commit()
    c.close()
    db.close()

    # 进行几何验证
   

    # 执行colmap的mapper命令
    
