#!/bin/bash

# Initialize variables
VERBOSE=0
OUTPUT_FILE=""

# Define the options string: 'v' for no argument, 'o:' for an argument
while getopts "vo:" flag
do
    case "${flag}" in
        v)
            VERBOSE=1
            ;;
        o)
            OUTPUT_FILE="${OPTARG}"
            ;;
        *)
            echo "Invalid option: -${OPTARG}" >&2
            exit 1
            ;;
    esac
done

# Shift the positional parameters so that non-option arguments are accessible
shift $(($OPTIND - 1))

# Main logic
if [ "$VERBOSE" -eq 1 ]; then
    echo "Verbose mode enabled".
fi

if [ -n "$OUTPUT_FILE" ]; then
    echo "Output file specified: $OUTPUT_FILE"
fi

# Access non-flag arguments
echo "Remaining arguments: $@"
