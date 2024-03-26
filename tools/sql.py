import argparse
import pprint
import sqlite3
import os
import sys
import numpy as np
import json


from scipy.spatial.transform import Rotation

IS_PYTHON3 = sys.version_info[0] >= 3

def blob_to_array(blob, dtype, shape=(-1,)):
    if IS_PYTHON3:
        return np.fromstring(blob, dtype=dtype).reshape(*shape)
    else:
        return np.frombuffer(blob, dtype=dtype).reshape(*shape)

def array_to_blob(array):
    if IS_PYTHON3:
        return array.tobytes()
    else:
        return np.getbuffer(array)

def read_intrinsics(intrinsics_dir, keys):
  intrinsics = {}
  for key in keys:
      intrinsics_file = intrinsics_dir + key + "/intrinsics.txt" 
      with open(intrinsics_file, "r") as f:
          fx, fy, cx, cy = f.readline().strip().split()
      intrinsics[key] = (float(fx), float(fy), float(cx), float(cy))
  return intrinsics
    
def read_poses(pose_dir, keys):
  poses = {}
  for key in keys:
      poses[key] = []
  
      pose_file = pose_dir + key + "/poses.txt" 
      with open(pose_file, "r") as f:
          lines = f.readlines()
  
      for line in lines:
          # tx, ty, tz, qw, qx, qy, qz
          poses[key].append(map(float, line.strip().split()))

  return poses

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
  


def print_table_info(cursor):
  print("+++++++++++++ Table Info ++++++++++++++++")
  cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
  tables = cursor.fetchall()
  for tbl_name in tables:
      tbl_name = tbl_name[0]
  
      print(tbl_name + ':')
      cursor.execute("PRAGMA table_info({})".format(tbl_name))
      pprint.pprint(cursor.fetchall())
      print("+++++++++++++++++++++++++++++++++++++++++")

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


if __name__=="__main__":
  parser = argparse.ArgumentParser(description="COLMAP database tool")
  parser.add_argument(
      "--project_dir",
      default="/home/colmap_test/test/test_right",
      metavar="FILE",
      help="path to config file",
      type=str,
  )
  parser.add_argument(
      "--db",
      default="pose1.db",
      metavar="FILE",
      help="path to config file",
      type=str,
  )
  
  args = parser.parse_args()
  
  db_file = args.project_dir + '/' + args.db
  if not os.path.exists(db_file):
    print("No colmap db found at {0}".format(db_file))
    exit(-1)
  if not os.path.exists(args.project_dir):
    print("No colmap data found at {0}".format(args.project_dir))
    exit(-1)
  
  # keys = {"CAM_PBQ_REAR_LEFT", "CAM_PBQ_FRONT_LEFT"}
  # keys = {"CAM_PBQ_REAR_LEFT", "CAM_PBQ_FRONT_LEFT", "CAM_PBQ_REAR_RIGHT", "CAM_PBQ_FRONT_RIGHT"}
  # Load poses
  img_dir = args.project_dir + '/images/'
  pose_path=img_dir+"pose.json"
  poses = read_json_poses(pose_path)
  
  # Load intrinsics
  param_path=img_dir+"camera_param.json"
  intrinsics = read_json_intrinsics(param_path)
  
  mydb = sqlite3.connect(db_file)
  c = mydb.cursor()
  
  print_table_info(c)
  
  # Write poses and intrinsics to db.
  update_poses_in_db(c, poses, intrinsics)

  mydb.commit()
  c.close()
  mydb.close()
