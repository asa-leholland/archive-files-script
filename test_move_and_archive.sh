#!/bin/bash

# Set the path to the move_and_archive.bat script
script_path="move_and_archive.bat"


# Test case 1: Happy Path - move and archive file

# Log the test case to the terminal
echo -e "\n~~~Running test case: Happy path - move and archive file\n"
mkdir -p src
mkdir -p tgt
touch src/file.txt


# Show the contents of the source and target directories before execution
echo "PRE-EXECUTION:"
echo "-Source directory contents:"
ls src
echo ""

echo "-Target directory contents:"
ls tgt
echo ""

# Run the test case and log any errors to the terminal
echo "EXECUTING: $script_path src tgt file.txt"
echo ""
cmd.exe /c "$script_path src tgt file.txt" 2>&1 | grep -i "error"

# Show the contents of the source and target directories after execution
echo "POST-EXECUTION:"
echo "-Source directory contents:"
ls src
echo ""

echo "-Target directory contents:"
ls tgt
echo ""


# Clean up the test environment
rm -rf src
rm -rf tgt




# Test case 2: File does not exist

# Log the test case to the terminal
echo -e "\n~~~Running test case: File does not exist\n"
mkdir -p src
mkdir -p tgt

# Show the contents of the source and target directories before execution
echo "PRE-EXECUTION:"
echo "-Source directory contents:"
ls src
echo ""

echo "-Target directory contents:"
ls tgt
echo ""

# Run the test case and log any errors to the terminal
echo "EXECUTING: $script_path src tgt non_existent_file.txt"
cmd.exe /c "$script_path src tgt non_existent_file.txt" 2>&1 | grep -i "error"
echo ""

# Show the contents of the source and target directories after execution
echo "POST-EXECUTION:"
echo "-Source directory contents:"
ls src
echo ""

echo "-Target directory contents:"
ls tgt
echo ""

# Clean up the test environment
rm -rf src
rm -rf tgt