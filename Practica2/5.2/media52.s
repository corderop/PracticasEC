.section .data

#ifndef TEST
#define TEST 9
#endif
	.macro linea				# Resultado - Comentario
  #if TEST==1					// 16 – Todos los elementos a 1
		.int 1,1,1,1
		.int 1,1,1,1
		.int 1,1,1,1
		.int 1,1,1,1
#elif TEST==2					// 0x0 ffff fff0 - Máximo elem e para que 16e no produzca acarreos
		.int 0x0fffffff, 0x0fffffff, 0x0fffffff, 0x0fffffff
		.int 0x0fffffff, 0x0fffffff, 0x0fffffff, 0x0fffffff
		.int 0x0fffffff, 0x0fffffff, 0x0fffffff, 0x0fffffff
		.int 0x0fffffff, 0x0fffffff, 0x0fffffff, 0x0fffffff
#elif TEST==3					// 0x1 0000 0000 - Mínimo elem e para que 16e sí produzca 1 acarreo
		.int 0x10000000, 0x10000000, 0x10000000, 0x10000000
		.int 0x10000000, 0x10000000, 0x10000000, 0x10000000
		.int 0x10000000, 0x10000000, 0x10000000, 0x10000000
		.int 0x10000000, 0x10000000, 0x10000000, 0x10000000
#elif TEST==4					// 0xf ffff fff0 - Notar agrupación de 4 en 4 dígitos hexadec,
		.int 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
		.int 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
		.int 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
		.int 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
#elif TEST==5					// ?? ??? ??? ??? - Nora
		.int -1,-1,-1,-1
		.int -1,-1,-1,-1
		.int -1,-1,-1,-1
		.int -1,-1,-1,-1
#elif TEST==6					// 3 200 000 000 - Máx e A*10B^3 p/suma representable uns32b <=4Gi-1
		.int 200000000, 200000000, 200000000, 200000000
		.int 200000000, 200000000, 200000000, 200000000
		.int 200000000, 200000000, 200000000, 200000000
		.int 200000000, 200000000, 200000000, 200000000
#elif TEST==7					// 4 800 000 000 - Mín el A·10B^3 p/suma produzca 1CF uns32b (>=4Gi)
		.int 300000000, 300000000, 300000000, 300000000
		.int 300000000, 300000000, 300000000, 300000000
		.int 300000000, 300000000, 300000000, 300000000
		.int 300000000, 300000000, 300000000, 300000000
#elif TEST==8					// 80 000 000 000 - Mín elm tipo A·10B no representable uns32b>=4Gi
 		.int 5000000000, 5000000000, 5000000000, 5000000000
		.int 5000000000, 5000000000, 5000000000, 5000000000
		.int 5000000000, 5000000000, 5000000000, 5000000000
		.int 5000000000, 5000000000, 5000000000, 5000000000
#else
 		.error "Definir TEST entre 1..8"
#endif
 		.endm

lista: 		linea
longlista:	.int   	(.-lista)/4
resultado:	.quad   	0
formato:	.ascii "resultado \t =   %18lu (uns)\n"
			.ascii 		   "\t\t = 0x%18lx (hex)\n"
			.asciz         "\t\t = 0x %08x %08x \n"

# opción: 1) no usar printf, 2)3) usar printf/fmt/exit, 4) usar tb main
# 1) as  suma.s -o suma.o
#    ld  suma.o -o suma					1232 B
# 2) as  suma.s -o suma.o				6520 B
#    ld  suma.o -o suma -lc -dynamic-linker /lib64/ld-linux-x86-64.so.2
# 3) gcc suma.s -o suma -no-pie –nostartfiles		6544 B
# 4) gcc suma.s -o suma	-no-pie				8664 B

.section .text
main: .global  main

	call trabajar	# subrutina de usuario
	call imprim_C	# printf()  de libC
	call acabar_C	# exit()    de libC
	ret

trabajar:
	mov     $lista, %rbx
	mov  longlista, %ecx
	call suma		# == suma(&lista, longlista);
	mov  %eax, resultado
	mov  %edx, resultado+4
	ret

suma:
	mov  $0, %eax
	mov  $0, %edx
	mov  $0, %rsi
bucle:
	add  (%rbx,%rsi,4), %eax
	adc  $0, %edx
	inc  %rsi
	cmp  %rsi,%rcx
	jne  bucle

	ret

imprim_C:			# requiere libC
	mov   $formato, %rdi
	mov   resultado, %rsi
	mov   resultado, %rdx
	mov	  resultado+4, %ecx
	mov	  resultado, %r8d
	mov          $0,%eax
	call  printf		
	ret

acabar_C:			# requiere libC
	mov  $0, %edi
	call _exit		# ==  exit(resultado)
	ret
