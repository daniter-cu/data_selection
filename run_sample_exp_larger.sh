#!/bin/bash

#bash run_aug_ft.sh --num_to_keep 200000 --output_dir ../results/aug_ft_keep200k_lr4 --lr 0.04
#bash run_aug_ft.sh --num_to_keep 300000 --output_dir ../results/aug_ft_keep300k_lr4 --lr 0.04
#bash run_aug_ft.sh --num_to_keep 500000 --output_dir ../results/aug_ft_keep500k_lr4 --lr 0.04

# ## downsampling

bash run_aug_ft.sh --num_to_keep 4000000 --sample_size 12000 \
--output_dir ../results/aug_ft_keep4M_samp12k_lr4 --lr 0.04

# # 200k
#bash run_aug_ft.sh --num_to_keep 200000 --sample_size 12000 \
#--output_dir ../results/aug_ft_keep200k_samp12k_lr4 --lr 0.04

# # 300k
#bash run_aug_ft.sh --num_to_keep 30000 --sample_size 12000 \
#--output_dir ../results/aug_ft_keep300k_samp12k_lr4 --lr 0.04


# # 500k
#bash run_aug_ft.sh --num_to_keep 500000 --sample_size 12000 \
#--output_dir ../results/aug_ft_keep500k_samp12k_lr4 --lr 0.04


