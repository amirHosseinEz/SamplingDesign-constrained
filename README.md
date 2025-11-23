# SamplingDesign-C: Constrained RNA Design

**An extension of the SamplingDesign algorithm that supports designing RNA sequences under specific IUPAC nucleotide constraints.**

## 🧬 Overview

This repository contains **SamplingDesign-C**, a C++ implementation of an RNA design algorithm based on partition function sampling. Unlike the original version, this implementation allows users to impose **IUPAC constraints** on the design process.

The algorithm samples sequences from a probability distribution optimized to maximize the probability of the target structure, while ensuring that every sampled sequence strictly adheres to user-defined sequence constraints (e.g., "Position 1 must be a G", "Position 5 must be a Purine").

## 📦 Compilation

To compile the code, use the provided `Makefile` or compile directly using `g++`.

```bash
make
# OR
g++ -O3 -std=c++11 -fopenmp main.cpp -o main
```

## 💻 Usage

### Basic Command

The program reads the target secondary structure from **standard input (stdin)** and takes configuration parameters as command-line arguments.

```bash
echo "((...))" | ./main [OPTIONS] ... [CONSTRAINED_FLAG] [IUPAC_STRING]
```

**Note:** The C++ code expects arguments in a specific positional order. Ensure your constraint flag and string are passed as the **31st** and **32nd** arguments respectively (or handled via the provided shell wrapper).

### Example Run

```bash
echo "((...))" | ./main ncrna_design prob targeted 0.75 1 1 0 0.9 0.999 0.01 0 0.96 0 10 50 5000 0 50 100 0 0 2500 10 0 1 1 42 0 0 0 1 "NNNRAAA"
```

In this example:
* **Structure:** `((...))`
* **Constraint Flag:** `1` (Enabled)
* **Constraint String:** `NNNRAAA`

### IUPAC Code Reference (RNA)

| IUPAC nucleotide code | Base | Meaning |
| :--- | :--- | :--- |
| **A** | Adenine | Adenine |
| **C** | Cytosine | Cytosine |
| **G** | Guanine | Guanine |
| **U** | Uracil | Uracil (replaces T) |
| **R** | A or G | Purine |
| **Y** | C or U | Pyrimidine |
| **S** | G or C | Strong interaction |
| **W** | A or U | Weak interaction |
| **K** | G or U | Keto |
| **M** | A or C | Amino |
| **B** | C or G or U | Not A |
| **D** | A or G or U | Not C |
| **H** | A or C or U | Not G |
| **V** | A or C or G | Not U |
| **N** | A, C, G, or U | Any base |
| **.** or **-** | - | Gap |

## 📂 Batch Processing

A shell script is provided to process a list of puzzles automatically:

```bash
./run_batch.sh <result_folder_name> <data_file.txt>
```

**Data File Format:**
Each line in the data file should contain three columns:
```text
<Puzzle_ID>  <DotBracket_Structure>  <IUPAC_Constraint>
```

## 🔗 References

1.  **SamplingDesign**:
    SamplingDesign: RNA Design via Continuous Optimization with Coupled Variables and Monte-Carlo Sampling. Wei Yu Tang, Ning Dai, Tianshuo Zhou, David H. Mathews, and Liang Huang*.
    [https://github.com/weiyutang1010/SamplingDesign](https://github.com/weiyutang1010/SamplingDesign)
