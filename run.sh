#!/bin/sh
python \
    "${HOME}/huggingface/diffusers/scripts/convert_original_stable_diffusion_to_diffusers.py" \
    --checkpoint_path "${HOME}/every_dream_2_setup/EveryDream2trainer/sd_v1-5_vae.ckpt" \
    --image_size 512 \
    --dump_path "${HOME}/every_dream_2_setup/EveryDream2trainer/sd_v1-5_vae.dir" \
;

python \
    "${HOME}/huggingface/diffusers/scripts/convert_original_stable_diffusion_to_diffusers.py" \
    --checkpoint_path "${HOME}/every_dream_2_setup/EveryDream2trainer/v2-1_768-nonema-pruned.ckpt" \
    --image_size 768 \
    --dump_path "${HOME}/every_dream_2_setup/EveryDream2trainer/v2-1_768-nonema-pruned.dir" \
;

cd "${HOME}/every_dream_2_setup/EveryDream2trainer"

python train.py \
    '--resume_ckpt' "${HOME}/every_dream_2_setup/EveryDream2trainer/v2-1_768-nonema-pruned.dir" \
    '--max_epochs' '50' \
    '--data_root' "${HOME}/every_dream_2_setup/EveryDream2trainer/input" \
    '--logdir=log.dir' \
    '--lr_scheduler' 'constant' \
    '--project_name' 'owhx2' \
    '--batch_size' '6' \
    '--sample_steps' '500' \
    '--lr' '2e-7' \
    '--ckpt_every_n_minutes' '20' \
    '--useadam8bit' \
;

# python \
#     '/home/asd/every_dream_2_setup/EveryDream2trainer/utils/convert_original_stable_diffusion_to_diffusers.py' \
#     '--scheduler_type' 'ddim' \
#     '--image_size' '512' \
#     '--checkpoint_path' '/home/asd/every_dream_2_setup/every_dream_output/last-myproj-ep49-gs10450.ckpt' \
#     '--prediction_type' 'epsilon' \
#     '--upcast_attn' 'False' \
#     '--dump_path' '/home/asd/every_dream_2_setup/every_dream_output/last-myproj-ep49-gs10450.dir' \
# ;


python \
    '/home/asd/huggingface/diffusers/scripts/convert_original_stable_diffusion_to_diffusers.py' \
	--checkpoint_path \
	    '/home/asd/every_dream_2_setup/every_dream_output/last-myproj-ep49-gs10450.ckpt' \
	--image_size 512 \
	--dump_path \
	    '/home/asd/every_dream_2_setup/every_dream_output/last-myproj-ep49-gs10450.dir' \
;

# --from_safetensors \
