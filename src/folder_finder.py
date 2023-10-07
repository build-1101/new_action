import os

def find_aws_folder_with_json(start_dir):
    current_dir = os.path.abspath(start_dir)

    while True:
        aws_folder = os.path.join(current_dir, ".aws")
        if os.path.isdir(aws_folder):
            json_file = os.path.join(aws_folder, "the.json")
            if os.path.isfile(json_file):
                return aws_folder
        # Move up one level in the directory tree
        parent_dir = os.path.dirname(current_dir)
        if parent_dir == current_dir:
            # Reached the root directory, .aws folder not found
            break
        current_dir = parent_dir

    return None  # .aws folder with the required JSON file not found

if __name__ == "__main__":
    print(f"what is this: {os.getcwd()}")
    aws_folder = find_aws_folder_with_json(os.getcwd())
    if aws_folder:
        print(f"Found .aws folder with the.json file at: {aws_folder}")
    else:
        print(".aws folder with the.json file not found.")
