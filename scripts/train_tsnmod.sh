#!/usr/bin/env bash

DATASET=$1
MODALITY=$2

TOOLS=lib/caffe-action/build/install/bin
LOG_FILE=logs/${DATASET}_${MODALITY}_validtop3.log
N_GPU=8
MPI_BIN_DIR=/home/mscvproject/tools/openmpi/openmpi-2.0.2/install/bin/


echo "logging to ${LOG_FILE}"

${MPI_BIN_DIR}mpirun -np $N_GPU \
$TOOLS/caffe train --solver=models/${DATASET}/tsn_bn_inception_${MODALITY}_solver.prototxt  \
   --weights=models/bn_inception_${MODALITY}_init.caffemodel 2>&1 | tee ${LOG_FILE}
