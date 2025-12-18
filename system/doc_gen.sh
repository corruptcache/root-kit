#!/bin/bash
# ==============================================================================
# @name:        doc_gen.sh
# @description: Universally scans the current repo and generates a Markdown table from script headers.
# @dependencies: grep, sed, find
# ==============================================================================

# Output the Markdown Table Header
echo "| Script | Description | Dependencies |"
echo "| :--- | :--- | :--- |"

# Find all .sh files (ignoring hidden files and the doc_gen script itself)
find . -type f -name "*.sh" ! -path "*/.*" ! -name "doc_gen.sh" | sort | while read -r file; do

    # Extract the relative path for the link
    rel_path="${file#./}"

    # 1. Extract @name (fallback to filename if missing)
    name=$(grep "@name:" "$file" | head -n 1 | cut -d':' -f2- | sed 's/^ *//')
    if [ -z "$name" ]; then
        name=$(basename "$file")
    fi

    # 2. Extract @description
    desc=$(grep "@description:" "$file" | head -n 1 | cut -d':' -f2- | sed 's/^ *//')
    if [ -z "$desc" ]; then
        desc="*No description provided.*"
    fi

    # 3. Extract @dependencies
    deps=$(grep "@dependencies:" "$file" | head -n 1 | cut -d':' -f2- | sed 's/^ *//')
    if [ -z "$deps" ]; then
        deps="-"
    fi

    # Output the row
    echo "| [\`$name\`]($rel_path) | $desc | $deps |"

done
