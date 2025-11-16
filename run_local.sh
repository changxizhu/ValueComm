#!/usr/bin/env bash


# 3m 5m_vs_6m 8m_vs_9m 10m_vs_11m"
# 2s3z 3s5z 3s5z_vs_3s6z

map_name="5m_vs_6m"
NTASKS=1
method="tgcnet"

for i in `seq 1 $NTASKS`; do
    nohup python src/main.py --alg-config=$method --env-config=sc2 with env_args.map_name=$map_name > results/Logs/output"${i}".log 2>&1 &
done
