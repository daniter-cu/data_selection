#!/bin/bash

bash run_aug_ft.sh --num_to_keep 24000 --output_dir ../results/aug_ft_keep24k_lr --lr 0.01
bash run_aug_ft.sh --num_to_keep 50000 --output_dir ../results/aug_ft_keep50k_lr --lr 0.01
bash run_aug_ft.sh --num_to_keep 100000 --output_dir ../results/aug_ft_keep100k_lr --lr 0.01

# ## downsampling


# # 24k
bash run_aug_ft.sh --num_to_keep 24000 --sample_size 12000 \
--output_dir ../results/aug_ft_keep24k_samp12k_lr --lr 0.01

# # 50k
bash run_aug_ft.sh --num_to_keep 50000 --sample_size 12000 \
--output_dir ../results/aug_ft_keep50k_samp12k_lr --lr 0.01
bash run_aug_ft.sh --num_to_keep 50000 --sample_size 24000 \
--output_dir ../results/aug_ft_keep50k_samp24k_lr --lr 0.01

# # 100k
bash run_aug_ft.sh --num_to_keep 100000 --sample_size 12000 \
--output_dir ../results/aug_ft_keep100k_samp12k_lr --lr 0.01
bash run_aug_ft.sh --num_to_keep 100000 --sample_size 24000 \
--output_dir ../results/aug_ft_keep100k_samp24k_lr --lr 0.01
bash run_aug_ft.sh --num_to_keep 100000 --sample_size 50000 \
--output_dir ../results/aug_ft_keep100k_samp50k_lr --lr 0.01

