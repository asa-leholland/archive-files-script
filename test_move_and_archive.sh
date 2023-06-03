

#!/bin/bash

# Set the path to the move_and_archive.bat script
script_path="move_and_archive.bat"


# Test case 1: Happy Path - move and archive file

# Log the test case to the terminal
echo -e "\n~~~It should move existing file to from source to target\n"
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
echo -e "\n~~~It should throw an error when File does not exist in source directory\n"
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





# Test case 3: Target directory does not exist

# Log the test case to the terminal
echo -e "\n~~~It should throw an error when Target directory does not exist\n"
mkdir -p src
touch src/file.txt

# Show the contents of the source and target directories before execution
echo "PRE-EXECUTION:"
echo "-Source directory contents:"
ls src
echo ""

if [ -d "tgt" ]; then
  echo "-Target directory contents:"
  ls tgt
  echo ""
else
  echo "-Target directory does not exist"
fi

# Run the test case and log any errors to the terminal
echo "EXECUTING: $script_path src tgt file.txt"
echo ""
cmd.exe /c "$script_path src tgt file.txt" 2>&1 | grep -i "error"

# Show the contents of the source and target directories after execution
echo "POST-EXECUTION:"
echo "-Source directory contents:"
ls src
echo ""

if [ -d "tgt" ]; then
  echo "-Target directory contents:"
  ls tgt
  echo ""
else
  echo "-Target directory does not exist"
fi

# Clean up the test environment
rm -rf src
rm -rf tgt







# Test case 4: Source directory does not exist

# Log the test case to the terminal
echo -e "\n~~~It should throw an error when Source directory does not exist\n"
mkdir -p tgt

# Show the contents of the source and target directories before execution
echo "PRE-EXECUTION:"
if [ -d "src" ]; then
  echo "-Source directory contents:"
  ls src
  echo ""
else
  echo "-Source directory does not exist"
fi

echo "-Target directory contents:"
ls tgt
echo ""

# Run the test case and log any errors to the terminal
echo "EXECUTING: $script_path src tgt file.txt"
echo ""
cmd.exe /c "$script_path src tgt file.txt" 2>&1 | grep -i "error"

# Show the contents of the source and target directories after execution
echo "POST-EXECUTION:"
if [ -d "src" ]; then
  echo "-Source directory contents:"
  ls src
  echo ""
else
  echo "-Source directory does not exist"
fi

echo "-Target directory contents:"
ls tgt
echo ""

# Clean up the test environment
rm -rf src
rm -rf tgt




# Log the test case to the terminal
echo -e "\n~~~It should archive target file if already moved once before using .OLD extension\n"
mkdir -p src
mkdir -p tgt
touch src/file.txt
touch tgt/file.txt


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
