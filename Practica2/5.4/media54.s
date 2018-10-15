.section .data
#ifndef TEST
#define TEST 20
#endif
	.macro linea
#if TEST==1
		.int 1, 2, 1, 2
		.int 1, 2, 1, 2
		.int 1, 2, 1, 2
		.int 1, 2, 1, 2
#elif TEST==2
		.int -1, -2, -1, -2
		.int -1, -2, -1, -2
		.int -1, -2, -1, -2
		.int -1, -2, -1, -2
#elif TEST==3
		.int 0x7fffffff, 0x7fffffff, 0x7fffffff, 0x7fffffff
		.int 0x7fffffff, 0x7fffffff, 0x7fffffff, 0x7fffffff
		.int 0x7fffffff, 0x7fffffff, 0x7fffffff, 0x7fffffff
		.int 0x7fffffff, 0x7fffffff, 0x7fffffff, 0x7fffffff
#elif TEST==4
		.int 0x80000000, 0x80000000, 0x80000000, 0x80000000
		.int 0x80000000, 0x80000000, 0x80000000, 0x80000000
		.int 0x80000000, 0x80000000, 0x80000000, 0x80000000
		.int 0x80000000, 0x80000000, 0x80000000, 0x80000000
#elif TEST==5
		.int 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
		.int 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
		.int 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
		.int 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
#elif TEST==6
		.int 2000000000, 2000000000, 2000000000, 2000000000
		.int 2000000000, 2000000000, 2000000000, 2000000000
		.int 2000000000, 2000000000, 2000000000, 2000000000
		.int 2000000000, 2000000000, 2000000000, 2000000000
#elif TEST==7
		.quad 3000000000, 3000000000, 3000000000, 3000000000
		.quad 3000000000, 3000000000, 3000000000, 3000000000
		.quad 3000000000, 3000000000, 3000000000, 3000000000
		.quad 3000000000, 3000000000, 3000000000, 3000000000
#elif TEST==8
		.int -2000000000, -2000000000, -2000000000, -2000000000
		.int -2000000000, -2000000000, -2000000000, -2000000000
		.int -2000000000, -2000000000, -2000000000, -2000000000
		.int -2000000000, -2000000000, -2000000000, -2000000000
#elif TEST==9
		.quad -3000000000, -3000000000, -3000000000, -3000000000
		.quad -3000000000, -3000000000, -3000000000, -3000000000
		.quad -3000000000, -3000000000, -3000000000, -3000000000
		.quad -3000000000, -3000000000, -3000000000, -3000000000
#elif TEST>=10 && TEST<=14
		.int 1, 1, 1, 1
		.int 1, 1, 1, 1
		.int 1, 1, 1, 1
#elif TEST>=15 && TEST<=19
		.int -1, -1, -1, -1
		.int -1, -1, -1, -1
		.int -1, -1, -1, -1
#else
		.error "Definir un valor entre 1 y 19"
#endif
		.endm

		.macro linea0
#if TEST>= 1 && TEST<=9
		linea
#elif TEST==10
		.int 0, 2, 1, 1
		linea
#elif TEST==11
		.int 1, 2, 1, 1
		linea
#elif TEST==12
		.int 8, 2, 1, 1
		linea
#elif TEST==13
		.int 15, 2, 1, 1
		linea
#elif TEST==14
		.int 16, 2, 1, 1
		linea
#elif TEST==15
		.int 0, -2, -1, -1
		linea
#elif TEST==16
		.int -1, -2, -1, -1
		linea
#elif TEST==17
		.int -8, -2, -1, -1
		linea
#elif TEST==18
		.int -15, -2, -1, -1
		linea
#elif TEST==19
		.int -16, -2, -1, -1
		linea
#else
		.error "Definir un valor entre 1 y 19"
#endif
		.endm
	

lista: 		linea0
longlista:	.int   	(.-lista)/4
media:		.int   	0
resto:		.int	0
formato:	.ascii "media \t = %11d \t resto \t = %11d   \n"
			.asciz       "\t = 0x %08x \t    \t = 0x %08x\n"


.section .text
main: .global  main

	call trabajar	# subrutina de usuario
	call imprim_C	# printf()  de libC
	call acabar_C	# exit()    de libC
	ret

trabajar:
	mov     $lista, %rbx
	mov  longlista, %ecx
	call suma   	# == suma(&lista, longlista);
	call division
	mov  %eax, media
	mov  %edx, resto
	ret

suma:
	mov  $0, %rsi
	mov  $0, %edi
	mov  $0, %ebp
bucle:
	mov  $0, %edx
	mov  (%rbx,%rsi,4), %eax
	cltd
	add  %eax, %edi
	adc  %edx, %ebp
	inc  %rsi
	cmp  %rsi,%rcx
	jne  bucle

	mov  %edi, %eax
	mov  %ebp, %edx
	ret

division:
	idiv %ecx
	ret

imprim_C:			# requiere libC
	mov   $formato, %rdi
	mov   media, %rsi
	mov   resto, %rdx
	mov	  media, %ecx
	mov	  resto, %r8d
	mov          $0,%eax
	call  printf		
	ret

acabar_C:			# requiere libC
	mov  $0, %edi
	call _exit		# ==  exit(resultado)
	ret
