#!/bin/bash


FT_DIR="../results/ft_12k"
MODEL_DIR="../../bucket/cns/vj-d/home/daniter/flax_wmt/para_nc1k/checkpoint_300000"
DATA_DIR="../../bucket/cns/tp-d/home/daniter/wmt_data/"
VOCAB_PATH="../../bucket/cns/ym-d/home/daniter/flax_wmt/t2t/sentencepiece_model"
NC_SIZE=12000

NC_SIZE_HALF=6000
FT_DIR_HALF="../results/ft_var6k"

BATCHSZ=128
while [[ $# -gt 0 ]]; do
  case $1 in
    --gpu)
      BATCHSZ=32
      shift # past argument
      ;;
    --half)
      NC_SIZE=$NC_SIZE_HALF
      FT_DIR=$FT_DIR_HALF
      shift
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
  esac
done


python3 train.py --model_dir=$FT_DIR --dataset_name='newscomment_ft_var' \
  --batch_size=$BATCHSZ --num_train_steps=4000 --restore_checkpoints \
  --emb_dim=512 --mlp_dim=2048 --num_heads=8 \
  --vocab_path=$VOCAB_PATH --newscommentary_size=12000 \
  --data_dir=$DATA_DIR --chkpts_to_keep=0 \
  --pretrained_model_dir=$MODEL_DIR \
  --eval_frequency=100 \
  --save_checkpoints=False \
  --compute_bleu=False --learning_rate=0.005
