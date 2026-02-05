# #!/bin/bash

# pass_all=0
# fail_one=0

# while IFS=',' read -r roll name m1 m2 m3
# do
#     fails=0
#     for m in $m1 $m2 $m3
#     do
#         [ "$m" -lt 33 ] && fails=$((fails+1))
#     done

#     if [ "$fails" -eq 0 ]; then
#         echo "$name passed all subjects"
#         pass_all=$((pass_all+1))
#     elif [ "$fails" -eq 1 ]; then
#         echo "$name failed exactly one subject"
#         fail_one=$((fail_one+1))
#     fi
# done < marks.txt

# echo "Total students passed all subjects: $pass_all"
# echo "Total students failed exactly one subject: $fail_one"
!/bin/bash
failed_one_count=0
passed_all_count=0

echo "--- Students who failed in exactly ONE subject ---"
while IFS=',' read -r roll name m1 m2 m3; do
    fail_count=0
    if [ "$m1" -lt 33 ]; then ((fail_count++)); fi
    if [ "$m2" -lt 33 ]; then ((fail_count++)); fi
    if [ "$m3" -lt 33 ]; then ((fail_count++)); fi

    if [ "$fail_count" -eq 1 ]; then
        echo "$name (Roll: $roll)"
        ((failed_one_count++))
    elif [ "$fail_count" -eq 0 ]; then
        ((passed_all_count++))
    fi
done < marks.txt

echo ""
echo "--- Students who passed in ALL subjects ---"
while IFS=',' read -r roll name m1 m2 m3; do
    fail_count=0
    if [ "$m1" -lt 33 ]; then ((fail_count++)); fi
    if [ "$m2" -lt 33 ]; then ((fail_count++)); fi
    if [ "$m3" -lt 33 ]; then ((fail_count++)); fi

    if [ "$fail_count" -eq 0 ]; then
        echo "$name (Roll: $roll)"
    fi
done < marks.txt

echo ""
echo "Total who failed exactly 1 subject: $failed_one_count"
echo "Total who passed all subjects: $passed_all_count"