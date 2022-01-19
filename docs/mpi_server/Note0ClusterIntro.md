# 集群简介和名词解释 (md)

![img:访客统计](https://visitor-badge.glitch.me/badge?page_id=lu.readthedocs.io.ServerNote.服务器集群简介)

官方的集群简介： https://github.com/gqqnbig/mpi-servers/wiki/集群简介

## 背景

集群提供了若干台服务器，用于科学计算。

用户可以访问集群的登录节点来提交计算任务。

每台服务器都有自己的名字，来自[星球大战中的行星]。

[星球大战中的行星]: https://en.wikipedia.org/wiki/List_of_Star_Wars_planets_and_moons

## 集群

集群包含的服务器分为三类：登录节点、计算节点、存储节点。

### 登录节点

用户可以通过 [SSH] 访问集群的登录节点，并提交计算任务。

多个任务会构成优先队列，按顺序分配资源和执行，资源不足的任务将会等待。

集群使用 [Slurm] 管理集群的任务调度和资源分配。

[SSH]: https://en.wikipedia.org/wiki/Secure_Shell
[Slurm]: https://slurm.schedmd.com/documentation.html

### 计算节点

计算节点配有先进的 Intel CPU 和 Nvidia GPU。

GPU 支持 Nvidia CUDA，可以数十倍的加速机器学习模型。

极端情况下，如 A100 GPU 比 Xeon 6240 CPU 快 249 倍： https://www.nvidia.com/en-us/data-center/a100/

### 存储节点

用户目录下的 ~/shared 文件夹通过存储节点的NFS在所有节点同步。

因此想要在其他节点运行程序，最好将所有的文件放在 shared 文件夹中。

### 节点列表：

**Aha**：登录节点，存储节点。

**Eureka**：计算节点，**维护中**，CPU 48核，Memory 128G，GPU 10个（RTX2080Ti，12G）

**Tatooine**：计算节点，CPU 20核，Memory 128G，GPU 4个（RTX3070，8G）

**Coruscant**：计算节点，CPU 64核，Memory 256G，GPU 8个（Quadro RTX 8000，48G）

**Synology**：存储节点，**等待上线**。

**Naboo**：计算节点，**等待上线**，CPU 64核，Memory 256G，GPU 8个（Quadro RTX 8000，48G）

**Dagobah**：计算节点，**等待上线**，CPU 64核，Memory 256G，GPU 8个（Quadro RTX 8000，48G）

## 简介

**SSH**：

> Secure Shell 可以安全的连接和使用另一个系统的 Shell， 常用于 Linux 。 

> 外壳（Shell）是与内核（Kernel）相对的概念。

> 用户通过外壳使用内核。具体的说，它是命令行（CLI，Command-line interface）或图形界面（GUI, Graphical user interface）。

**Bash**：

> 当你登录到服务器，会显示一个美元符号 $ 等待你输入命令。

> 这就是Bash，一种常用的Linux Shell，以 CLI（Command-line interface） 的形式提供。

> 为了节省资源，服务器通常只提供某种CLI，如Bash、Zsh，而不提供GUI。

**Slurm**：

> 一个集群管理和作业调度系统，它管理多个服务器节点的资源。

> 可以供多个用户提交计算任务，每个任务都要说明需要的资源。

> Slurm 通过优先队列为任务分配资源，并在被分配的节点上启动、执行和监控任务的执行。
