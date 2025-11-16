# Value-based Communication Baseline Methods in MADRL

This repository includes value-based communication baselines methods for multi-agent deep reinforcement learning (MADRL). These methods improve coordination by sharing messages among agents and use value-based methods to train communication and policies.


## Supported Tasks
| Environment | Config File         | Example Command                          |
|-------------|---------------------|------------------------------------------|
| SMAC        | config/envs/sc2.yaml| `--env-config=sc2 with env_args.map_name="2s_vs_1sc"` |
| LBF         | config/envs/gymma.yaml| `--env-config=gymma with env_args.time_limit=25 env_args.key="lbforaging:Foraging-11x11-6p-4f-v2"` |
| Hallway     | config/envs/hallway.yaml| `--env-config=hallway` |


## Supported Methods

The repository implements several value-based communication and baseline methods used in cooperative MADRL. Each entry includes the primary code locations and configuration files.

- **TGCNet**: Transformer-based Graph Coarsening Network — value-oriented dynamic directed communication with transformer attention and graph coarsening.
  - Agent: `src/modules/agents/tgcnet.py`
  - Learner: `src/learners/tgc_learner.py`

- **CACom**: Communication-Aware baseline.
  - Agent: `src/modules/agents/cacom_agent.py`
  - Learner: `src/learners/cacom_learner.py`

- **MAIC**: Multi-Agent Information Compression family (including a QPLEX variant).
  - Agent: `src/modules/agents/maic.py`
  - Learners: `src/learners/maic_learner.py`, `src/learners/maic_qplex_learner.py`


## Repository Structure
- **`src/`**: Main source code.
  - **`src/components/`**: Replay buffers, epsilon schedules, transforms, and helpers.
  - **`src/config/`**: YAML configuration files (`default.yaml`, `algs/`, `envs/`).
  - **`src/controllers/`**: Training controllers for algorithms (TGCNet, CACom, MAIC).
  - **`src/envs/`**: Environment wrappers and adapters (SMAC, gym envs).
  - **`src/learners/`**: Learner implementations and optimization loops.
  - **`src/modules/`**: Neural modules and layers.
    - **`src/modules/agents/`**: Agent architectures (`tgcnet.py`, `rnn_agent.py`, etc.).
    - **`src/modules/layers/`**: Custom layers (graph conv, attention, transformer blocks).
    - **`src/modules/mixers/`**: Value mixers (`qmix.py`, `vdn.py`, `graph_coarsening.py`).
  - **`src/runners/`**: Episode runner and experiment entry points.
  - **`src/utils/`**: Logging, RL utilities, and time helpers.
- **`config/`**: Top-level experiment and environment configs.
- **`run_local.sh`, `run_slurm.sh`, `per_job.sh`**: Scripts for launching experiments.
- **`requirements.txt`**: Python dependencies.
- **`results/`**: Saved models, logs, and sacred experiment metadata.

## Getting Started

1. Create and activate a Python environment (example using conda):

```bash
conda create -n value python=3.11 -y
conda activate value
pip install -r requirements.txt
```

2. Train a baseline experiment (example):

```bash
python src/main.py --alg-config=tgcnet --env-config=sc2 with env_args.map_name="3m"
```

3. Use helper scripts:

- `./run_local.sh` — run experiments locally.
- `./run_slurm.sh` — submit experiments to SLURM clusters.

## Configuration

- Algorithm configs: `config/algs/` (e.g., `tgcnet.yaml`, `maic.yaml`).
- Environment configs: `config/envs/` (SMAC, hallway, gymma).
- Global defaults: `config/default.yaml`.

## Results & Checkpoints

- Checkpoints and logs are saved under `results/`. Models are organized by experiment name and seed (see `results/models/`). Sacred metadata and reproducible run folders are under `results/sacred/`.




