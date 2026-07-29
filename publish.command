#!/bin/bash

cd "$(dirname "$0")"

clear

echo "==========================================="
echo "     New Roots Website Publisher"
echo "==========================================="
echo ""

# Show changed files
FILES=$(git diff --name-only)
STAGED=$(git diff --cached --name-only)

if [ -z "$FILES" ] && [ -z "$STAGED" ]; then
    echo "✅ No changes to publish."
    echo ""
    read -p "Press Enter to close..."
    exit 0
fi

echo "Files to publish:"
echo "-----------------"

git diff --name-only

echo ""

git add .

echo ""
echo "Enter a commit message."
echo "(Leave blank to use a timestamp.)"
echo ""

read -p "Commit message: " MESSAGE

if [ -z "$MESSAGE" ]; then
    MESSAGE="Update $(date '+%Y-%m-%d %H:%M:%S')"
fi

echo ""
echo "Commit message:"
echo "  $MESSAGE"
echo ""

read -p "Publish? (Y/n): " CONFIRM

if [[ "$CONFIRM" =~ ^[Nn]$ ]]; then
    echo "Cancelled."
    read -p "Press Enter..."
    exit 0
fi

git commit -m "$MESSAGE"

git push

echo ""
echo "✅ Website published!"
echo ""

open https://kowiedesign.github.io/new-roots-internal/

read -p "Press Enter to close..."