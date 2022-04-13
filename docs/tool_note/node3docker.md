
# config docker
常用的命令查询网址：https://docs.docker.com/engine/reference/commandline/run/

##第一次运行
loginctl enable-linger $USER
dockerd-rootless-setuptool.sh install


##每次运行（可以写到bashrc）
loginctl enable-linger $USER
export PATH=???
export DOCKER_HOST=???


##安装docker
拉取ubuntu18.04镜像: docker pull ubuntu:18.04 （这里是最小化的系统镜像包）

查看镜像列表：docker images

创建并运行容器，继承image镜像。并挂载文件夹路径： docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
docker run --name TFormer -ti -v /home/wangcui/shared:/shared_disk ubuntu:18.04 /bin/bash


实例化容器：两种写法
docker run --name TFormer_new u18.04c:v1
docker create -i -t --name test u18.04c:v1


查看当前文件路径：ls

安装完整版的ubuntu
非最小化处理 
    unminimize
    `sudo apt update && sudo apt full-upgrade`
    apt install vim
    sudo passwd （gg）
    
安装miniconda3
wget [https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh](https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh)
bash [上述文件][.sh](http://xxx.sh)
bash https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh](https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
激活环境：source /opt/anaconda3/bin/activate
完成后重启容器
docker restart TFormer

镜像打包 docker commit -a 作者  容器id 容器名字：容器标签
docker commit -a cui -m "complete u18.04" cbe37b45a22c u18.04c:v1



##docker的常用命令
docker image rm [OPTIONS] IMAGE [IMAGE...]

删除image镜像：docker image rm 5a5c46a1ad43

删除容器：docker rm [OPTIONS] CONTAINER [CONTAINER...]
docker rm 9e81183e5ec1

运行容器：docker start TFormer
进入docker前台 docker attach motr
退出后台 ctrl + p + q




# 对容器的操作
docker container start trackformer
docker container stop trackformer
docker container exec -it trackformer /bin/bash



sudo apt install git

git clone [https://github.com/megvii-model/MOTR.git](https://github.com/megvii-model/MOTR.git)

conda install -c conda-forge cudatoolkit-dev

pip install --upgrade pip setuptools wheel

sudo apt-get install build-essential



source /opt/anaconda3/bin/activate


##trackformer 环境
git clone https://github.com/timmeinhardt/trackformer.git

安装虚拟环境：conda create -n trackformer
激活虚拟环境：conda activate trackformer
conda install pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch
conda install -c conda-forge gcc





