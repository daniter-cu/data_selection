#!/bin/bash

# bash run_aug_ft.sh --num_to_keep 6000 --output_dir ../results/aug_ft_keep6k
# bash run_aug_ft.sh --num_to_keep 12000 --output_dir ../results/aug_ft_keep12k
# bash run_aug_ft.sh --num_to_keep 24000 --output_dir ../results/aug_ft_keep24k
# bash run_aug_ft.sh --num_to_keep 50000 --output_dir ../results/aug_ft_keep50k
# bash run_aug_ft.sh --num_to_keep 100000 --output_dir ../results/aug_ft_keep100k

# ## downsampling

# # 12k
bash run_aug_ft.sh --num_to_keep 12000 --sample_size 6000 \
--output_dir ../results/aug_ft_keep12k_samp6k_norep

# 24k
bash run_aug_ft.sh --num_to_keep 24000 --sample_size 6000 \
--output_dir ../results/aug_ft_keep24k_samp6k_norep
bash run_aug_ft.sh --num_to_keep 24000 --sample_size 12000 \
--output_dir ../results/aug_ft_keep24k_samp12k_norep

# 50k
bash run_aug_ft.sh --num_to_keep 50000 --sample_size 6000 \
--output_dir ../results/aug_ft_keep50k_samp6k_norep
bash run_aug_ft.sh --num_to_keep 50000 --sample_size 12000 \
--output_dir ../results/aug_ft_keep50k_samp12k_norep
bash run_aug_ft.sh --num_to_keep 50000 --sample_size 24000 \
--output_dir ../results/aug_ft_keep50k_samp24k_norep --lr 0.04

# 100k
bash run_aug_ft.sh --num_to_keep 100000 --sample_size 6000 \
--output_dir ../results/aug_ft_keep100k_samp6k_norep
bash run_aug_ft.sh --num_to_keep 100000 --sample_size 12000 \
--output_dir ../results/aug_ft_keep100k_samp12k_norep
bash run_aug_ft.sh --num_to_keep 100000 --sample_size 24000 \
--output_dir ../results/aug_ft_keep100k_samp24k_norep --lr 0.04
bash run_aug_ft.sh --num_to_keep 100000 --sample_size 50000 \
--output_dir ../results/aug_ft_keep100k_samp50k_norep --lr 0.04

# NN
#bash run_aug_ft.sh --num_to_keep 6000 --output_dir ../results/aug_ft_nn_keep6k --selected
#bash run_aug_ft.sh --num_to_keep 12000 --output_dir ../results/aug_ft_nn_keep12k --selected
#bash run_aug_ft.sh --num_to_keep 24000 --output_dir ../results/aug_ft_nn_keep24k --selected
#bash run_aug_ft.sh --num_to_keep 50000 --output_dir ../results/aug_ft_nn_keep50k --selected
#bash run_aug_ft.sh --num_to_keep 100000 --output_dir ../results/aug_ft_nn_keep100k --selected

# KMEANS
# bash run_aug_ft.sh --num_to_keep 6000 --output_dir ../results/aug_ft_kmeans_keep6k --kmeans
# bash run_aug_ft.sh --num_to_keep 12000 --output_dir ../results/aug_ft_kmeans_keep12k --kmeans
# bash run_aug_ft.sh --num_to_keep 24000 --output_dir ../results/aug_ft_kmeans_keep24k --kmeans
# bash run_aug_ft.sh --num_to_keep 50000 --output_dir ../results/aug_ft_kmeans_keep50k --kmeans
