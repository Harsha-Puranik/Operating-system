#!/bin/bash
# Shell Script for Piping Commands
# Usage: ./piping_commands.sh

# Function to display the contents of the current directory
list_directory_contents() {
    echo "Listing contents of the current directory:"
    ls -l
    echo ""
}

# Function to filter and sort directory contents
filter_and_sort_contents() {
    read -p "Enter a pattern to filter files (e.g., .txt for text files): " pattern
    echo "Filtering and sorting files with pattern '$pattern'..."
    # Use ls, grep, and sort in a pipeline
    ls -l | grep "$pattern" | sort
    echo ""
}

# Function to check if a file exists
check_file_existence() {
    read -p "Enter the file name to check if it exists: " filename
    if [ -e "$filename" ]; then
        echo "The file '$filename' exists."
    else
        echo "The file '$filename' does not exist."
    fi
    echo ""
}

# Function to count files and directories
count_files_and_directories() {
    file_count=$(find . -maxdepth 1 -type f | wc -l)
    dir_count=$(find . -maxdepth 1 -type d | wc -l)

    echo "Number of files: $file_count"
    echo "Number of directories: $dir_count"
    echo ""
}

# Function to count the number of executable files
count_executable_files() {
    exec_file_count=$(find . -maxdepth 1 -type f -executable | wc -l)
    
    echo "Number of executable files: $exec_file_count"
    echo ""
}

# Main menu for user interaction
echo "Piping Commands Manager"
echo "1. List contents of the current directory"
echo "2. Filter and sort directory contents"
echo "3. Check if a file exists"
echo "4. Count files and directories"
echo "5. Count executable files"
echo "6. Exit"

# Loop until the user chooses to exit
while true; do
    read -p "Select an option (1-6): " option
    case $option in
        1) # List directory contents
            list_directory_contents
            ;;
        2) # Filter and sort directory contents
            filter_and_sort_contents
            ;;
        3) # Check if a file exists
            check_file_existence
            ;;
        4) # Count files and directories
            count_files_and_directories
            ;;
        5) # Count executable files
            count_executable_files
            ;;
        6) # Exit the script
            echo "Exiting the Piping Commands Manager. Goodbye!"
            exit 0
            ;;
        *) # Invalid option
            echo "Invalid option. Please select 1-6."
            ;;
    esac
    echo "" # Print a newline for better readability
done
