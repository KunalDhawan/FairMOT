#!/bin/bash

# This code allows for easy inference on a set of videos. 

#Provide the folder name in the base directory containing the input videos here
declare -a arr=("input_folder")

for i in "${arr[@]}"
do
    for j in /Desktop/FairMOT/$i/*.mp4; do
    #python demo.py mot --load_model ../models/all_dla34.pth --input-video $j --output-root ../Result_${i}/ --conf_thres 0.4
    #echo $j
    filename=$(basename -- "$j")
    filename="${filename%.*}"
    #echo $filename
    #to run on GPU, pass argument --gpus <gpu ids>
    #to run on CPU, pass argument --gpus -1 and make corresponding change on line 63 of track.py
    python demo.py mot --load_model ../models/all_dla34.pth --input-video $j --output-root ../Result_${i} --filename ${filename} --conf_thres 0.4 --gpus -1
    done
done

#to run directly from bash: python demo.py mot --load_model ../models/all_dla34.pth --input-video ../videos/3.mp4 --output-root ../results_3 --conf_thres 0.4
