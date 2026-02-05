# #!/bin/bash

# # Check if exactly one argument is given
# if [ $# -ne 1 ]; then
#     echo "Usage: $0 <directory>"
#     exit 1
# fi

# DIR="$1"

# # Check if argument is a directory
# if [ ! -d "$DIR" ]; then
#     echo "Error: $DIR is not a valid directory"
#     exit 1
# fi

# # Create backup directory inside the given directory
# mkdir -p "$DIR/backup"

# # Loop through each file in the directory
# for file in "$DIR"/*; do
#     if [ -f "$file" ]; then
#         mv "$file" "$DIR/backup/" &
#         echo "Moving $file in background with PID $!"
#     fi
# done

# # Wait for all background processes to finish
# wait
# echo "All files moved to $DIR/backup/"

!/bin/bash
dir="$1"

# Check if directory exists
if [ ! -d "$dir" ]; then echo "Error: Directory not found."; exit 1; fi

echo "Script PID: $$ running..."
mkdir -p "$dir/backup"

# Loop through files and move them in background
for file in "$dir"/*; do
    if [ -f "$file" ]; then
        mv "$file" "$dir/backup/" &
        echo "Started moving $(basename "$file") with PID: $!"
    fi
done

echo "Waiting for background processes..."
wait
echo "All moves completed."