#!/bin/bash

# Set the source and target directories
src_dir="/path/to/source/directory"
tgt_dir="/path/to/target/directory"

# Set the file name
file_name="file.txt"

# Check if the file exists in the source directory
if [ -e "$src_dir/$file_name" ]; then
    # Move the file to the target directory
    mv "$src_dir/$file_name" "$tgt_dir/$file_name"
    # Archive the old file in the target directory with an "OLD" extension for backup
    mv "$tgt_dir/$file_name" "$tgt_dir/${file_name%.*}.OLD.${file_name##*.}"
fi