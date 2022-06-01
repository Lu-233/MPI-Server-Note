# 集群简介

![img:访客统计](https://visitor-badge.glitch.me/badge?page_id=lu.readthedocs.io.ServerNote.服务器集群简介)

警告：本文有时效性。请务必参阅 shine-cluster wiki 的[集群简介]。

作者最后一次巡查本文：2022.06.01。

[集群简介]: https://github.com/gqqnbig/shine-cluster/wiki/集群简介

## 背景

集群提供用于科学计算的若干台服务器。

用户通过访问登录节点提交计算任务。

每台服务器都有名字，命名列表是事先确定的，来自[星球大战中的行星]。

[星球大战中的行星]: https://en.wikipedia.org/wiki/List_of_Star_Wars_planets_and_moons

## 集群

简单来说，集群包含三类服务器：登录节点、计算节点、存储节点。

### 登录节点

用户只能通过 [SSH] 访问集群的登录节点，并提交计算任务。

多个任务会按照优先队列等待分配资源并执行。

 [Slurm] 用于管理集群的任务调度、资源分配。

[SSH]: https://en.wikipedia.org/wiki/Secure_Shell
[Slurm]: https://slurm.schedmd.com/documentation.html

### 计算节点

计算节点配有先进的 Intel CPU 和 Nvidia GPU。

GPU 支持 Nvidia CUDA，可以数十倍的加速张量积算。

大量的GPU是进行机器学习研究的必需品。Matlab也常用GPU加速矩阵运算。

极端情况下，如 A100 GPU 比 Xeon 6240 CPU 快 249 倍。参考： https://www.nvidia.com/en-us/data-center/a100/

### 存储节点

所有用户都可以通过 ~/shared 文件夹访问存储节点提供的空间（基于NFS）。

由于计算节点的空间有限，推荐将文件主要存放在 shared 文件夹。

新的存储空间正在部署和测试，按照目前Issue中的讨论，未来将有两个新的存储空间可用（一个高可用空间小，一个低可用空间大）。

高/低可用是指有服务器维护/故障/下线时，我们能否访问所有的存储数据。

### 节点列表：

部分节点等待上线/维护中，请在Aha上通过 `sinfo` 命令实时检查可用节点。

**Aha**：登录节点，存储节点。

**Aloha**：登录节点。

**Eureka**：计算节点，CPU 48核，Memory 128G，GPU 10个（RTX2080Ti，12G）

**Tatooine**：计算节点，CPU 20核，Memory 128G，GPU 4个（RTX3070，8G）

**Coruscant**：计算节点，CPU 64核，Memory 256G，GPU 8个（Quadro RTX 8000，48G）

**Synology**：存储节点。

**Naboo**：计算节点，CPU 64核，Memory 256G，GPU 8个（Quadro RTX 8000，48G）

**Dagobah**：计算节点，CPU 64核，Memory 256G，GPU 8个（Quadro RTX 8000，48G）

## 三句话简介

**SSH**：

> Secure Shell 可以安全的连接和使用另一个系统的 Shell， 常用于 Linux 。 

> 外壳（Shell）是与内核（Kernel）相对的概念。

> 用户通过外壳使用内核。具体的说，它是命令行（Command-line interface, CLI）或图形界面（Graphical user interface, GUI）。

**Bash**：

> 当你登录到服务器，会显示一个美元符号 $ 等待你输入命令。

> 这就是Bash，一种常用的Linux Shell，以 CLI（Command-line interface） 的形式提供。

> Linux服务器通常只提供某种CLI，如Bash、Zsh，可以但几乎不提供GUI。

**Slurm**：

> 一个集群管理和作业调度系统，它管理多个服务器节点的资源。

> 可以供多个用户提交计算任务，每个任务都要声明它需要的配置。

> Slurm 通过优先队列为任务分配资源，并在被分配的节点上启动、执行和监控任务的执行。
