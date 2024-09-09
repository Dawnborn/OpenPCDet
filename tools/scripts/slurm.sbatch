#!/bin/bash
#SBATCH --job-name="pcd"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=12
#SBATCH --gres=gpu:1,VRAM:16G
#SBATCH --mem=32G
#SBATCH --time=24:00:00
#SBATCH --mail-type=FAIL
#SBATCH --mail-user="ge32hij@mytum.de"
#SBATCH --output=/storage/user/lhao/hjp/intellisys_data/OpenPCDet/sbatchoutput/logs/slurm-%j.out
#SBATCH --error=/storage/user/lhao/hjp/intellisys_data/OpenPCDet/sbatchoutput/logs/slurm-%j.out

srun /usr/wiss/lhao/anaconda3/hjp_pcd38nn/bin/python train.py --cfg_file /home/wiss/lhao/storage/user/hjp/intellisys_data/OpenPCDet/tools/cfgs/nuscenes_models/cbgs_voxel0075_voxelnext_mine.yaml --ckpt /home/wiss/lhao/storage/user/hjp/intellisys_data/OpenPCDet/output/home/wiss/lhao/storage/user/hjp/intellisys_data/OpenPCDet/tools/cfgs/nuscenes_models/cbgs_voxel0075_voxelnext_mine/default/ckpt/checkpoint_epoch_12.pth