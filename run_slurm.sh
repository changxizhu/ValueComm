#!/usr/bin/env bash

map_name="5m_vs_6m"
method_name="tgcnet"
python_dir=/scratch/zhu00030/anaconda3/envs/transfer/bin

sbatch -J $map_name -p "gpua100" --gpus-per-node 1 --cpus-per-task 12 per_job.sh $python_dir $map_name $method_name

