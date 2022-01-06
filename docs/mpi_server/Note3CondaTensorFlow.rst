.. 配环境 TensorFlow

.. image:: https://visitor-badge.glitch.me/badge?page_id=lu.readthedocs.io.ServerNote.配环境TensorFlow

========================
配环境（TensorFlow）
========================

作者：Lisa_ , Lu进行了修订

.. _Lisa: https://github.com/Lisa-MPI

下文会逐步配置一个基于 TensorFlow 机器学习环境。

首先要登录到服务器的计算节点，再配置环境。

    这是因为登录节点没有计算环境。
    所有计算节点的环境是共享的，意味着只需要配置一次环境就可以在不同的节点使用了。


配置环境
========

**建议**：创建不同的虚拟环境装不同的深度学习库(如Pytorch、tensorflow等)

创建虚拟环境请参考上一节 配环境（PyTorch）。

安装TensorFlow-GPU
==================

输入命令： ``conda install tensorflow-gpu -c conda-forge``

(如果不想使用 `conda-forge` ,可以使用 ``conda install tensorflow-gpu`` ，但是版本通常会低一点)

稍作等待，在提示Proceed ([y]/n)? 时，输入 y 确认安装


验证安装
========

(1) 需要回到aha:

(如果显示环境在eureka或tatooine，用命令 ``exit`` 退回到 aha 即可)

(2) 申请GPU

进入带有1个GPU的bash：``srun --pty --gres=gpu:1 bash -i`` (要求用1个GPU)

(3)测试tensorflow-gpu是否安装成功

激活环境命令: ``conda activate relax`` (修改relax为自己的环境名)

进入python交互式模式命令: python

输入Python代码：

.. code-block:: python

    import tensorflow as tf
    tf.test.is_gpu_available()

等待数秒，会有许多输出，这些我们看可以暂时忽略，只关注最后一行即可。

最后一行输出为true，则表示tensorflow-gpu安装成功！[撒花★,°:.☆(￣▽￣)/$:.°★ 。]
