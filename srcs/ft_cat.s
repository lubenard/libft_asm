; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_cat.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/04/06 21:09:14 by lubenard          #+#    #+#              ;
;    Updated: 2020/04/07 20:29:19 by lubenard         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; Prototype
; void ft_cat(int fd);

section .bss
	str: resb 4096

section .text
	global ft_cat
	extern ft_puts

ft_cat:
	cmp rdi, 0
	jl return
loop:
	mov rax, 3
	mov rbx, rdi
	mov rcx, str
	mov rdx, 4096
	int 80h
	mov rsi, rax
	mov rax, 4
	mov rbx, 1
	mov rdx, rsi
	int 80h
	cmp rsi, 4096
	je loop
return:
	ret                       ; return value (use rax as code)
