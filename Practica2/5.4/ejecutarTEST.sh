#!/bin/bash

for i in $(seq 1 19); do
    rm ./5.4/media54
    gcc -x assembler-with-cpp -D TEST=$i ./5.4/media54.s -o ./5.4/media54 -no-pie
    printf "__TEST%02d__%35s\n" $i "" | tr " " "-" ;./5.4/media54
done