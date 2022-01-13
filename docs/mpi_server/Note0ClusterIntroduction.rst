.. Cluster Introduction

==============================
集群简介和名词解释
==============================

.. image:: https://visitor-badge.glitch.me/badge?page_id=lu.readthedocs.io.ServerNote.服务器集群简介

官方的集群简介： https://github.com/gqqnbig/mpi-servers/wiki/集群简介

背景
=====

集群提供了若干服务器，用于科学计算。

用户可以访问集群的登录节点来提交计算任务。

一个 计算任务 = 程序 + 资源要求。

多个任务会构成优先队列，按顺序分配资源和执行，资源不足的任务将会等待。

集群
======

集群包含多台服务器，分为三类：登录节点、计算节点、存储节点。

用户可以通过 `SSH` 访问集群的登录节点，并提交计算任务。

集群使用 Slurm_ 管理集群的任务调度和资源分配。

.. _Slurm: https://slurm.schedmd.com/documentation.html

每台服务器都有自己的名字，都来自于 星球大战中行星的名字_

.. _星球大战中行星的名字: https://en.wikipedia.org/wiki/List_of_Star_Wars_planets_and_moons

`Aha`: 登录节点，存储节点。

`Eureka`: 计算节点，CPU 48核，Memory 128G，GPU 10个（RTX2080Ti，12G）

`Tatooine`: 计算节点，CPU 20核，Memory 128G，GPU 4个（RTX3070，8G）

`Coruscant`: 计算节点，CPU 64核，Memory 256G，GPU 8个（Quadro RTX 8000，48G）

`Synology`: 存储节点，**寒假后上线**。

`Naboo`: 计算节点，**寒假后上线**，CPU 64核，Memory 256G，GPU 8个（Quadro RTX 8000，48G）

`Dagobah`: 计算节点，**寒假后上线**，CPU 64核，Memory 256G，GPU 8个（Quadro RTX 8000，48G）


名词解释
============

更严谨专业的解释请参见 Wikipedia。

`SSH`
    Secure Shell 可以安全的连接和使用另一个系统的 Shell， 常用于 Linux 。

`Shell`
    用户通过外壳（Shell）使用操作系统。具体的说，它是命令行（CLI）或图形界面（GUI）。

    外壳（Shell）是与内核（Kernel）相对的概念。

`Bash`
    当你登录到服务器，会显示一个美元符号 $ 等待你输入命令。

    这就是Bash，一种常用的Linux Shell，以 CLI 的形式提供。

    同时Bash也是一种命令语言（command language），是我们与服务器交互的主要方式。

    日常可以随查随用。想详细了解可以看：https://hyperskill.org/tracks/26

`GUI` 和 `CLI`
    Graphical user interface：图形用户界面

    Command-line interface：命令行界面，常见的CLI程序如 Bash、Csh、Zsh 等......

    为了节省资源，服务器通常只提供某种CLI，而不提供GUI。

`CPU` 和 `GPU`
    Central processing unit：中央处理器

    Graphics processing unit：图形处理器（显卡）

    虽然CPU的功能很强大，但在很多科学计算中，可以使用 GPU 进一步加速计算。

    Nvidia CUDA 可以数十倍的加速机器学习模型，是研究机器学习的重要工具。

    机器学习模型计算中，A100 GPU 可以比 Xeon 6240 CPU 快 249 倍： https://www.nvidia.com/en-us/data-center/a100/

`Slurm`
    一个集群管理和作业调度系统，它管理多个服务器节点的资源。

    可以供多个用户提交计算任务，每个任务都要说明需要的资源。

    Slurm 通过优先队列为任务分配资源，并在被分配的节点上启动、执行和监控任务的执行。
