@echo off

REM README: execute this script using move_and_archive.bat <source_directory> <target_directory> <file_name>
REM Example: move_and_archive.bat C:\Users\user\Desktop\source C:\Users\user\Desktop\target file.txt


REM Check if the correct number of arguments were provided
if "%~3"=="" (
    echo Usage: %0 ^<source_directory^> ^<target_directory^> ^<file_name^>
    exit /b 1
)

REM Set the source and target directories and file name from the arguments
set "src_dir=%~1"
set "tgt_dir=%~2"
set "file_name=%~3"

REM Check if the source directory exists
if not exist "%src_dir%\" (
    echo Error: Source directory '%src_dir%' does not exist.
    exit /b 1
)

REM Check if the target directory exists
if not exist "%tgt_dir%\" (
    echo Error: Target directory '%tgt_dir%' does not exist.
    exit /b 1
)

REM Check if the file exists in the source directory
if not exist "%src_dir%\%file_name%" (
    echo Error: File '%file_name%' does not exist in source directory '%src_dir%'.
    exit /b 1
)

REM Archive the old file in the target directory with an "OLD" extension for backup if it exists
if exist "%tgt_dir%\%file_name%" (
    move /y "%tgt_dir%\%file_name%" "%tgt_dir%\%~n3.OLD%~x3"
    REM Check if the archive was successful
    if errorlevel 1 (
        echo Error: Failed to archive old file '%file_name%' in target directory '%tgt_dir%'.
        exit /b 1
    )
)

REM Move the file to the target directory
move /y "%src_dir%\%file_name%" "%tgt_dir%\%file_name%"
REM Check if the move was successful
if errorlevel 1 (
    echo Error: Failed to move file '%file_name%' from source directory '%src_dir%' to target directory '%tgt_dir%'.
    exit /b 1
)

echo Successfully moved and archived file '%file_name%'.