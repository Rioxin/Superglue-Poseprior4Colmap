import os
import cv2
import sys
import numpy as np

def shrink_mask(input_mask_dir, output_mask_dir):
    # 确保输出目录存在
    os.makedirs(output_mask_dir, exist_ok=True)
    
    # 遍历输入目录中的所有mask图片
    for filename in os.listdir(input_mask_dir):
        if filename.endswith(('.jpg', '.jpeg', '.png')):
            # 构建输入mask图片路径
            input_mask_path = os.path.join(input_mask_dir, filename)
            
            # 读取输入mask图片
            mask_img = cv2.imread(input_mask_path, cv2.IMREAD_GRAYSCALE)
            
            # 确保图片读取成功
            if mask_img is None:
                print(f"Failed to read mask image {filename}. Skipping...")
                continue
            
            # 二值化 mask 图像
            _, mask_img = cv2.threshold(mask_img, 127, 255, cv2.THRESH_BINARY)
            
            # 缩小白色部分（腐蚀操作）
            kernel_erode = np.ones((15, 15), np.uint8)  # 定义腐蚀的核
            eroded_mask = cv2.erode(mask_img, kernel_erode, iterations=1)  # 执行腐蚀操作
            
            # 构建输出图片路径
            output_mask_path = os.path.join(output_mask_dir, filename)
            
            # 保存经过缩小白色部分的新的mask
            cv2.imwrite(output_mask_path, eroded_mask)
            print(f"Shrinked mask image saved: {output_mask_path}")

if __name__ == "__main__":
    # 检查命令行参数是否正确
    if len(sys.argv) != 3:
        print("Usage: python script.py <input_mask_dir> <output_mask_dir>")
        sys.exit(1)
    
    # 获取输入mask文件夹路径和输出mask文件夹路径
    input_mask_dir = sys.argv[1]
    output_mask_dir = sys.argv[2]
    
    # 执行缩小白色部分的mask操作
    shrink_mask(input_mask_dir, output_mask_dir)
