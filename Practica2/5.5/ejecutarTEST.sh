#!/bin/bash

for i in $(seq 1 19); do
    rm ./5.5/media55
    gcc -x assembler-with-cpp -D TEST=$i ./5.5/media55.s -o ./5.5/media55 -no-pie
    printf "__TEST%02d__%35s\n" $i "" | tr " " "-" ;./5.5/media55
done