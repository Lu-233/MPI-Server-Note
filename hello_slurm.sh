#!/bin/bash

# 注意，井号和SBATCH之间不能有空格

# sbatch 命令的官方文档 https://slurm.schedmd.com/sbatch.html

# 任务名称
#SBATCH --job-name=myFirstJob

# 在一个节点运行
#SBATCH --nodes=1

# GPU任务需要谦让CPU任务以防止GPU用满后无法提交CPU任务
#SBATCH --nice

# 指定任务分区为normal
#SBATCH --partition=normal

# 指定最长运行时间格式为days-hours:minutes:seconds
#SBATCH --time=5:59:59

# 申请1个GPU 要申请多个GPU如4个可以改为--gres=gpu:4
# 申请1个CPU要申请多个CPU如10个可以改为--cpus-per-task=10
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=1

# 把输出保存到 hello_slurm_output.txt (~代表用户目录) 如果使用 hello_%j_slurm.txt其中的%j会被替换为任务编号
#SBATCH --output=hello_slurm_output.txt

# 运行代码文件
python3 hello_python.py
