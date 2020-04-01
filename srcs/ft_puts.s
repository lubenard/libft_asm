; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_puts.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/04/01 17:33:53 by lubenard          #+#    #+#              ;
;    Updated: 2020/04/01 21:47:48 by lubenard         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; Prototype :
; void ft_puts(void *s, size_t n);

section .rodata          ; this section contains read-only data
	newline:    db 10  ; define \n in memory

section .text
	global ft_puts
	extern ft_strlen  ; we say that ft_strlen is extrenal as this program

print_newline:
	mov rax, 4
	mov rcx, newline
	mov rdx, 1
	int 80h
	ret

ft_puts:
	mov rax, rdi      ; set rax as the string given
	call ft_strlen    ; call ft_strlen from the libft, and the argument is rax
	mov rdx, rax      ; the return of ft_strlen is stored in rax
	mov rax, 4        ; we set rax to 4 (syscall for write)
	mov rbx, 1        ; set rbx to 1, aka stdout
	mov rcx, rdi      ; set rcx as rdi, the string we want to print
	int 80h           ; syscall write
	;jmp print_newline
	mov rax, rdx
	inc rax
	ret               ; return
