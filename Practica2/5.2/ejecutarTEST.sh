#!/bin/bash

for i in $(seq 1 8); do
    rm ./5.2/media52
    gcc -x assembler-with-cpp -D TEST=$i ./5.2/media52.s -o ./5.2/media52 -no-pie
    printf "__TEST%02d__%35s\n" $i "" | tr " " "-" ;./5.2/media52
done