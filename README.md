# Move and Archive Script Documentation

## Introduction

Welcome to the documentation for the completed "move_and_archive" project. This project revolves around the concept of batch scripting for efficient file management. The main objective of the project is to automate the process of moving a specific file from a source directory to a target directory, while also archiving the original file in the target directory for backup purposes.

## Purpose

The need for this project arises from the common scenario of managing files in various computer systems. Often, there is a requirement to keep track of important files and maintain backups to safeguard against accidental data loss. Manually performing these tasks can be time-consuming and error-prone. To address this, the "move_and_archive" script offers a streamlined solution that performs these actions automatically.

## Functionality

At its core, the "move_and_archive" script performs the following tasks:

1. **Locating the Source File:** The script takes three arguments: the source directory, the target directory, and the target filename. It searches the source directory for the specified target file.

2. **Moving the File:** Once the target file is located in the source directory, the script moves it to the specified target directory. This step ensures that the file is in the desired location for ongoing use.

3. **Archiving for Backup:** After successfully moving the file to the target directory, the script archives the original file in the same target directory. The archived file is given an "OLD" extension, indicating that it's a backup copy.

## Usage

To utilize the script, follow these steps:

1. Open a terminal or command prompt.
2. Navigate to the directory containing the script.
3. Run the following command:

```sh
./move_and_archive.bat <source dir> <target dir> <target file>
```


Replace `<source dir>` with the path to the source directory, `<target dir>` with the path to the target directory, and `<target file>` with the desired target filename.

## Test Suite

Ensuring the reliability of the script is essential. A test suite is provided to validate the functionality of the "move_and_archive" script. To run the test suite, follow these steps:

1. Open a terminal.
2. Navigate to the directory containing the script.
3. Run the following command:

```
bash test_move_and_archive.sh
```

## Video Demonstration

For a comprehensive visual overview of the script's functionality and usage, a detailed video demonstration is available. The video showcases the complete process and demonstrates how the script efficiently handles moving and archiving files.

[YouTube Video](https://www.youtube.com/watch?v=a-KyHTkYOvw)

## Contact and Feedback

If you have any questions, feedback, or suggestions, please don't hesitate to reach out. Your input is valuable in refining and enhancing the project further.

