#!/bin/bash

# Define the file path
file_path="the_file.txt"

# Read the contents of the file into a variable while preserving newlines
file_contents=$(<"$file_path")

# Escape double quotes and newline characters in the file contents
escaped_contents=$(echo "$file_contents" | sed 's/"/\\"/g' | awk '{printf "%s\\n", $0}')

echo $escaped_contents
# Construct the JSON payload with the properly formatted content
json_payload="{\"body\":\"$escaped_contents\"}"

echo $json_payload > my_file.json

curl -X POST  \
-H "Accept: application/vnd.github+json" \
-H "Authorization: token $token" \
-H "X-GitHub-Api-Version: 2022-11-28" \
https://api.github.com/repos/marly10/k8s_project/issues/2/comments \
-d "$json_payload"

#-d '{"body":"GeeksForGeeks\n\nOne stop solution for CS subjects"}'
# -d '{"body":"GeeksForGeeks\\n\\nOne stop solution for CS subjects"}'

#https://github.com/marly10/k8s_project/pull/2


