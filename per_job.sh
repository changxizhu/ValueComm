#!/usr/bin/env bash
#SBATCH --time=120:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --output=results/Logs/run.%j.out
#SBATCH --error=results/Logs/run.%j.err
#SBATCH --distribution=cyclic
#SBATCH --spread-job

map_name=$1

for i in `seq 1 $SLURM_NTASKS`; do
    nohup python src/main.py --alg-config=tgcnet --env-config=sc2 with env_args.map_name="8m_vs_9m" > output"${i}".log 2>&1 &
    sleep 5
done
wait

