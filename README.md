# SamplingDesign-C

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



### Example Run

```bash
./run.sh example ./data/example.txt --constrained --iupac_constraint "HBVHBGUHVHVHDVBBHDBDBCUGAVGAGVDVBVHBBBVHBHBCGAAACVDBVB"
```

In this example:
* **Structure:** example.txt
* **Constraint Flag:** `1` (Enabled)
* **Constraint String:** `HBVHBGUHVHVHDVBBHDBDBCUGAVGAGVDVBVHBBBVHBHBCGAAACVDBVB`

The results will be saved in ./results/example/. The script then parses the result file to generate learning curves in ./graphs/example/ and output the best solution (based on each metric) into ./analysis/example/.

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


## 🔗 References

1.  **SamplingDesign**:
    SamplingDesign: RNA Design via Continuous Optimization with Coupled Variables and Monte-Carlo Sampling. Wei Yu Tang, Ning Dai, Tianshuo Zhou, David H. Mathews, and Liang Huang*.
    [https://github.com/weiyutang1010/SamplingDesign](https://github.com/weiyutang1010/SamplingDesign)
