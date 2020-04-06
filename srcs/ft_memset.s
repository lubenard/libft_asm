; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_memset.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/04/03 23:54:05 by lubenard          #+#    #+#              ;
;    Updated: 2020/04/06 13:48:18 by lubenard         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; Prototype :
; void *ft_memset(void *s, int c, size_t n);

section .text
	global ft_memset

ft_memset:
	mov rcx, rdx   ; set rdx (aka size_t n) as counter
	mov rdx, rdi   ; backup 1st arg to save pointer
	mov rax, rsi   ; setting the source char in al
	rep stosb      ; loop rcx times and copy rsi into rdi
	mov rax, rdx   ; set rdx as return string
	ret            ; return
