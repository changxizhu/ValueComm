#!/usr/bin/env bash

map_name="5m_vs_6m"
sbatch -J $map_name -p "gpu_a100" --gpus-per-node 1 --cpus-per-task 12 per_job.sh $map_name

