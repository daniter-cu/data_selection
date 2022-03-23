#!/bin/bash


FT_DIR="../results/aug_ft_base"
MODEL_DIR="../../bucket/cns/vj-d/home/daniter/flax_wmt/para_nc1k/checkpoint_300000"
DATA_DIR="../../bucket/cns/tp-d/home/daniter/wmt_data/"
FT_DATA_DIR="../../bucket/cns/tp-d/home/daniter/wmt_data/"
VOCAB_PATH="../../bucket/cns/ym-d/home/daniter/flax_wmt/t2t/sentencepiece_model"
IS_SCORE_PATH="../../bucket/cns/pw-d/home/daniter/ende/clf_src/ende_src_bert_scores.csv"
NUM_TO_KEEP=6000
SAMPLE_SIZE=-1
DATASET_NAME="newscommentary_paracrawl"

DATA_DIR_SELECTED="../../bucket/selected_data/training_data.csv"
IS_SCORES_PATH_SELECTED_NN="../../bucket/selected_data/nn_ranking_scores.csv"
IS_SCORES_PATH_SELECTED_KMEANS="../../bucket/selected_data/kmeans_ranking_scores.csv"
DATASET_NAME_SELECTED="selected_data"

BATCHSZ=128
while [[ $# -gt 0 ]]; do
  case $1 in
    --gpu)
      BATCHSZ=32
      shift # past argument
      ;;
    --selected)
      DATASET_NAME=$DATASET_NAME_SELECTED
      DATA_DIR=$DATA_DIR_SELECTED
      IS_SCORE_PATH=$IS_SCORES_PATH_SELECTED_NN
      shift # past argument
      ;;
    --kmeans)
      DATASET_NAME=$DATASET_NAME_SELECTED
      DATA_DIR=$DATA_DIR_SELECTED
      IS_SCORE_PATH=$IS_SCORES_PATH_SELECTED_KMEANS
      shift # past argument
      ;;
    --num_to_keep)
      NUM_TO_KEEP="$2"
      shift # past argument
      shift # past value
      ;;
    --sample_size)
      SAMPLE_SIZE="$2"
      shift # past argument
      shift # past value
      ;;
    --output_dir)
      FT_DIR="$2"
      shift # past argument
      shift # past value
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
  esac
done

echo "Using batch size $BATCHSZ"

python3 train_aug_ft.py --model_dir=$FT_DIR --ft_dataset_name='newscommentary_ft' \
  --dataset_name=$DATASET_NAME --ft_data_dir=$FT_DATA_DIR \
  --batch_size=$BATCHSZ --num_train_steps=4000 --restore_checkpoints \
  --emb_dim=512 --mlp_dim=2048 --num_heads=8 \
  --vocab_path=$VOCAB_PATH --paracrawl_size=4500000 \
  --data_dir=$DATA_DIR --chkpts_to_keep=0 \
  --pretrained_model_dir=$MODEL_DIR --sample_size $SAMPLE_SIZE \
  --eval_frequency=100 --data_selection_size=$NUM_TO_KEEP \
  --save_checkpoints=False --is_scores_path=$IS_SCORE_PATH \
  --compute_bleu=False --learning_rate=0.005
