# kastors-omptarget
Kastors benchmark with added offloading support to gpu and cpu with clang


# Compile

To compile with an offloading target, just add the -fopenmp-targets=< target > flag to the compilation commands

- Sparselu:

 `clang sparselu/src/sparselu.c sparselu/src/sparselu-seq.c sparselu/src/sparselu-task.c sparselu/src/sparselu-task-dep.c sparselu/src/main.c -lrt -lm -std=c99 -O2 -fopenmp -o sparselu/build/sparselu`
