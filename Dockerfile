FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-devel

ENV PATH /root/.local/bin:$PATH
ENV LD_LIBRARY_PATH /usr/lib/x86_64-linux-gnu:/usr/local/cuda-11.3/lib64:$LD_LIBRARY_PATH

RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    #PIP_INSTALL_QH="python -m pip --no-cache-dir install --upgrade -i https://pypi.tuna.tsinghua.edu.cn/simple" && \
    PIP_INSTALL="python -m pip --no-cache-dir install" && \
    CONDA_INSTALL="conda install -y" && \
    apt-get update && \
    apt-get install -y ffmpeg libsm6 libxext6 openssh-server && \
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
        torch_geometric \
         jupyterlab \
        -i https://mirrors.aliyun.com/pypi/simple/ -f https://download.pytorch.org/whl/torch_stable.html && \
    mim install mmcv-full && \
    $PIP_INSTALL \
        pyg-lib \
        torch_scatter \
        torch_sparse \
        torch_cluster \
        torch_spline_conv \
        -f https://data.pyg.org/whl/torch-2.0.0+cu117.html && \
    echo 'alias jupyter-notebook="jupyter-notebook --allow-root"' >> ~/.bashrc

 EXPOSE 6006
