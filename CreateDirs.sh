#!/bin/bash
# creates dirs from N to N+10

# USAGE:
# ./script.sh N
# where N is positive number. Created dirs from N to N+10

# to delete use
#rmdir {1..10}

usage()
{
    echo "USAGE: ./script.sh N, where N is positive number. Created dirs from N to N+10"
}

[[ $# -ne 1 ]] && usage && exit 1

begin=$1

[[ "$begin" -lt 0 ]] && echo Use positive number, not $begin && usage && exit 2

end=$(( $begin + 10 ))

while [[ "$begin" -le "$end" ]];
do
    if [[ -e "$begin" ]]
    then
        echo File $begin already exists
        begin=$(( begin + 1 ))
        continue
    fi
    mkdir -v "$begin"
    begin=$(( begin + 1 ))
done
