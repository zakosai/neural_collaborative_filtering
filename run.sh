#!/usr/bin/env bash
list='32 64'
mkdir log
python NeuMF.py --dataset Sato --epochs 20 --batch_size 512 --num_factors 8 --layers [64,32,16,8] --num_neg 4 --lr 0.001 --learner adam --verbose 1 --out 1 --mf_pretrain Pretrain/Sato_GMF_8_1516788813.h5 --mlp_pretrain Pretrain/Sato_MLP_[64,32,16,8]_1516784163.h5 >> log/neuML_8
for num_factors in $list; do
    python NeuMF.py --dataset Sato --epochs 20 --batch_size 512 --num_factors $num_factors --layers [64,32,16,8] --num_neg 4 --lr 0.001 --learner adam --verbose 1 --out 1 --mf_pretrain Pretrain/Sato_GMF_$num_factors.h5 --mlp_pretrain Pretrain/Sato_MLP_[64,32,16,8]_1516788813.h5 >>log/neuMF_$num_factors
done


