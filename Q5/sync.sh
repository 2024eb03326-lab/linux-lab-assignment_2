# #!/bin/bash

# dir1="dirA"
# dir2="dirB"

# echo "Files only in $dir1:"
# comm -23 <(ls "$dir1" | sort) <(ls "$dir2" | sort)

# echo
# echo "Files only in $dir2:"
# comm -13 <(ls "$dir1" | sort) <(ls "$dir2" | sort)

# echo
# echo "Files in both with different contents:"
# for f in $(ls "$dir1"); do
#     if [ -f "$dir2/$f" ]; then
#         cmp -s "$dir1/$f" "$dir2/$f" || echo "$f differs"
#     fi
# done
#!/bin/bash

# Check if directories exist
if [ ! -d "dirA" ] || [ ! -d "dirB" ]; then
    echo "Error: dirA or dirB missing."
    exit 1
fi

echo "Files only in dirA:"
comm -23 <(ls dirA | sort) <(ls dirB | sort)

echo ""
echo "Files only in dirB:"
comm -13 <(ls dirA | sort) <(ls dirB | sort)

echo ""
echo "Files in both with different contents:"
# Loop through files common to both directories
for file in $(comm -12 <(ls dirA | sort) <(ls dirB | sort)); do
    if ! cmp -s "dirA/$file" "dirB/$file"; then
        echo "$file differs"
    fi
done