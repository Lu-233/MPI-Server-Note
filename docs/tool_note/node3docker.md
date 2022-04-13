
# config docker
docker常用的命令查询网址：https://docs.docker.com/engine/reference/commandline/run/


## docker 容器是什么

## 为什么安装docker容器

原因很简单，普通用户是rootless用户，没有管理员用户的权限。我们安装docker容器rootless，可以在这个
容器里面拥有docker用户的权限。我自己的经历是运行trackformer论文的代码，实验环境需要安装gcc这个包，
但是在服务器里面安装不成功，好像是说我是非root权限。因此我总结了一套安装docker的详细教程，手把手安装。

-----------------怎样安装自己的docker容器----------------------------

## 前置工作
进入初始服务器aha：
![](../mpi_server/pics/docker/service_Initial.png)

进入带显卡的服务器，我这里进入的是dagobah
```shell
    sit -g
```
![](../mpi_server/pics/docker/service_dagobah.png)


第一次运行，没有安装过docker容器说明。1、要允许用户单元到start at boot,root必须为帐户启用逗留,即sudo loginctl enable-linger username.
2、进入/opt/docker/bin目录并执行安装命令

```shell
loginctl enable-linger $USER
dockerd-rootless-setuptool.sh install
```


通常会返回两个路径。有两个选项：1、每次手动输入这两个路径。2、或者直接写入bashrc的环境变量里面

```shell
    vim .bashrc
    loginctl enable-linger $USER
    export PATH=???
    export DOCKER_HOST=???



## 安装docker步骤

拉取ubuntu18.04镜像:  （这里是最小化的系统镜像包）


````

```

```shell script
    docker pull ubuntu:18.04
```

查看镜像列表：docker images
```shell script
    docker images
```

创建并运行容器，继承image镜像。并挂载文件夹路径： docker run [OPTIONS] IMAGE [COMMAND] [ARG...]

```shell script
  docker run --name TFormer -ti -v /home/wangcui/shared:/shared_disk ubuntu:18.04 /bin/bash
```




实例化容器：两种写法

```shell script
    docker run --name TFormer_new u18.04c:v1
    docker create -i -t --name test u18.04c:v1
```

查看当前文件路径：
```
    ls
```

安装完整版的ubuntu
非最小化处理 
```shell script
    unminimize
    `sudo apt update && sudo apt full-upgrade`
    apt install vim
    sudo passwd
```
    
    
安装miniconda3,bash [上述文件][.sh](http://xxx.sh)
```shell script
    wget [https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh](https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh)
    bash https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh](https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
```



激活环境conda环境：
```shell script
    source /opt/miniconda/bin/activate
```

完成后重启容器
```shell script
    docker restart TFormer
```


镜像打包 docker commit -a 作者  容器id 容器名字：容器标签
```shell script
  docker commit -a cui -m "complete u18.04" cbe37b45a22c u18.04c:v1
```




##docker的常用命令
删除image镜像：docker image rm [OPTIONS] IMAGE [IMAGE...]
```shell script
    docker image rm 5a5c46a1ad43
```


删除docker容器：docker rm [OPTIONS] CONTAINER [CONTAINER...]
```shell script
    docker rm 9e81183e5ec1
```

运行容器：docker start container
```shell script
    docker start TFormer
```

进入docker容器： docker attach container
```shell script
    docker attach motr
```
退出后台快捷方式： ctrl + p + q




## 对容器的操作,1、开始 2、停止 3、执行一个container容器
```shell script
    docker container start trackformer
    docker container stop trackformer
    docker container exec -it trackformer /bin/bash
```


安装git工具
```shell script
    sudo apt install git
```


获取github项目的例子
```shell script
    git clone [https://github.com/megvii-model/MOTR.git](https://github.com/megvii-model/MOTR.git)
```

安装conda的开发运行版本，优势conda-forge一般是最新的版本
```shell script
    conda install -c conda-forge cudatoolkit-dev
```

如何安装最新的 pip 和 setuptools
```shell script
    pip install --upgrade pip setuptools wheel
```

安装c++的环境,这个包里面有dpkg-dev fakeroot g++ g++-4.6 libalgorithm-diff-perl
  libalgorithm-diff-xs-perl libalgorithm-merge-perl
  libdpkg-perl libstdc++6-4.6-dev libtimedate-perl
```shell script
    sudo apt-get install build-essential
```




source /opt/anaconda3/bin/activate


##trackformer 环境
git clone https://github.com/timmeinhardt/trackformer.git

安装虚拟环境：conda create -n trackformer
激活虚拟环境：conda activate trackformer
conda install pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch
conda install -c conda-forge gcc





