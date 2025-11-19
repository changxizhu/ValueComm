#!/usr/bin/env bash

# Python environment
python_dir=/scratch/zhu00030/anaconda3/envs/transfer/bin

# Lists of map names and methods
# map_names=("2s3z" "3s5z" "3s5z_vs_3s6z")
map_names=("8m_vs_9m" "10m_vs_11m")
methods=("tgcnet" "maic")

# Loop over all combinations
for map_name in "${map_names[@]}"; do
    for method_name in "${methods[@]}"; do
        echo "Submitting job: map=$map_name, method=$method_name"
        sbatch -J "$map_name" -p "gpua100" per_job.sh "$python_dir" "$map_name" "$method_name"
    done
done


