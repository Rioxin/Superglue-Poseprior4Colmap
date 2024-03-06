import json
import numpy as np

def quaternion_to_euler_angle(qw, qx, qy, qz):
    """
    Convert quaternion to euler angles (roll, pitch, yaw)
    """
    # 计算旋转矩阵
    rotation_matrix = np.array([
        [1 - 2 * (qy ** 2 + qz ** 2), 2 * (qx * qy - qz * qw), 2 * (qx * qz + qy * qw)],
        [2 * (qx * qy + qz * qw), 1 - 2 * (qx ** 2 + qz ** 2), 2 * (qy * qz - qx * qw)],
        [2 * (qx * qz - qy * qw), 2 * (qy * qz + qx * qw), 1 - 2 * (qx ** 2 + qy ** 2)]
    ])
    # 计算欧拉角
    roll = np.arctan2(rotation_matrix[2, 1], rotation_matrix[2, 2])
    pitch = np.arctan2(-rotation_matrix[2, 0], np.sqrt(rotation_matrix[2, 1] ** 2 + rotation_matrix[2, 2] ** 2))
    yaw = np.arctan2(rotation_matrix[1, 0], rotation_matrix[0, 0])
    return roll, pitch, yaw

def extract_data_from_txt(txt_file):
    data_list = []
    with open(txt_file, 'r') as file:
        for line in file:
            if '.png' in line:
                data = line.split()
                timestamp_str = data.pop(-1).split('.png')[0]  # 获取最后一个元素，移除时间戳部分并转换为字符串
                timestamp = float(timestamp_str)
                qw, qx, qy, qz = map(float, data[1:5])  # 提取四元数
                tx, ty, tz = map(float, data[5:8])  # 提取平移向量
                camera_id = int(data[8])  # 提取相机ID
                roll, pitch, yaw = quaternion_to_euler_angle(qw, qx, qy, qz)  # 转换为欧拉角
                data_list.append({
                    "timestamp": timestamp,
                    # "qw": qw,
                    # "qx": qx,
                    # "qy": qy,
                    # "qz": qz,
                    "pitch": pitch,
                    "roll": roll,
                    "yaw": yaw,
                    "x": tx,
                    "y": ty,
                    "z": tz
                })
    sorted_data_list= sorted(data_list,key=lambda x:x["timestamp"])           
    return sorted_data_list

def data_to_json(data_list, json_file):
    with open(json_file, 'w') as f:
        json.dump(data_list, f, indent=4)

if __name__ == "__main__":
    origin_dir="/home/qcraft/colmap_test/test/test_right/sparse"
    txt_file = origin_dir+"/images.txt"
    json_file = origin_dir+"/colmap_pose.json"
    data_list = extract_data_from_txt(txt_file)
    data_to_json(data_list, json_file)
