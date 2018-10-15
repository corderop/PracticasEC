
# Ordenes para ejecutar el ejercicio 5.1
ejecutar51: compilar51
	./5.1/media51

compilar51: 5.1/media51.s
	gcc 5.1/media51.s -o 5.1/media51 -no-pie

# Ordenes para ejecutar el ejercicio 5.2
ejecutar52: darPermisos52
	./5.2/ejecutarTEST.sh
darPermisos52:
	chmod a+x 5.2/ejecutarTEST.sh

# Ordenes para ejecutar el ejercicio 5.3
ejecutar53: darPermisos53
	./5.3/ejecutarTEST.sh
darPermisos53:
	chmod a+x 5.3/ejecutarTEST.sh

# Ordenes para ejecutar el ejercicio 5.4
ejecutar54: darPermisos54
	./5.4/ejecutarTEST.sh
darPermisos54:
	chmod a+x 5.4/ejecutarTEST.sh

# Ordenes para ejecutar el ejercicio 5.5
ejecutar55: darPermisos55
	./5.5/ejecutarTEST.sh
darPermisos55:
	chmod a+x 5.5/ejecutarTEST.sh

#Orden para limpiar los ejecutables
clean:
	rm -R *.o *.out 5.1/media51 5.2/media52 5.3/media53 5.4/media54 5.5/media55
