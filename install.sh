#!/bin/sh
. /opt/anaconda/bin/activate
conda create -n everydream
conda activate everydream

DIR="${HOME}/every_dream_2_setup"
mkdir -pv -- "${DIR}"
cd "${DIR}"

conda install \
    cython \
    ipython \
    jupyter \
    jupyterlab \
    matplotlib \
    nbconvert \
    numpy \
    opencv \
    pandas \
    python=3.10 \
    scikit-learn \
    scikit-learn-intelex \
    scipy \
    tqdm \
    pyqt \
    jinja2 \
;

conda install -c conda-forge \
    termcolor \
    streamlit \
    pudb \
;

pip install -U \
    'accelerate' \
    'aiohttp' \
    'alive-progress' \
    'bitsandbytes' \
    'colorama' \
    'diffusers' \
    'ftfy' \
    'keyboard' \
    'lion-pytorch' \
    'matplotlib' \
    'OmegaConf' \
    'pynvml' \
    'pyre-extensions' \
    'pytorch-lightning' \
    'tensorboard' \
    'torch==1.13.1' \
    'torchaudio==0.13.1' \
    'torchvision==0.14.1' \
    'tqdm' \
    'transformers' \
    'triton' \
    'wandb' \
    'watchdog' \
    'xformers' \
;

git clone 'https://github.com/victorchall/EveryDream2trainer.git'

cd 'EveryDream2trainer'
aria2c -c -x16 'https://huggingface.co/panopstor/EveryDream/resolve/main/sd_v1-5_vae.ckpt'
aria2c -c -x16 'https://huggingface.co/stabilityai/stable-diffusion-2-1/resolve/main/v2-1_768-nonema-pruned.ckpt'

cd "${HOME}"
mkdir -pv -- 'huggingface'
cd 'huggingface'
git clone 'https://github.com/huggingface/diffusers.git'

cd 'diffusers'
pip install -e .
