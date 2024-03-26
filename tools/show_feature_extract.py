import argparse
import pprint
import sqlite3
import os
import sys
import numpy as np
import json
import cv2

IS_PYTHON3 = sys.version_info[0] >= 3

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

def blob_to_array(blob, dtype, shape=(-1,)):
    if IS_PYTHON3:
        return np.fromstring(blob, dtype=dtype).reshape(*shape)
    else:
        return np.frombuffer(blob, dtype=dtype).reshape(*shape)


def show_image_features(image_dir,cursor):
    cursor.execute("SELECT image_id, name FROM images;")
    image_list=cursor.fetchall()
    keypoints = dict(
        (image_id, blob_to_array(data, np.float32, (-1, 2)))
        for image_id, data in cursor.execute("SELECT image_id, data FROM keypoints")
    )
    for image_id,image_name in image_list:
        print(image_id)
        cursor.execute("SELECT data FROM keypoints WHERE image_id=?;",(image_id,))
        image = cv2.imread(image_dir+image_name)
        color = (0, 0, 255)
        for point in keypoints[image_id]:
            # if int(point[1])<100 or int(point[1])>410:
            #     continue
            
            # print(point[0],point[1])
            cv2.circle(image, (int(point[0]),int(point[1])), 3, color, -1)
        save_path="/home/super_point/"+str(image_id)+".png"   
        print(save_path)
        cv2.imwrite(save_path,image)
        # import sys
        # sys.exit(1)
        


if __name__=="__main__":
  parser = argparse.ArgumentParser(description="COLMAP database tool")
  parser.add_argument(
      "--project_dir",
      default="/home/sculpture_project",
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
  
  mydb = sqlite3.connect(db_file)
  cursor = mydb.cursor()
  
  print_table_info(cursor)
  show_image_features(args.project_dir+"/images/",cursor)
  

  mydb.commit()
  cursor.close()
  mydb.close()
