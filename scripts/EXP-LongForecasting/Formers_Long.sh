# ALL scripts in this file come from Autoformer
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi

for model_name in Autoformer Informer Transformer
do 
for pred_len in 24 72
do
  
  python -u run_longExp.py \
    --is_training 1 \
    --root_path ./dataset/ \
    --data_path traffic.csv \
    --model_id traffic_48_$pred_len \
    --model $model_name \
    --data custom \
    --features M \
    --seq_len 48 \
    --label_len 24 \
    --pred_len $pred_len \
    --e_layers 2 \
    --d_layers 1 \
    --factor 3 \
    --enc_in 862 \
    --dec_in 862 \
    --c_out 862 \
    --des 'Exp' \
    --itr 1 \
    --train_epochs 3 >logs/LongForecasting/$model_name'_traffic_'$pred_len.log

  

  python -u run_longExp.py \
      --is_training 1 \
      --root_path ./dataset/ \
      --data_path ETTh1.csv \
      --model_id ETTh1_48_$pred_len \
      --model $model_name \
      --data ETTh1 \
      --features M \
      --seq_len 48 \
      --label_len 24 \
      --pred_len $pred_len \
      --e_layers 2 \
      --d_layers 1 \
      --factor 3 \
      --enc_in 7 \
      --dec_in 7 \
      --c_out 7 \
      --des 'Exp' \
      --itr 1  >logs/LongForecasting/$model_name'_Etth1_'$pred_len.log
  
  
done
done
