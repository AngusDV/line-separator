#!/bin/bash

# Check if $1 is empty
if [ -z "$1" ]; then
  echo "Error: Parameter address of file  is required."
  exit 1
fi

# Check if $2 is empty
if [ -z "$2" ]; then
  echo "Error: Parameter total per record is required ."
  exit 1
fi


# Set the input and output file names
input_file=$1
input_file="${input_file//./ }"
read -r first second <<< "$input_file"
input_file=$first"."$second
output_prefix=$first"_"



# Set the number of lines to split by (adjust as needed)

lines_per_file=$2

# Count the number of lines in the input file
total_lines=$(grep -c "" "$input_file")

# Calculate the number of output files needed
num_files=$((total_lines / lines_per_file))

# Split the input file into multiple output files
current_file=0
current_line=0
output_file="$output_prefix$current_file.json"
while read -r line; do
  if [ $current_line -eq 0 ]; then
	  line=$(echo "["$line)	
  fi

  if [ $((current_line + 1)) -eq $lines_per_file ]; then
	  line=$(echo "$line" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' -e 's/[,^M]*$//') 
	  line=$(echo $line"]")
	  
  fi	  
  
  echo "$line" >> "$output_file"
  current_line=$((current_line + 1))

 if [ $current_line -eq $lines_per_file ]; then 
    current_file=$((current_file + 1))
    current_line=0
    output_file="$output_prefix$current_file.json"
  fi
done < "$input_file"

# Rename the output files with sequential numbers
for ((i=0; i<num_files; i++)); do
  mv "${output_prefix}$i.json" "${output_prefix}$(printf '%03d' $i).json"
done

