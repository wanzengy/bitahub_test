FROM pytorch/pytorch:1.13.0-cuda11.6-cudnn8-devel

ENV PATH /root/.local/bin:$PATH
ENV LD_LIBRARY_PATH /usr/lib/x86_64-linux-gnu:/usr/local/cuda-11.0/lib64:$LD_LIBRARY_PATH

RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    #PIP_INSTALL_QH="python -m pip --no-cache-dir install --upgrade -i https://pypi.tuna.tsinghua.edu.cn/simple" && \
    PIP_INSTALL="python -m pip --no-cache-dir install --user" && \
    CONDA_INSTALL="conda install -y" && \
    apt-get update && \
    apt-get install -y ffmpeg libsm6 libxext6 && \
    pip install --upgrade pip && \
	$PIP_INSTALL \
        numpy \
        pillow \
        pandas \
        visdom \
        opencv_python \
        scikit-learn \
        scipy \
        matplotlib \
        h5py \
        tqdm \
        argparse \
        progress \
        progressbar2 \
        scikit-image \
        prettytable \
        timm \
        tensorboard \
        openmim \
        -i https://mirrors.aliyun.com/pypi/simple/ && \
    mim install mmcv-full && \
    $PIP_INSTALL \
        pyg-lib \
        torch-scatter \
        torch-sparse \
        torch-cluster \
        torch-spline-conv \
        torch-geometric \
        -f https://data.pyg.org/whl/torch-1.13.0+cu116.html
