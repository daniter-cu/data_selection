#!/bin/bash


FT_DIR="../results/ft_base"
MODEL_DIR="../../bucket/cns/vj-d/home/daniter/flax_wmt/para_nc1k/checkpoint_300000"
DATA_DIR="../../bucket/cns/tp-d/home/daniter/wmt_data/"
VOCAB_PATH="../../bucket/cns/ym-d/home/daniter/flax_wmt/t2t/sentencepiece_model"

python3 train.py --model_dir=$FT_DIR --dataset_name='newscommentary_ft' \
  --batch_size=32 --num_train_steps=4000 --restore_checkpoints \
  --emb_dim=512 --mlp_dim=2048 --num_heads=8 \
  --vocab_path=$VOCAB_PATH \
  --data_dir=$DATA_DIR --chkpts_to_keep=0 \
  --pretrained_model_dir=$MODEL_DIR \
  --eval_frequency=100 \
  --save_checkpoints=False \
  --compute_bleu=False --learning_rate=0.005
