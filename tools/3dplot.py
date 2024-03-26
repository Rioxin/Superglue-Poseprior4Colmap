import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

def read_trajectory_from_file(filename):
    trajectory = []
    with open(filename, 'r') as file:
        for line in file:
            pose = [float(value) for value in line.strip().split()]
            trajectory.append(pose)
    return trajectory

def plot_trajectory_xyz(trajectory, title):
    x_values = [pose[1] for pose in trajectory]
    y_values = [pose[2] for pose in trajectory]
    z_values = [pose[3] for pose in trajectory]

    plt.plot(x_values, y_values, z_values, label=title)

def main():
    # 读取轨迹文件
    base_path = "/home/colmap_test/test/test_right/sparse/"
    gt_file = "aligned_rtk_trajectory.txt"
    gnss_file = "aligned_gnss_trajectory.txt"
    smooth_file = "aligned_smooth_trajectory.txt"
    colmap_file = "aligned_colmap_trajectory.txt"

    gt_trajectory = read_trajectory_from_file(base_path + gt_file)
    gnss_trajectory = read_trajectory_from_file(base_path + gnss_file)
    smooth_trajectory = read_trajectory_from_file(base_path + smooth_file)
    colmap_trajectory = read_trajectory_from_file(base_path + colmap_file)
    
    # 绘制xyz空间上的轨迹
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    plot_trajectory_xyz(gt_trajectory, "Gt Trajectory")
    plot_trajectory_xyz(gnss_trajectory, "Gnss Trajectory")
    plot_trajectory_xyz(smooth_trajectory, "Smooth Trajectory")
    plot_trajectory_xyz(colmap_trajectory, "Colmap Trajectory")
    
    ax.legend()
    ax.set_xlabel('X')
    ax.set_ylabel('Y')
    ax.set_zlabel('Z')
    ax.set_title('XYZ Trajectories')
    plt.axis('equal')
    plt.tight_layout() 
    plt.show()
    plt.close()  

if __name__ == "__main__":
    main()
