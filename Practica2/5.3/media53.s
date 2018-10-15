.section .data

#ifndef TEST
#define TEST 20
#endif
	.macro linea				# Resultado - Comentario
  #if TEST==1					// -16 – Todos los elementos a -1
		.int -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
#elif TEST==2					// 0x0 ???? ???? - positivo pequeño (suma cabría en sgn32b)
		.int 0x04000000, 0x04000000, 0x04000000, 0x04000000
		.int 0x04000000, 0x04000000, 0x04000000, 0x04000000
		.int 0x04000000, 0x04000000, 0x04000000, 0x04000000
		.int 0x04000000, 0x04000000, 0x04000000, 0x04000000
#elif TEST==3					// 0x0 ???? ???? - positivo intermedio (sm. cabría en uns32b)
		.int 0x08000000, 0x08000000, 0x08000000, 0x08000000
		.int 0x08000000, 0x08000000, 0x08000000, 0x08000000
		.int 0x08000000, 0x08000000, 0x08000000, 0x08000000
		.int 0x08000000, 0x08000000, 0x08000000, 0x08000000
#elif TEST==4					// 0x0 ???? ???? - positivo intermedio (sm. no cabría en uns32b)
		.int 0x10000000, 0x10000000, 0x10000000, 0x10000000
		.int 0x10000000, 0x10000000, 0x10000000, 0x10000000
		.int 0x10000000, 0x10000000, 0x10000000, 0x10000000
		.int 0x10000000, 0x10000000, 0x10000000, 0x10000000
#elif TEST==5					// 0x0 ???? ???? - positivo grande (máximo elem. en sgn32b)
		.int 0x7FFFFFFF,0x7FFFFFFF,0x7FFFFFFF,0x7FFFFFFF
		.int 0x7FFFFFFF,0x7FFFFFFF,0x7FFFFFFF,0x7FFFFFFF
		.int 0x7FFFFFFF,0x7FFFFFFF,0x7FFFFFFF,0x7FFFFFFF
		.int 0x7FFFFFFF,0x7FFFFFFF,0x7FFFFFFF,0x7FFFFFFF
#elif TEST==6					// 0xffff ???? ???? ???? - negativo grande (mínimo elem. en sgn32b)
		.int 0x80000000, 0x80000000, 0x80000000, 0x80000000
		.int 0x80000000, 0x80000000, 0x80000000, 0x80000000
		.int 0x80000000, 0x80000000, 0x80000000, 0x80000000
		.int 0x80000000, 0x80000000, 0x80000000, 0x80000000
#elif TEST==7					// 0xffff ???? ???? ???? - negativo intermedio (no cabría en sgn32b)
		.int 0xF0000000, 0xF0000000, 0xF0000000, 0xF0000000
		.int 0xF0000000, 0xF0000000, 0xF0000000, 0xF0000000
		.int 0xF0000000, 0xF0000000, 0xF0000000, 0xF0000000
		.int 0xF0000000, 0xF0000000, 0xF0000000, 0xF0000000
#elif TEST==8					// 0xffff ???? ???? ???? - negativo pequeño (suma cabría en sgn32b)
 		.int 0xF8000000, 0xF8000000, 0xF8000000, 0xF8000000
		.int 0xF8000000, 0xF8000000, 0xF8000000, 0xF8000000
		.int 0xF8000000, 0xF8000000, 0xF8000000, 0xF8000000
		.int 0xF8000000, 0xF8000000, 0xF8000000, 0xF8000000
#elif TEST==9					// 0xffff ???? ???? ???? - anterior-1 es interm. (no cabría en sgn32b)
 		.int 0xF7FFFFFF, 0xF7FFFFFF, 0xF7FFFFFF, 0xF7FFFFFF
		.int 0xF7FFFFFF, 0xF7FFFFFF, 0xF7FFFFFF, 0xF7FFFFFF
		.int 0xF7FFFFFF, 0xF7FFFFFF, 0xF7FFFFFF, 0xF7FFFFFF
		.int 0xF7FFFFFF, 0xF7FFFFFF, 0xF7FFFFFF, 0xF7FFFFFF
#elif TEST==10					// ? ??? ??? ??? - fácil calcular q. suma cabe sgn32b (<=2Gi-1)
		.int 100000000,100000000,100000000,100000000
		.int 100000000,100000000,100000000,100000000
		.int 100000000,100000000,100000000,100000000
		.int 100000000,100000000,100000000,100000000
#elif TEST==11					// ? ??? ??? ??? - pos+gran A·10^B suma cabe uns32b (<=4Gi-1)
		.int 200000000,200000000,200000000,200000000
		.int 200000000,200000000,200000000,200000000
		.int 200000000,200000000,200000000,200000000
		.int 200000000,200000000,200000000,200000000
#elif TEST==12					// ? ??? ??? ??? - pos+peq A·10^B suma no cabe uns32b(>=4Gi)
		.int 300000000, 300000000, 300000000, 300000000
		.int 300000000, 300000000, 300000000, 300000000
		.int 300000000, 300000000, 300000000, 300000000
		.int 300000000, 300000000, 300000000, 300000000
#elif TEST==13					// ? ??? ??? ??? - pos+gran A·10^B reprsntble sgn32b (<=2Gi-1)
 		.int 2000000000, 2000000000, 2000000000, 2000000000
		.int 2000000000, 2000000000, 2000000000, 2000000000
		.int 2000000000, 2000000000, 2000000000, 2000000000
		.int 2000000000, 2000000000, 2000000000, 2000000000
#elif TEST==14 					// ? ??? ??? ??? - anterior-1 es interm. (no cabría en sgn32b)
 		.quad 3000000000, 3000000000, 3000000000, 3000000000
		.quad 3000000000, 3000000000, 3000000000, 3000000000
		.quad 3000000000, 3000000000, 3000000000, 3000000000
		.quad 3000000000, 3000000000, 3000000000, 3000000000
#elif TEST==15					// ? ??? ??? ??? - fácil calcular q. suma cabe sgn32b (<=2Gi-1)
		.int -100000000,-100000000,-100000000,-100000000
		.int -100000000,-100000000,-100000000,-100000000
		.int -100000000,-100000000,-100000000,-100000000
		.int -100000000,-100000000,-100000000,-100000000
#elif TEST==16					// ? ??? ??? ??? - pos+gran A·10^B suma cabe uns32b (<=4Gi-1)
		.int -200000000,-200000000,-200000000,-200000000
		.int -200000000,-200000000,-200000000,-200000000
		.int -200000000,-200000000,-200000000,-200000000
		.int -200000000,-200000000,-200000000,-200000000
#elif TEST==17					// ? ??? ??? ??? - pos+peq A·10^B suma no cabe uns32b(>=4Gi)
		.int -300000000, -300000000, -300000000, -300000000
		.int -300000000, -300000000, -300000000, -300000000
		.int -300000000, -300000000, -300000000, -300000000
		.int -300000000, -300000000, -300000000, -300000000
#elif TEST==18					// ? ??? ??? ??? - pos+gran A·10^B reprsntble sgn32b (<=2Gi-1)
 		.int -2000000000, -2000000000, -2000000000, -2000000000
		.int -2000000000, -2000000000, -2000000000, -2000000000
		.int -2000000000, -2000000000, -2000000000, -2000000000
		.int -2000000000, -2000000000, -2000000000, -2000000000
#elif TEST==19 					// ? ??? ??? ??? - anterior-1 es interm. (no cabría en sgn32b)
 		.quad -3000000000, -3000000000, -3000000000, -3000000000
		.quad -3000000000, -3000000000, -3000000000, -3000000000
		.quad -3000000000, -3000000000, -3000000000, -3000000000
		.quad -3000000000, -3000000000, -3000000000, -3000000000
#else
 		.error "Definir TEST entre 1..19"
#endif
 		.endm

lista: 		linea
longlista:	.int   	(.-lista)/4
resultado:	.quad   	0
formato:	.ascii "resultado \t =   %18ld (sig)\n"
			.ascii 		   "\t\t = 0x%18lx (hex)\n"
			.asciz         "\t\t = 0x %08x %08x \n"

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
	mov  $0, %rsi
	mov  $0, %edi
	mov  $0, %ebp
bucle:
	mov  $0, %edx
	mov  (%rbx,%rsi,4), %eax
	cdq
	add  %eax, %edi
	adc  %edx, %ebp
	inc  %rsi
	cmp  %rsi,%rcx
	jne  bucle

	mov  %edi, %eax
	mov  %ebp, %edx
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
