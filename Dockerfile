FROM pytorch/pytorch:1.7.1-cuda11.0-cudnn8-devel

ENV PATH /opt/conda/bin:$PATH
ENV LD_LIBRARY_PATH /usr/lib/x86_64-linux-gnu:/usr/local/cuda-11.0/lib64:$LD_LIBRARY_PATH

RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    APT_INSTALL="apt-get install -y --no-install-recommends -u" && \
    #PIP_INSTALL_QH="python -m pip --no-cache-dir install --upgrade -i https://pypi.tuna.tsinghua.edu.cn/simple" && \
    PIP_INSTALL="python -m pip --no-cache-dir install --user --no-warn-script-location" && \
    GIT_CLONE="git clone --depth 10" && \
    CONDA_INSTALL="conda install -y" && \
    rm -rf /var/lib/apt/lists/* \
           /etc/apt/sources.list.d/cuda.list \
           /etc/apt/sources.list.d/nvidia-ml.list && \
    apt-get update && \
# ==================================================================
# tools
# ------------------------------------------------------------------
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        apt-utils \
        build-essential \
        ca-certificates \
        cmake \
        wget \
        git \
        vim \
        htop \
        tmux \
        openssh-client \
        openssh-server \
        libboost-dev \
        libboost-thread-dev \
        libboost-filesystem-dev \
        libglib2.0-0 \
        libsm6 \
        libgl1-mesa-glx \
        libxext6 \
        libxrender-dev \
        unzip \
        rsync \
        && \
    $CONDA_INSTALL \
        python=3.8.5 \
        pandas && \
    pip install --upgrade pip && \
	$PIP_INSTALL \
        numpy \
        pillow \
        opencv_python \
        scikit-learn \
        scipy \
        matplotlib \
        plyfile \
        nvidia-ml-py \
        yacs \
        tqdm \
        argparse \
        sacred \
        progressbar2 \
        path.py \
        h5py \
        blessings \
        scikit-image \
        lz4 \
        terminaltables \
        future tensorboard \
        addict \
        yapf \
        contiguous_params \
        prettytable \
        albumentations \
        timm \
        mmcv \
        mmcls \
        jupyterlab \
        -i https://mirrors.aliyun.com/pypi/simple/ -f https://download.pytorch.org/whl/torch_stable.html && \
    $PIP_INSTALL \
        detectron2 -f https://dl.fbaipublicfiles.com/detectron2/wheels/cu110/torch1.7/index.html && \
    conda clean -y --all && \
# ==================================================================
# config & cleanup
# ------------------------------------------------------------------
    ldconfig && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* ~/*
EXPOSE 6006
