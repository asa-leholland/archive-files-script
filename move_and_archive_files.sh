#!/bin/bash

# Check if the correct number of arguments were provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <source_directory> <target_directory> <file_name>"
    exit 1
fi

# Set the source and target directories and file name from the arguments
src_dir="$1"
tgt_dir="$2"
file_name="$3"

# Check if the source directory exists
if [ ! -d "$src_dir" ]; then
    echo "Error: Source directory '$src_dir' does not exist."
    exit 1
fi

# Check if the target directory exists
if [ ! -d "$tgt_dir" ]; then
    echo "Error: Target directory '$tgt_dir' does not exist."
    exit 1
fi

# Check if the file exists in the source directory
if [ ! -e "$src_dir/$file_name" ]; then
    echo "Error: File '$file_name' does not exist in source directory '$src_dir'."
    exit 1
fi

# Move the file to the target directory
mv "$src_dir/$file_name" "$tgt_dir/$file_name"

# Check if the move was successful
if [ "$?" -ne 0 ]; then
    echo "Error: Failed to move file '$file_name' from source directory '$src_dir' to target directory '$tgt_dir'."
    exit 1
fi

# Archive the old file in the target directory with an "OLD" extension for backup
mv "$tgt_dir/$file_name" "$tgt_dir/${file_name%.*}.OLD.${file_name##*.}"

# Check if the archive was successful
if [ "$?" -ne 0 ]; then
    echo "Error: Failed to archive old file '$file_name' in target directory '$tgt_dir'."
    exit 1
fi

echo "Successfully moved and archived file '$file_name'."