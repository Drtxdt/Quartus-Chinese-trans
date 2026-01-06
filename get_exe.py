import os

def generate_exe_md_list(folder_path, output_file="exe_list.md"):
    # 确保路径存在
    if not os.path.exists(folder_path):
        print(f"错误：找不到路径 '{folder_path}'")
        return

    try:
        # 获取文件夹下的所有文件和目录（不包括子目录）
        files = os.listdir(folder_path)
        
        # 过滤出后缀为 .exe 的文件
        exe_files = [f for f in files if f.lower().endswith('.exe') and os.path.isfile(os.path.join(folder_path, f))]

        if not exe_files:
            print("在该文件夹下没有找到任何 .exe 文件。")
            return

        # 写入 Markdown 文件
        with open(output_file, 'w', encoding='utf-8') as f:
            for exe in exe_files:
                f.write(f"- [ ] {exe}\n")
        
        print(f"成功！已将 {len(exe_files)} 个文件写入到 {output_file}")

    except Exception as e:
        print(f"发生错误：{e}")

if __name__ == "__main__":
    # --- 请在这里输入你的文件夹路径 ---
    target_folder = r'D:\quartus\quartus\bin' 
    
    generate_exe_md_list(target_folder)