#!/bin/bash

for i in {001..028}; do
 wget -o /wget.log http://loremflickr.com/320/240/cat/"pdkt_kusuma_$i".jpg
done

