#!/usr/bin/env bash
#SBATCH --time=120:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=6
#SBATCH --output=results/Logs/run.%j.out
#SBATCH --error=results/Logs/run.%j.err
#SBATCH --distribution=cyclic
#SBATCH --spread-job

python_dir=$1
map_name=$2
method_name=$3

for i in `seq 1 $SLURM_NTASKS`; do
    $python_dir/python src/main.py --alg-config=$method_name --env-config=sc2 with env_args.map_name=$map_name
    sleep 2
done
wait

