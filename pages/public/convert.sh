#!/bin/bash

# Input file containing the word list (one word per line)
input_file="wordlist.txt"

# Output file to store the JavaScript array
output_file="wordlist.js"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
  echo "Error: Input file '$input_file' not found."
  exit 1
fi

# Create the JavaScript array in the output file
echo "const wordList = [" > "$output_file"

# Read each line from the input file and format it as a JavaScript string
while IFS= read -r line; do
  # Escape single quotes in the word (if any)
  escaped_line="${line//\'/\'}"

  # Add the word to the array, enclosed in single quotes and followed by a comma
  echo "  '$escaped_line'," >> "$output_file"
done < "$input_file"

# Remove the trailing comma from the last element
sed -i '$ s/,$//' "$output_file"

# Close the JavaScript array
echo "];" >> "$output_file"

echo "Successfully converted '$input_file' to '$output_file'"
