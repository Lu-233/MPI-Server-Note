#!/bin/bash

# sbatch 命令的官方文档：https://slurm.schedmd.com/sbatch.html

# 任务名称，用于显示。
#SBATCH --job-name=myFirstJob

# 在一个节点运行
#SBATCH --nodes=1

# GPU任务需要谦让CPU任务，以防止GPU用满后无法提交CPU任务
#SBATCH --nice

# 指定任务分区为normal
#SBATCH --partition=normal

# 把输出保存到 hello_slurm_output.txt (~代表用户目录)。 如果使用 hello_%j_slurm.txt，其中的%j会被替换为任务编号
#SBATCH --output=hello_slurm_output.txt

# 申请1个GPU。 要申请多个GPU如4个，可以改为--gres=gpu:4
#SBATCH --gres=gpu:1

# 申请1个CPU。要申请多个CPU如10个，可以改为--cpus-per-task=10
#SBATCH --cpus-per-task=1

# 指定最长运行时间，格式为days-hours:minutes:seconds
#SBATCH --time=2:33:33

# 以下是一个linux 命令行脚本，会输出所在服务器的名字，输出显卡信息，休眠30秒，然后输出 Hello Slurm!

hostname

nvidia-smi

sleep 30s

echo "Hello Slurm!"
