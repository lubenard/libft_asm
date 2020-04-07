; **************************************************************************** #
;                                                                              #
;                                                         :::      ::::::::    #
;    ft_memcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      #
;    By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+         #
;                                                 +#+#+#+#+#+   +#+            #
;    Created: 2020/04/02 23:23:31 by lubenard          #+#    #+#              #
;    Updated: 2020/04/07 20:49:08 by lubenard         ###   ########.fr        ;
;                                                                              #
; **************************************************************************** #

; Prototype :
; void *ft_memcpy(void *dest, void *src, size_t n);

section .text
	global ft_memcpy

ft_memcpy:
	mov rax, rdi  ; mov dest into rax
	mov rcx, rdx  ; mov n into rcx
	rep movsb     ; repeat rcx times operation where rax[n] = rsi[n]
	ret
