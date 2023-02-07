FROM pytorch/pytorch:1.12.0-cuda11.3-cudnn8-devel

ENV PATH /root/.local/bin:$PATH
ENV LD_LIBRARY_PATH /usr/lib/x86_64-linux-gnu:/usr/local/cuda-11.3/lib64:$LD_LIBRARY_PATH

RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    #PIP_INSTALL_QH="python -m pip --no-cache-dir install --upgrade -i https://pypi.tuna.tsinghua.edu.cn/simple" && \
    PIP_INSTALL="python -m pip --no-cache-dir install" && \
    CONDA_INSTALL="conda install -y" && \
    apt-get update && \
    apt-get install -y ffmpeg libsm6 libxext6 && \
    pip install --upgrade pip -i https://mirrors.aliyun.com/pypi/simple/ && \
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
        torch-geometric \
         jupyterlab \
        -i https://mirrors.aliyun.com/pypi/simple/ -f https://download.pytorch.org/whl/torch_stable.html && \
    mim install mmcv-full && \
    $PIP_INSTALL \
        pyg-lib \
        torch-scatter \
        torch-sparse \
        torch-cluster \
        torch-spline-conv \
        -f https://data.pyg.org/whl/torch-1.12.0+cu113.html && \
    echo 'alias jupyter-notebook="jupyter-notebook --allow-root"' >> ~/.bashrc

 EXPOSE 6006b
