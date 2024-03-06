import sqlite3

def delete_keypoints_table(db_file):
    try:
        # 连接到数据库
        conn = sqlite3.connect(db_file)
        cursor = conn.cursor()
        
        # 检查表是否存在，如果存在则删除
        cursor.execute("DROP TABLE IF EXISTS keypoints")
        print("Table 'keypoints' has been deleted successfully.")
        
        # 提交修改并关闭连接
        conn.commit()
        conn.close()
    except sqlite3.Error as e:
        print("An error occurred:", e)

if __name__ == "__main__":
    db_file = input("Enter the path to the SQLite database file which need delete keypoints: ")
    delete_keypoints_table(db_file)
