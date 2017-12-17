#!/usr/bin/env sh
exp=vgg_SCNN_DULR_w9
data=./data/CULane
th main.lua \
   -data  ${data} \
   -train ${data}/list/train_gt.txt \
   -val ${data}/list/val_gt.txt \
   -dataset lane \
   -save experiments/models/${exp} \
   -retrain experiments/models/${exp}/${exp}.t7 \
   -shareGradInput true \
   -nThreads 2 \
   -nGPU 4 \
   -batchSize 12 \
   -maxIter 60000 \
   -LR 0.01 \
   -backWeight 0.4 \
   -nEpochs 100 \
2>&1|tee experiments/models/${exp}/train.log
