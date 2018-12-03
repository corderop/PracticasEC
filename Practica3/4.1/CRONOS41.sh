for i in 0 g 1 2; do
    printf "__OPTIM%1c__%48s\n" $i "" | tr " " "="
    rm 4.1/Ejercicio41
    gcc 4.1/Ejercicio41.c -o 4.1/Ejercicio41 -O$i -D TEST=0
    for j in $(seq 0 10); do
        echo $j; ./4.1/Ejercicio41
    done | pr -11 -l 22 -w 80
done