#!/bin/bash

for i in $(seq 1 19); do
    rm ./5.3/media53
    gcc -x assembler-with-cpp -D TEST=$i ./5.3/media53.s -o ./5.3/media53 -no-pie
    printf "__TEST%02d__%35s\n" $i "" | tr " " "-" ;./5.3/media53
done