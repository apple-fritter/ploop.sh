#!/bin/bash

# Check for correct number of arguments
if [[ $# -lt 3 ]]; then
    echo "Usage: $0 [program_name] [tsv_file] [num_columns] [columns_to_process (optional)]"
    exit 1
fi

# Set variables
program_name="$1"              # Name of the external program
tsv_file="$2"                  # Path to TSV file
num_columns="$3"               # Number of columns in TSV file
columns_to_process="$4"        # Optional: columns to pass to program
timestamp=$(date +%Y%m%d_%H%M%S)  # Timestamp for log file name
log_file="${tsv_file%.*}.${timestamp}.log"  # Log file name

# Write arguments to log file
echo "Arguments: $program_name $tsv_file $num_columns $columns_to_process" > "$log_file"

# Start timer
start_time=$(date +%s)

# Loop through TSV file and pass columns to program
while IFS=$'\t' read -r -a row; do
    if [[ ${row[0]} == *#* ]]; then   # Skip rows starting with '#'
        continue
    fi

    # Process only specified columns, if provided
    if [[ -n "$columns_to_process" ]]; then
        processed_columns=""
        for i in $columns_to_process; do
            processed_columns+="${row[$i-1]} "  # Concatenate columns
        done
        eval "$program_name $processed_columns"  # Pass concatenated columns to program
    else
        eval "$program_name ${row[*]}"  # Pass all columns to program
    fi
done < "$tsv_file"

# End timer and write duration to log file
end_time=$(date +%s)
duration=$((end_time - start_time))
echo "Start time: $(date -d @$start_time) | End time: $(date -d @$end_time) | Duration: $duration seconds" >> "$log_file"
