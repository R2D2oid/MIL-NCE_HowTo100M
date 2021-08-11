#!/bin/bash
#SBATCH --account=def-mudl
#SBATCH --gres=gpu:v100l:1 
#SBATCH --cpus-per-task=6         # CPU cores/threads
#SBATCH --mem=100G                # memory (per node)
#SBATCH --time=0-00:20            # time (DD-HH:MM)

module load python/3.6
source env_h100m/bin/activate

python eval_msrvtt.py --batch_size=16  --num_thread_reader=20 --num_windows_test=10 --eval_video_root=/home/zahrav/datasets/MSRVTT/TestVideo --pretrain_cnn_path=/home/zahrav/scratch/repos/models/s3d_howto100m.pth
