hjp_pcd

conda create -n hjp_pcd python=3.7

conda install pytorch==1.10.1 torchvision==0.11.2 torchaudio==0.10.1 cudatoolkit=10.2 -c pytorch

pip install spconv-cu102


-------------

nvcc -V 11.1

pip install torch==1.10.1+cu111 torchvision==0.11.2+cu111 torchaudio==0.10.1 -f https://download.pytorch.org/whl/cu111/torch_stable.html

----

python=3.7

nvcc -V 11.1

pip install torch==1.10.1+cu111 torchvision==0.11.2+cu111 torchaudio==0.10.1 -f https://download.pytorch.org/whl/cu111/torch_stable.html

pip install spconv-cu113

cd OpenPCDet

pip install -r requirements.txt

python setup.py develop

cd VoxelNeXt

python setup.py develop

av2 requires python>=3.8

------

python=3.8

pip install torch==1.10.1+cu111 torchvision==0.11.2+cu111 torchaudio==0.10.1 -f https://download.pytorch.org/whl/cu111/torch_stable.html

pip install spconv-cu113 (not use prebuild one, use build from source instead)

cd VoxelNeXt

pip install -r requirements.txt

python setup.py develop

pip install av2

pip install kornia

--------
hjp_pcd38

python=3.8

pip install torch==1.10.1+cu111 torchvision==0.11.2+cu111 torchaudio==0.10.1 -f https://download.pytorch.org/whl/cu111/torch_stable.html

(cumm and spconv: do not use prebuild one, use build from source instead)
git clone https://github.com/FindDefinition/cumm, cd ./cumm, pip install -e .
git clone https://github.com/traveller59/spconv, cd ./spconv, pip install -e .
in python, import spconv and wait for build finish.

cd VoxelNeXt

pip install -r requirements.txt

python setup.py develop

pip install av2

pip install kornia

---
hjp_pcd37np19
python=3.7

pip install numpy==1.19

(only for <=3.7 numpy <1.20)

pip install nuscenes-devkit==1.0.5 

check nvcc=11.3

conda install pytorch==1.10.1 torchvision==0.11.2 torchaudio==0.10.1 cudatoolkit=11.3 -c pytorch -c conda-forge

(cumm and spconv: do not use prebuild one, use build from source instead)
git clone https://github.com/FindDefinition/cumm
cd /home/wiss/lhao/junpeng/intellisys/ws_voxelnext/cumm
pip install -e .

git clone https://github.com/traveller59/spconv
cd /home/wiss/lhao/junpeng/intellisys/ws_voxelnext/spconv
pip install -e .

in python, import spconv and wait for build finish.

(hjp_pcd37bk saved)

cd /home/wiss/lhao/storage/local/lhao/junpeng/intellisys_data/OpenPCDet
pip install -r requirements.txt

python setup.py develop

pip install av2 (python>=3.8 required) FALIED!!!!!!!!!!!!

pip install kornia

bash scripts/dist_test.sh 1 --cfg_file /home/wiss/lhao/storage/local/lhao/junpeng/intellisys_data/VoxelNeXt/tools/cfgs/nuscenes_models/cbgs_voxel0075_voxelnext_mine.yaml  --ckpt /home/wiss/lhao/junpeng/intellisys/ws_voxelnext/VoxelNeXt/model/voxelnext_nuscenes_kernel1.pth

--

# Create Data Info

copy the Imagesets from PointRCNN under data/kitti/ImageSets

python -m pcdet.datasets.kitti.kitti_dataset create_kitti_infos tools/cfgs/dataset_configs/kitti_dataset.yaml

python -m pcdet.datasets.nuscenes.nuscenes_dataset --func create_nuscenes_infos --cfg_file /home/wiss/lhao/junpeng/intellisys/ss23-bev-features/tools/cfgs/dataset_configs/nuscenes_dataset_mini.yaml --version v1.0-mini --with_cam


---

pip install nuscenes-devkit==1.0.5 (only for <=3.7)
cd OpenPCDet
python setup.py develop

# Evaluate

## voxelnext
cd tools 
bash scripts/dist_test.sh 1 --cfg_file /home/wiss/lhao/junpeng/intellisys/ws_voxelnext/VoxelNeXt/tools/cfgs/kitti_models/voxelnext.yaml --ckpt /home/wiss/lhao/junpeng/intellisys/ws_voxelnext/model/voxelnext_nuscenes_kernel1.pth

bash scripts/dist_test.sh 1 --cfg_file /home/wiss/lhao/junpeng/intellisys/ws_voxelnext/VoxelNeXt/tools/cfgs/nuscenes_models/cbgs_voxel0075_voxelnext.yaml --ckpt /home/wiss/lhao/junpeng/intellisys/ws_voxelnext/VoxelNeXt/model/voxelnext_nuscenes_kernel1.pth


### Evaluate New
env: hjp_pcd38fuse
setup.py: original ws2/OpenPCDet

bash scripts/dist_test.sh 1 --cfg_file /home/wiss/lhao/junpeng/intellisys/ss23-bev-features/tools/cfgs/models/kitti/nuscenes_models/cbgs_voxel0075_voxelnext_mini.yaml --ckpt /home/wiss/lhao/junpeng/intellisys/ws_voxelnext/VoxelNeXt/model/voxelnext_nuscenes_kernel1.pth

### Evaluate in local path
dataset in the recoomended structure
setup.py: original one
env: hjp_pcd38n

bash scripts/dist_test.sh 1 --cfg_file /home/wiss/lhao/junpeng/intellisys/ss23-bev-features/tools/cfgs/models/kitti/nuscenes_models/cbgs_voxel0075_voxelnext_mini.yaml --ckpt /home/wiss/lhao/junpeng/intellisys/ws_voxelnext/VoxelNeXt/model/voxelnext_nuscenes_kernel1.pth