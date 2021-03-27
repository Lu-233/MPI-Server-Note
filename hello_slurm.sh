#!/bin/bash

# sbatch 命令的官方文档：https://slurm.schedmd.com/sbatch.html

# 任务名称，用于显示。
#SBATCH --job-name=myFirstJob

# 在一个节点运行
#SBATCH --nodes=1

# 把输出重定向到 hello_slurm.txt。 如果使用 hello_%j_slurm.txt，其中的%j会被替换为任务编号
#SBATCH -o hello_slurm.txt

# 指定任务分区为normal
#SBATCH --partition=normal

# 指定最长运行时间，格式为days-hours:minutes:seconds
#SBATCH --time=7:55:44

# 以下是一个linux 命令行脚本，会输出所在服务器的名字，休眠30秒，然后输出 Hello Slurm!

hostname

sleep 30s

echo "Hello Slurm!"
