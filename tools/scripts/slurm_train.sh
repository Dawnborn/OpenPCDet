#!/usr/bin/env bash

#SBATCH --job-name="pcd"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=12
#SBATCH --gres=gpu:2,VRAM:16G
#SBATCH --mem=16G
#SBATCH --time=24:00:00
#SBATCH --mail-type=START,END
#SBATCH --mail-user="ge32hij@mytum.de"
#SBATCH --output=/storage/user/lhao/hjp/intellisys_data/OpenPCDet/sbatchoutput/logs/slurm-%j.out
#SBATCH --error=/storage/user/lhao/hjp/intellisys_data/OpenPCDet/sbatchoutput/logs/slurm-%j.out

set -x

PARTITION=$1
JOB_NAME=$2
GPUS=$3
PY_ARGS=${@:4}

GPUS_PER_NODE=${GPUS_PER_NODE:-8}
CPUS_PER_TASK=${CPUS_PER_TASK:-5}
SRUN_ARGS=${SRUN_ARGS:-""}

while true
do
    PORT=$(( ((RANDOM<<15)|RANDOM) % 49152 + 10000 ))
    status="$(nc -z 127.0.0.1 $PORT < /dev/null &>/dev/null; echo $?)"
    if [ "${status}" != "0" ]; then
        break;
    fi
done
echo $PORT

srun -p ${PARTITION} \
    --job-name=${JOB_NAME} \
    --gres=gpu:${GPUS_PER_NODE} \
    --ntasks=${GPUS} \
    --ntasks-per-node=${GPUS_PER_NODE} \
    --cpus-per-task=${CPUS_PER_TASK} \
    --kill-on-bad-exit=1 \
    ${SRUN_ARGS} \
    python -u train.py --launcher slurm --tcp_port $PORT ${PY_ARGS}
