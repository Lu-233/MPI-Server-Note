.. Slurm Note

.. image:: https://visitor-badge.glitch.me/badge?page_id=lu.readthedocs.io.ServerNote.SlurmNote

Slurm is an open source, fault-tolerant, and highly scalable cluster management and job scheduling system for large and small Linux clusters.

.. image:: https://slurm.schedmd.com/slurm_logo.png
    :width: 200 px

Slurm 笔记
=============

要运行代码，需要向集群提交计算任务（job）。

计算任务 = 代码 + 资源要求

集群通过Slurm接受和管理任务。因此要使用集群，就要用Slurm。

目前集群使用的Slurm版本是19.05.5，文档：https://slurm.schedmd.com/archive/slurm-19.05.5/


常用命令：

- srun 提交一个任务，实时运行，但任务会随着SSH会话的关闭而停止。
- sbatch 最常用，提交一个任务，通过脚本(job script)。
- scancel 取消一个任务
- squeue 查看任务队列
- sinfo 查看集群状态

命令简介
----------

sinfo
*******

查看集群状态

.. code-block:: bash

    sinfo

输出如：

.. code-block:: bash

    PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
    speedy*      up    6:00:00      1  down* eureka
    speedy*      up    6:00:00      1    mix tatooine
    speedy*      up    6:00:00      1   idle coruscant
    normal       up 5-00:00:00      1  down* eureka
    normal       up 5-00:00:00      1    mix tatooine
    normal       up 5-00:00:00      1   idle coruscant

其中

PARTITION
    分区 speedy 和 normal 最大限时（TIMELIMIT）不同

STATE
    状态， down：不可用， mix：有任务但没满， idle：完全空闲

NODELIST
    节点列表， eureka 等是我们的服务器名称


我使用如下alias，使用 `s` 命令，输出更具体的使用情况，如GPU、CPU的数量和使用情况

.. code-block:: bash

    alias s='sinfo -O "Partition:10,Available:5,StateCompact:6,Time:11,Gres:7,GresUsed:10,NODELIST:10,CPUsState"'

squeue
*******

查看集群任务队列

.. code-block:: bash

    squeue

输出如

.. code-block:: bash

             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
              8156    speedy     bash   wanglu PD       0:00      1 (Resources)
              8157    speedy     bash   wanglu  R       0:02      1 tatooine

JOBID
    任务编号

PARTITION
    分区

NAME
    任务名称，由用户自定义

USER
    提交任务的用户

ST
    State，状态 PD：等待中 R：运行中

TIME
    已运行时长

NODELIST
    节点，表示任务在哪个节点上运行

    (Resources) 带括号表示原因，Resources是因为资源不足等待中


srun
*******

.. code-block:: bash

    srun 命令

    # 使用 4 个 CPU 2 个 GPU
    srun -c 4 --gres=gpu:2 命令

    # 如
    srun -c 4 --gres=gpu:2 python main.py


我使用如下alias，使用 `q` 命令，输出更具体的任务列表，如任务使用GPU、CPU的数量

.. code-block:: bash

    alias q='squeue --Format "JobID:6,Partition:10,Name:16,UserName:8,StateCompact:2,TimeUsed:9,NumCPUs:3,tres-per-node:10,ReasonList"'


scancel
**********

.. code-block:: bash

    scancel 任务编号

    scancel 9527


sbatch
*******

提交一个脚本，脚本包含对Slurm的选项

.. code-block:: bash

    sbatch 脚本

    # 如：
    sbatch my_job.sh

脚本示例

.. code-block:: bash
    #!/bin/bash

    # 注意，井号和SBATCH之间不能有空格

    # sbatch 命令的官方文档 https://slurm.schedmd.com/sbatch.html

    # 任务名称
    #SBATCH --job-name=myFirstJob

    # GPU任务需要添加，谦让CPU任务以防止GPU用满后无法提交CPU任务
    #SBATCH --nice

    # 指定任务分区为 normal 或 speedy 这会影响最大运行时间
    #SBATCH --partition=normal

    # 指定最长运行时间格式为days-hours:minutes:seconds
    #SBATCH --time=5:59:59

    # 申请1个GPU 要申请多个GPU如4个可以改为--gres=gpu:4
    # 申请2个CPU要申请多个CPU如10个可以改为--cpus-per-task=10
    #SBATCH --gres=gpu:1
    #SBATCH --cpus-per-task=2

    # 把输出（print）保存到文件， %j 会被替换为任务编号
    #SBATCH --output=hello_slurm_output_%j.txt

    # 运行代码文件
    python3 hello_python.py




















































