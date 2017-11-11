export PATH=/opt/ibm/clang-ykt/bin:/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/opt/ibm/clang-ykt/lib:/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export LIBRARY_PATH=/opt/ibm/clang-ykt/lib:/usr/local/cuda/lib64:$LIBRARY_PATH

echo "Compiling for CPU target"

clang-ykt sparselu/src/sparselu.c sparselu/src/sparselu-seq.c sparselu/src/sparselu-task.c sparselu/src/sparselu-task-dep.c sparselu/src/main.c -lrt -lm -std=c99 -O2 -fopenmp -fopenmp-targets=x86_64-unknown-linux-gnu -o sparselu/build/sparselu-targetcpu

echo "Compiling for GPU target"

clang-ykt sparselu/src/sparselu.c sparselu/src/sparselu-seq.c sparselu/src/sparselu-task.c sparselu/src/sparselu-task-dep.c sparselu/src/main.c -lrt -lm -std=c99 -O2 -fopenmp -fopenmp-targets=nvptx64-nvidia-cuda -o sparselu/build/sparselu-targetgpu

echo "Compiling with no target"

clang-ykt  -DNO_TARGET  sparselu/src/sparselu.c sparselu/src/sparselu-seq.c sparselu/src/sparselu-task.c sparselu/src/sparselu-task-dep.c sparselu/src/main.c -lrt -lm -std=c99 -O2 -fopenmp -o sparselu/build/sparselu-targetnone
