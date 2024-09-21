import os
import shutil
import concurrent.futures

def compress_folder(folder_path):
    # Define the output zip file path
    zip_file_path = folder_path + ".zip"
    
    # Compress the folder using shutil
    shutil.make_archive(folder_path, 'zip', folder_path)
    
    print(f"Compressed {folder_path} into {zip_file_path}")

def compress_folders_concurrently(base_directory):
    # List all directories in the base directory
    folders = [os.path.join(base_directory, folder_name) 
               for folder_name in os.listdir(base_directory) 
               if os.path.isdir(os.path.join(base_directory, folder_name))]
    
    # Use ThreadPoolExecutor for concurrent compression
    with concurrent.futures.ThreadPoolExecutor() as executor:
        executor.map(compress_folder, folders)

# Set the base directory containing folders to compress
base_directory = r"" # Your base folders directory
compress_folders_concurrently(base_directory)
