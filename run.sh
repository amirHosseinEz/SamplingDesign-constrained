#!/bin/bash

# weiyu: should be run from the root directory

# Check if file argument is provided
if [ $# -lt 2 ]; then
    echo "Usage: $0 <result folder> <data file>"
    exit 1
fi

# Check if data file exists
if [ ! -f "$2" ]; then
    echo "Data file $2 not found!"
    exit 1
fi

# create results directory
if [ ! -d "./results" ]; then
    mkdir ./results
    echo "Created directory \"results\""
fi

# create analysis directory
if [ ! -d "./analysis" ]; then
    mkdir ./analysis/
    echo "Directory ./analysis created."
fi

# create graph directory
if [ ! -d "./graphs" ]; then
    mkdir ./graphs/
    echo "Directory ./graphs created."
fi

if [ ! -d "./results/$1" ]; then
    mkdir results/$1
    echo "Directory ./results/$1 created."
fi

if [ ! -d "./analysis/$1" ]; then
    mkdir analysis/$1
    echo "Directory ./analysis/$1 created."
fi

if [ ! -d "./graphs/$1" ]; then
    mkdir graphs/$1
    echo "Directory ./graphs/$1 created."
fi

# compile
make

# Read file line by line
while IFS= read -r line; do
    # Split line into 3 parts: ID, STRUCTURE, IUPAC
    puzzles=($line)

    # Pass the IUPAC string (${puzzles[2]}) to the new flags
    echo "${puzzles[1]}" | ./main --step 500 --best_k 10 --obj ned --boxplot --num_thread 8 --constrained --iupac_constraint "${puzzles[2]}"  > results/$1/${puzzles[0]}.txt

    python analysis.py --folder "$1" --file ${puzzles[0]}.txt > ./analysis/$1/${puzzles[0]}.txt

done < "$2"
