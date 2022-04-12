# 配环境（PyTorch）

![](https://visitor-badge.glitch.me/badge?page_id=lu.readthedocs.io.ServerNote.配环境PyTorch)

下文会基于 Conda 逐步安装 PyTorch。

首先要登录到服务器的计算节点，再配置环境。

    只有计算节点提供 Conda。Conda环境通过存储节点共享到所有计算节点。

    要更深入的了解服务器上的Conda配置细节，请咨询管理员。

## 登录服务器

即登录到Aha，用户可以通过Aha向其他计算节点提交计算任务来运行程序。

![](pics/N2Login2Aha.png)

## 通过Aha访问计算节点

输入命令：`sit`

它在 ~/.bash_aliases 定义，如果没有，替代命令是：`srun --pty bash -i`

![](pics/N2Aha2Eureka.png)

注意到显示的 ``wanglu@aha`` 会变成 ``(base)wanglu@eureka`` ,或者 ``(base)wanglu@tatooine`` 等等

``name@eureka`` 意味着你正在使用 ``eureka`` 服务器

``name@tatooine`` 意味着你正在使用 ``tatooine`` 服务器

## 创建名为 cola 的新环境

输入命令：``conda create -n cola``

会提示 ``Proceed ([y]/n)?`` ，请阅读安装计划，输入 y 可以确认创建环境。

![](pics/N2CreateEnv.png)

## 激活新环境

输入命令：``conda activate cola``

![](pics/N2ActivateEnv.png)

## 安装PyTorch

输入命令：``conda install PyTorch torchvision cudatoolkit -c conda-forge -c PyTorch``

这个命令意味着从 conda-forge 安装包，请访问 conda-forge.org 确认你了解她是什么。

如果不想使用conda-forge，可以使用 ``conda install PyTorch torchvision cudatoolkit -c PyTorch`` ，
但cudatoolkit版本可能会低一些

稍作等待，在提示 `Proceed ([y]/n)?` 时，请检查安装计划是否符合预期。如Python版本，PyTorch的版本是否支持CUDA等。

确认无误后，输入 `y` 确认安装。

如果安装计划有问题，如Python的版本过高/低，可以手动设置版本号，如 ``conda install python=3.8 PyTorch ...`` 。

安装很快，但下载慢。服务器支持多用户共享conda cache，如果你安装的包有本地缓存，程序会自动跳过其下载过程。

安装可能需要几分钟到二十分钟(在服务器的高速互联网恢复前，这可能需要更长时间)。

![](pics/N2InstallPyTorch.png)

## 验证安装

首先需要退出eureka，回到aha：

输入命令：``exit``

![](pics/N2ValInstall.png)

警告：下一行操作将会要求服务器提供一个GPU使用

输入命令：``srun --pty --gres=gpu:1 bash -i``

这一命令会要求slurm给你使用一个GPU，并在对应节点进入bash。

可以输入 ``hostname`` 查看你进入的节点。

可以输入 ``nvidia-smi`` 查看申请的GPU的状态。

输入命令 ``python`` 进入python交互式模式，可以直接输入Python代码，回车立即执行

![](pics/N2ValInstall2.png)

输入Python代码：``import torch``

继续输入：``torch.cuda.device_count()`` 来查看PyTorch检测到的CUDA设备数量（即GPU数量）。

![](pics/N2ValInstall3.png)

如果程序如图运行并输出1（因为上文只要求了一块GPU），说明已经成功安装了PyTorch环境，能用GPU加速计算。

退出python，请输入: exit() 或 快捷键 Ctrl + D。

## 安装更多Python Package

如果一切顺利，您目前已经拥有了一个装有PyTorch的机器学习环境。

通常，我们还需要安装更多的包，以下步骤不是必须的，但可以安装额外的包。

首先，进入计算节点的交互 Bash ，输入命令：``srun --pty bash -i``

激活环境 cola，输入命令：``conda activate cola``

安装包matplotlib, 输入命令：``conda install matplotlib``

或者从 conda-forge channel 安装 matplotlib, 输入命令：``conda install matplotlib -c conda-forge``

会遇到提示 `Proceed ([y]/n)?`，在确认安装计划符合预期后，输入回车或y确认继续执行。

![](pics/N2InstallMore.png)

如需安装其他包，命令形如：``conda install 包名``

例如：

```shell
    conda install pillow
    conda install numpy
    ...
```
