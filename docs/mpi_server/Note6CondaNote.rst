.. CondaNote

.. image:: https://visitor-badge.glitch.me/badge?page_id=lu.readthedocs.io.ServerNote.CondaNote

Conda 笔记
=============

.. image:: https://docs.conda.io/en/latest/_images/conda_logo.svg

Package, dependency and environment management for any language—Python, R, Ruby, Lua, Scala, Java, JavaScript, C/ C++, FORTRAN, and more.


Conda是一个软件包和环境管理系统，易用，开源，跨平台。

我主要使用Conda来管理Python环境和配置CUDA。

当然，pip + 手动CUDA 也可以但没必要，麻烦，我懒。

了解更多细节请阅读官方文档：https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/index.html

基础命令
-----------

安装

.. code-block:: bash

    conda install 某某某

升级

.. code-block:: bash

    conda update 某某某

卸载

.. code-block:: bash

    conda remove 某某某


加点细节
------------

安装 install

.. code-block:: bash

    conda install 某某某

    # 指定版本
    conda install 某某某=版本

    # 安装多个包
    conda install 张三 李四=2.0 王五

    # 从指定频道安装
    conda install 某某某 -c conda-forge
    conda install 某某某 -c pytorch

升级 update

.. code-block:: bash

    conda update 某某某
    conda update 某某某=版本

    # 升级所有包
    conda update --all

卸载 remove

.. code-block:: bash

    conda remove 某某某

    # 按匹配卸载，所有关键字开头的都会被卸载
    conda remove 某某某*

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

环境管理
------------

新建环境

.. code-block:: bash

    conda create -n 名字

激活环境

.. code-block:: bash

    conda activate 名字

列出所有环境

.. code-block:: bash

    conda env list

移除环境

.. code-block:: bash

    conda env remove -n 名字

