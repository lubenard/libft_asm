; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_puts.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/04/01 17:33:53 by lubenard          #+#    #+#              ;
;    Updated: 2020/04/07 20:24:59 by lubenard         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; Prototype :
; void ft_puts(void *s, size_t n);

section .rodata        ; this section contains read-only data
	newline:    db 10  ; define \n in memory

section .text
	global ft_puts
	extern ft_strlen  ; we say that ft_strlen is external as this program

print_newline:
	mov rax, 4        ; re set rax to syscall for write
	mov rcx, newline  ; print newline
	mov rdx, 1        ; set size of string (1)
	syscall           ; syscall
	mov rax, rsi      ; restore size for return
	inc rax           ; increment size, bc minimal size is 1
	ret               ; return rax

ft_puts:
	mov rax, rdi      ; set rax as the string given
	call ft_strlen    ; call ft_strlen from the libft, and the argument is rax
	mov rdx, rax      ; the return of ft_strlen is stored in rax
	mov rax, 4        ; we set rax to 4 (syscall for write)
	mov rbx, 1        ; set rbx to 1, aka stdout
	mov rcx, rdi      ; set rcx as rdi, the string we want to print
	mov rsi, rdx      ; save size for later
	int 80h           ; syscall write
	jmp print_newline ; after printin string, print newline
