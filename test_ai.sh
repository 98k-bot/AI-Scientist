#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH -p zhangz2,gpu,preemptable
#SBATCH --gpus=a100:1
#SBATCH --job-name=ai_scientist_zhanh
#SBATCH -t 5:00:00
#SBATCH --mem=10000MB
#SBATCH --mail-type=FAIL,BEGIN,END
#SBATCH --mail-user=huixin.zhan@cshs.org
#SBATCH -o /common/zhangz2lab/zhanh/AI-Scientist/out_gpu
#SBATCH -e /common/zhangz2lab/zhanh/AI-Scientist/err_gpu

module load git

source /common/zhanh/anaconda3/etc/profile.d/conda.sh
conda activate ai_scientist

# Diagnostic check (optional, can be removed if not needed)
echo "PATH is: $PATH"
which git

cd /common/zhangz2lab/zhanh/AI-Scientist/
python launch_scientist.py --experiment grokking --num-ideas 2

