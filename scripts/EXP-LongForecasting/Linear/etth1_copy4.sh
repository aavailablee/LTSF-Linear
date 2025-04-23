-pred_len 72
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi
seq_len=48

model_name=Linear
data_path=ETTh1.csv
python -u run_longExp.py \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path $data_path \
  --model_id ETTh1_$seq_len'_'72 \
  --model $model_name \
  --data ETTh1 \
  --features M \
  --seq_len $seq_len \
  --pred_len 72 \
  --loss mse \
  --enc_in 7 \
  --des 'Exp' \
  --itr 1 --batch_size 32 --learning_rate 0.005 >logs/LongForecasting/$model_name'_'Etth1-30_$seq_len'_'72.log

model_name=DLinear
python -u run_longExp.py \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path $data_path \
  --model_id ETTh1_$seq_len'_'72 \
  --model $model_name \
  --data ETTh1 \
  --features M \
  --seq_len $seq_len \
  --pred_len 72 \
  --loss mse \
  --enc_in 7 \
  --des 'Exp' \
  --itr 1 --batch_size 32 --learning_rate 0.005 >logs/LongForecasting/$model_name'_'Etth1-30_$seq_len'_'72.log

model_name=NLinear
python -u run_longExp.py \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path $data_path \
  --model_id ETTh1_$seq_len'_'72 \
  --model $model_name \
  --data ETTh1 \
  --features M \
  --seq_len $seq_len \
  --pred_len 72 \
  --loss mse \
  --enc_in 7 \
  --des 'Exp' \
  --itr 1 --batch_size 32 --learning_rate 0.005 >logs/LongForecasting/$model_name'_'Etth1-30_$seq_len'_'72.log
