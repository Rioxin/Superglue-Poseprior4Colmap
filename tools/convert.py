import sqlite3
import json
import numpy as np
import math

def quaternion_to_euler_angle(qw, qx, qy, qz):
    # 计算旋转矩阵
    rotation_matrix = np.array([
        [1 - 2*qy*qy - 2*qz*qz, 2*qx*qy - 2*qz*qw, 2*qx*qz + 2*qy*qw],
        [2*qx*qy + 2*qz*qw, 1 - 2*qx*qx - 2*qz*qz, 2*qy*qz - 2*qx*qw],
        [2*qx*qz - 2*qy*qw, 2*qy*qz + 2*qx*qw, 1 - 2*qx*qx - 2*qy*qy]
    ])
    
    # 计算欧拉角
    pitch = math.asin(-rotation_matrix[2][0])
    roll = math.atan2(rotation_matrix[2][1], rotation_matrix[2][2])
    yaw = math.atan2(rotation_matrix[1][0], rotation_matrix[0][0])
    
    return pitch, roll, yaw

def convert_db_to_json(db_file, json_file):
    # 连接到数据库
    conn = sqlite3.connect(db_file)
    cursor = conn.cursor()

    # 从数据库中检索数据
    cursor.execute("SELECT * FROM images")
    rows = cursor.fetchall()

    # 关闭数据库连接
    conn.close()

    # 将数据转换为 JSON 格式
    json_data = []
    for row in rows:
        # 从数据库中获取四元数
        qw, qx, qy, qz = row[3], row[4], row[5], row[6]
        
        # 将四元数转换为欧拉角
        pitch, roll, yaw = quaternion_to_euler_angle(qw, qx, qy, qz)
        
        # 创建 JSON 条目
        json_entry = {
            #"image_id": row[0],
            "pitch": pitch,
            "roll": roll,
            "yaw": yaw,
            "timestamp": float(str(row[1]).replace(".png", "")),
            #"timestamp": float(row[1]),  # 将字符串转换为浮点数
            #"camera_id": row[2],
            "x": row[7],
            "y": row[8],
            "z": row[9]
        }
        json_data.append(json_entry)

    # 写入 JSON 文件
    with open(json_file, 'w') as f:
        json.dump(json_data, f, indent=4)

if __name__ == "__main__":
    # 输入数据库文件路径和要保存的 JSON 文件路径
    db_file = "/home/colmap_test/test/test_left/pose1.db"
    json_file = "/home/colmap_test/test/test_left/colmap.json"

    # 执行转换
    convert_db_to_json(db_file, json_file)

