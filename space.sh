#!/bin/bash

# Gets the overall use of the partition of the directory (current directory by default), the biggest folders (5 by default) and the biggest files (5 by default).

usage() {
    echo "Usage: $0 [OPTIONS] [PATH]"
    echo ""
    echo "Analyze disk usage: shows partition usage, and the largest directories and files."
    echo ""
    echo "Options:"
    echo "  -d <number>    Number of largest directories to show (default: 5)"
    echo "  -f <number>    Number of largest files to show (default: 5)"
    echo "  -h             Show this help message"
    echo ""
    echo "Arguments:"
    echo "  PATH           Path to analyze. Defaults to current directory if omitted."
    echo ""
    echo "Example:"
    echo "  $0 -d 10 -f 20 /var/log"
}

# Get parameters
dir="."         # default directory
numdir="5"      # default number of maximum dirs results
numfiles="5"    # default number of maximum files results

while (( $# > 0 )) do
    case $1 in
        -d)
            numdir=$2
            shift 2 ;;
        -f)
            numfiles=$2
            shift 2 ;;
        -h) 
            usage
            shift 1 
            exit 0;;
        *)
            if [[ -a $1 ]]; then 
                dir=$1
                shift 1 
            else
                echo "Error: '$1': No such file or directory."
                exit
            fi ;;
    esac            
done

# Gets the overall use of the filesystem
echo "Current use of the filesystem on which the dir $dir is mounted:"
df -h "$dir"

# Gets the biggest directories
if (( numdir > 0 )); then
    echo -e "\nBiggest directories:"
    du -d 1 -h "$dir" 2>/dev/null | sort -rh | sed 1d | head -n "$numdir" 
fi

# Gets the biggest files
if (( numfiles > 0 )); then
    echo -e "\nBiggest files:"
    find "$dir" -type f -exec du -h {} + 2>/dev/null | sort -rh | head -n "$numfiles"
fi
