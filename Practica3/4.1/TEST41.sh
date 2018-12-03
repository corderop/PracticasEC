for i in 0 g 1 2; do
    printf "__OPTIM%1c__%48s\n" $i "" | tr " " "="
    for j in $(seq 1 4); do
        printf "__TEST%02d__%48s\n" $j "" | tr " " "-"
        rm 4.1/Ejercicio41
        gcc 4.1/Ejercicio41.c -o 4.1/Ejercicio41 -O$i -D TEST=$j -g
        ./4.1/Ejercicio41
    done
done