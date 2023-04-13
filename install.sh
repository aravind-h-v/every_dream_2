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

cd "${HOME}/every_dream_2_setup/EveryDream2trainer"

python ./train.py \
    '--batch_size=2' \
    '--ckpt_every_n_minutes=20' \
    '--cond_dropout=0.04' \
    '--data_root=input.dir' \
    '--flip_p=0.0' \
    '--gradient_checkpointing' \
    '--grad_accum=1' \
    '--logdir=log.dir' \
    '--log_step=25' \
    '--lowvram' \
    '--lr=0.0000002' \
    '--max_epochs=30' \
    '--project_name=owhx' \
    '--resolution=512' \
    '--resume_ckpt=runwayml/stable-diffusion-v1-5' \
;
