#!/bin/bash
set -e
set -x

input_file="/data/ml-20m/ratings.csv"

if [ ! -f $input_file ] ; then
  echo 'Downloading ml-20m data...'
  curl -O http://files.grouplens.org/datasets/movielens/ml-20m.zip
  unzip ml-20m.zip
  mv ml-20m /data
else
  echo 'Using existing input file'
fi

output_prefix="/data/"
num_row_multiplier=16
num_col_multiplier=32

cd $output_prefix

python /workspace/fractal_graph_expansion/run_expansion.py --input_csv_file=$input_file --output_prefix=$output_prefix --num_row_multiplier=$num_row_multiplier --num_col_multiplier=$num_col_multiplier
#python /workspace/fractal_graph_expansion/post_process.py --output_prefix=$output_prefix --num_shards=$num_row_multiplier
