import matplotlib.pyplot as plt

def read_trajectory_from_file(filename):
    trajectory = []
    with open(filename, 'r') as file:
        for line in file:
            pose = [float(value) for value in line.strip().split()]
            trajectory.append(pose)
    return trajectory

def plot_trajectory_xy(trajectory, title):
    x_values = [pose[1] for pose in trajectory]
    y_values = [pose[3] for pose in trajectory]

    plt.plot(x_values, y_values, label=title)

def main():
    # 读取轨迹文件
    base_path = "/home/qcraft/colmap_test/test/test_right/sparse/"
    gt_file = "aligned_rtk_trajectory.txt"
    gnss_file = "aligned_gnss_trajectory.txt"
    smooth_file = "aligned_smooth_trajectory.txt"
    colmap_file = "aligned_colmap_trajectory.txt"

    gt_trajectory = read_trajectory_from_file(base_path + gt_file)
    gnss_trajectory = read_trajectory_from_file(base_path + gnss_file)
    smooth_trajectory = read_trajectory_from_file(base_path + smooth_file)
    colmap_trajectory = read_trajectory_from_file(base_path + colmap_file)
    
    # 绘制xy平面上的轨迹
    plot_trajectory_xy(gt_trajectory, "Gt Trajectory")
    plot_trajectory_xy(gnss_trajectory, "Gnss Trajectory")
    plot_trajectory_xy(smooth_trajectory, "Smooth Trajectory")
    plot_trajectory_xy(colmap_trajectory, "Colmap Trajectory")
    
    plt.axis('equal')
    plt.legend()
    plt.xlabel('X')
    plt.ylabel('Y')
    plt.title('XOY Trajectories')

    plt.tight_layout() 
    plt.show()
    plt.close()  

if __name__ == "__main__":
    main()
