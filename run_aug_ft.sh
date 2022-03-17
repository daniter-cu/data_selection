#!/bin/bash


FT_DIR="../results/aug_ft_base"
MODEL_DIR="../../bucket/cns/vj-d/home/daniter/flax_wmt/para_nc1k/checkpoint_300000"
DATA_DIR="../../bucket/cns/tp-d/home/daniter/wmt_data/"
VOCAB_PATH="../../bucket/cns/ym-d/home/daniter/flax_wmt/t2t/sentencepiece_model"
IS_SCORE_PATH="../../bucket/cns/pw-d/home/daniter/ende/clf_src/ende_src_bert_scores.csv"
NUM_TO_KEEP=6000
SAMPLE_SIZE=6000

python3 train_aug_ft.py --model_dir=$FT_DIR --ft_dataset_name='newscommentary_ft' \
  --dataset_name='newscommentary_paracrawl' \
  --batch_size=128 --num_train_steps=4000 --restore_checkpoints \
  --emb_dim=512 --mlp_dim=2048 --num_heads=8 \
  --vocab_path=$VOCAB_PATH --paracrawl_size=4500000 \
  --data_dir=$DATA_DIR --chkpts_to_keep=0 \
  --pretrained_model_dir=$MODEL_DIR \
  --eval_frequency=100 --data_selection_size=$NUM_TO_KEEP \
  --save_checkpoints=False --is_scores_path=$IS_SCORE_PATH \
  --compute_bleu=False --learning_rate=0.005
