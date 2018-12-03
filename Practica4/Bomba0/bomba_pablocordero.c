// gcc -Og bomba_pablocordero.c -o bomba_pablocordero -no-pie
// Contraseña = wsxfnm
// Código = 4386

#include <stdio.h>	// para printf(), fgets(), scanf()
#include <stdlib.h>	// para exit()
#include <string.h>	// para strncmp()
#include <sys/time.h>	// para gettimeofday(), struct timeval

#define SIZE 100
#define TLIM 5

char password[]="sotbji\n";		// contraseña
int  passcode  = 13182;			// pin

char* cifradoContr(const char *contr){
	size_t tam = sizeof(contr)/sizeof(char);  // Se calcula el tamaño del array
	char *salida = malloc(tam);

	for(int i=0 ; contr[i]!='\0' ; i++){
		if(contr[i]>='a' && contr[i]<='z'){
			salida[i]=contr[i]-4;
		}
		else{
			salida[i]=contr[i];
		}
	}

	return salida;
}

int cifradoCode(int code){
	int salida = code;

	salida = salida + code;
	salida = salida + 16;
	salida = salida/2;
	salida = salida*3;

	return salida;
}

void boom(void){
	printf(	"\n"
		"***************\n"
		"*** BOOM!!! ***\n"
		"***************\n"
		"\n");
	exit(-1);
}

void defused(void){
	printf(	"\n"
		"·························\n"
		"··· bomba desactivada ···\n"
		"·························\n"
		"\n");
	exit(0);
}

int main(){
	char pw[SIZE];
	int  pc, n;

	struct timeval tv1,tv2;	// gettimeofday() secs-usecs
	gettimeofday(&tv1,NULL);

	do	printf("\nIntroduce la contraseña: ");
	while (	fgets(pw, SIZE, stdin) == NULL );
	if    (	strncmp(cifradoContr(pw),password,sizeof(password)) )
	    boom();

	gettimeofday(&tv2,NULL);
	if    ( tv2.tv_sec - tv1.tv_sec > TLIM )
	    boom();

	do  {	printf("\nIntroduce el pin: ");
	 if ((n=scanf("%i",&pc))==0)
		scanf("%*s")    ==1;         }
	while (	n!=1 );
	if    (	cifradoCode(pc) != passcode )
	    boom();

	gettimeofday(&tv1,NULL);
	if    ( tv1.tv_sec - tv2.tv_sec > TLIM )
	    boom();

	defused();
}
