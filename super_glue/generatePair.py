import os
import sys

def sort_images_by_name(input_folder, output_file):
    # 获取文件夹中的所有图片文件名并按照升序排列
    image_files = sorted([f for f in os.listdir(input_folder) if f.endswith(('.jpg', '.jpeg', '.png'))])

    # 创建一个空列表用于存储前后10张都匹配的相邻图片的名称对
    image_pairs = []
    nums= 1
    # 遍历排序后的图片文件列表，生成前后10张都匹配的相邻图片的名称对
    for i in range(len(image_files)):
        # 获取前后10张图片的索引范围
        start_index = max(0, i - nums)
        end_index = min(len(image_files) - 1, i + nums)
        
        # 生成当前图片与前后10张图片的名称对
        for j in range(start_index, i):
            image_pairs.append((image_files[j], image_files[i]))
        for j in range(i + 1, end_index + 1):
            image_pairs.append((image_files[i], image_files[j]))

    # 将相邻图片的名称对写入输出文件
    with open(output_file, 'w') as f:
        for pair in image_pairs:
            f.write('{} {}\n'.format(pair[0], pair[1]))

    print('Image pairs have been written to {}.'.format(output_file))

if __name__ == "__main__":
    # 检查命令行参数是否正确
    if len(sys.argv) != 3:
        print("Usage: python script.py <input_folder> <output_file>")
        sys.exit(1)
    
    # 获取输入文件夹路径和输出文件路径
    input_folder = sys.argv[1]
    output_file = sys.argv[2]

    # 调用函数对图片进行排序并生成txt文件
    sort_images_by_name(input_folder, output_file)
