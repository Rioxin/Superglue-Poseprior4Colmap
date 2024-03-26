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

def read_and_plot(origi_dir,pose_name):
    trajectory = read_trajectory_from_file(origi_dir+"aligned_"+pose_name+"_trajectory.txt")
    plot_trajectory_xy(trajectory,pose_name)


def main():
    # 读取轨迹文件
    origin_dir="/home/super_point/test1/"
    read_and_plot(origin_dir,"rtk")
    # read_and_plot(origin_dir,"rtk")
    read_and_plot(origin_dir,"smooth")
    # read_and_plot(origin_dir,"colmap")
    # read_and_plot(origin_dir,"super_glue")
    

    # 设置图例和标题
    plt.legend()
    plt.xlabel('X')
    plt.ylabel('Y')
    plt.title('XOY Trajectories')

    plt.tight_layout() 
    plt.show()
    plt.close()  

if __name__ == "__main__":
    main()
