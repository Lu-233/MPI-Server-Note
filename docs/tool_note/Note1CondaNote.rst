.. CondaNote

.. image:: https://visitor-badge.glitch.me/badge?page_id=lu.readthedocs.io.ServerNote.CondaNote

Conda 笔记
=============

Conda是一个软件包、依赖和环境管理系统，易用，开源，跨平台。

我通常用 Conda 来管理 Python 环境，配置 CUDA，不容易出错。

也可以用 Conda 配置gcc、cudatoolkit-dev，虽然在mpi-server上更推荐用docker。

除了Conda，pip + 手装 CUDA 也可以配置ML环境。手动挡控制的精细，但是麻烦。

更多细节请阅读官方文档：https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/index.html

一些背景
-----------
anaconda和mimiconda：

Wiki：https://en.wikipedia.org/wiki/Anaconda_(Python_distribution)

Miniconda is a free minimal installer for conda. It is a small, bootstrap version of Anaconda that includes only conda, Python, the packages they depend on, and a small number of other useful packages, including pip, zlib and a few others.

基础命令
-----------

安装、升级、卸载

.. code-block:: bash

    conda install 张三

    conda update 张三

    conda remove 张三

环境管理
------------

新建、激活、列表、移除

.. code-block:: bash

    conda create -n 张三

    conda activate 张三

    conda env list

    conda env remove -n 张三

加点细节
------------

安装 install

.. code-block:: bash

    conda install 张三

    conda install 张三=版本

    conda install 张三 李四=2.0 王五

    conda install 张三 -c 指定频道
    conda install 张三 -c conda-forge

升级 update

.. code-block:: bash

    conda update 张三
    conda update 张三=版本

    # 升级所有包
    conda update --all

卸载 remove

.. code-block:: bash

    conda remove 张三

    conda remove 张*

搜索 search

.. code-block:: bash

    conda search 某某某

    # 如
    conda search scikit-learn
    conda search pillow

列出包

.. code-block:: bash

    # 所有已安装的
    conda list

    # 列出带有 某某 的包
    conda list 某某
