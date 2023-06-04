#!/bin/bash

# Output file for the report
report_file="permissions_report.txt"

# Function to check file permissions and recommend changes
check_permissions() {
    file="$1"
    permissions=$(stat -c "%A" "$file")
    numeric_permissions=$(stat -c "%a" "$file")
    insecure_permissions=("777" "776" "775" "774" "773" "772" "771" "770" "666" "664" "662" "646" "642" "640")

    if [[ "${insecure_permissions[*]}" =~ "$numeric_permissions" ]]; then
        # File has insecure permissions
        echo "File: $file" >> "$report_file"
        echo "Permissions: $permissions" >> "$report_file"
        echo "Security Status: Insecure" >> "$report_file"
        echo "Advice: The file has insecure permissions. Please consider changing them to more restrictive ones." >> "$report_file"
        echo >> "$report_file"
    fi
}

# Function to calculate the estimated remaining time
calculate_remaining_time() {
    elapsed_time=$1
    completed_files=$2
    total_files=$3
    remaining_files=$((total_files - completed_files))
    if [ "$remaining_files" -gt 0 ]; then
        remaining_time=$((elapsed_time * remaining_files / completed_files))
        remaining_hours=$((remaining_time / 3600))
        remaining_minutes=$(((remaining_time / 60) % 60))
        echo "Estimated remaining time: $remaining_hours hour(s) $remaining_minutes minute(s)"
    fi
}

# Function to run the audit
run_audit() {
    clear
    echo "=============================="
    echo "         AUDIT IN PROGRESS"
    echo "=============================="
    echo
    echo "Enter the directory to scan (e.g., /etc): "
    read -r directory

    if [ ! -d "$directory" ]; then
        echo "Invalid directory. Please try again."
        echo
        echo "Press enter to return to the main menu."
        read -r
        return
    fi

    echo
    echo "Please wait..."

    # Clear previous report file
    > "$report_file"

    # Find files and directories under the specified directory
    start_time=$(date +%s)
    completed_files=0
    total_files=$(find "$directory" -type f | wc -l)
    while IFS= read -r -d '' file; do
        check_permissions "$file"
        ((completed_files++))
        current_time=$(date +%s)
        elapsed_time=$((current_time - start_time))
        clear
        echo "=============================="
        echo "         AUDIT IN PROGRESS"
        echo "=============================="
        echo
        echo "Please wait..."
        calculate_remaining_time "$elapsed_time" "$completed_files" "$total_files"
    done < <(find "$directory" -type f -print0)

    echo
    echo "Audit completed. The report has been saved to: $report_file"
    echo
    echo "Press enter to return to the main menu."
    read -r
}

# Function to display the main menu
display_menu() {
    clear
    echo "=============================="
    echo "         SPYDERBYTE"
    echo "         By Jen"
    echo "=============================="
    echo
    echo "───▐──▌───────▐──▌───"
    echo "───▐▌─█───────█─▐▌───"
    echo "──▄█──▀▀▄▌▄▐▄▀▀──█▄──"
    echo "─▐█─▄█▀▄█████▄▀█▄─█▌─"
    echo "──▀▀─▄▄▄█████▄▄▄─▀▀──"
    echo "───▄█▀─▄▀███▀▄─▀█▄───"
    echo "─▄█──▄▀──███──▀▄──█▄─"
    echo "▐█───█───▐█▌───█───█▌"
    echo "─█────█───▀───█────█─"
    echo "─▀█───█───────█───█▀─"
    echo "──█────█─────█────█──"
    echo "───█───█─────█───█───"
    echo "────▌───▌───▐───▐────"
    echo
    echo "1. Run Audit"
    echo "2. Exit"
    echo
    echo "Enter your choice: "
}

# Function to handle user input
handle_input() {
    read -r choice
    case $choice in
         1) run_audit ;;
         2) exit ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
}

# Main loop
while true; do
    display_menu
    handle_input
done
