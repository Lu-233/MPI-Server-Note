
# config docker
���õ������ѯ��ַ��https://docs.docker.com/engine/reference/commandline/run/

##��һ������
loginctl enable-linger $USER
dockerd-rootless-setuptool.sh install


##ÿ�����У�����д��bashrc��
loginctl enable-linger $USER
export PATH=???
export DOCKER_HOST=???


##��װdocker
��ȡubuntu18.04����: docker pull ubuntu:18.04 ����������С����ϵͳ�������

�鿴�����б�docker images

�����������������̳�image���񡣲������ļ���·���� docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
docker run --name TFormer -ti -v /home/wangcui/shared:/shared_disk ubuntu:18.04 /bin/bash


ʵ��������������д��
docker run --name TFormer_new u18.04c:v1
docker create -i -t --name test u18.04c:v1


�鿴��ǰ�ļ�·����ls

��װ�������ubuntu
����С������ 
    unminimize
    `sudo apt update && sudo apt full-upgrade`
    apt install vim
    sudo passwd ��gg��
    
��װminiconda3
wget [https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh](https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh)
bash [�����ļ�][.sh](http://xxx.sh)
bash https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh](https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
�������source /opt/anaconda3/bin/activate
��ɺ���������
docker restart TFormer

������ docker commit -a ����  ����id �������֣�������ǩ
docker commit -a cui -m "complete u18.04" cbe37b45a22c u18.04c:v1



##docker�ĳ�������
docker image rm [OPTIONS] IMAGE [IMAGE...]

ɾ��image����docker image rm 5a5c46a1ad43

ɾ��������docker rm [OPTIONS] CONTAINER [CONTAINER...]
docker rm 9e81183e5ec1

����������docker start TFormer
����dockerǰ̨ docker attach motr
�˳���̨ ctrl + p + q




# �������Ĳ���
docker container start trackformer
docker container stop trackformer
docker container exec -it trackformer /bin/bash



sudo apt install git

git clone [https://github.com/megvii-model/MOTR.git](https://github.com/megvii-model/MOTR.git)

conda install -c conda-forge cudatoolkit-dev

pip install --upgrade pip setuptools wheel

sudo apt-get install build-essential



source /opt/anaconda3/bin/activate


##trackformer ����
git clone https://github.com/timmeinhardt/trackformer.git

��װ���⻷����conda create -n trackformer
�������⻷����conda activate trackformer
conda install pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch
conda install -c conda-forge gcc





