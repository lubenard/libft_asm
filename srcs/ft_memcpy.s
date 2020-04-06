; **************************************************************************** #
;                                                                              #
;                                                         :::      ::::::::    #
;    ft_memcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      #
;    By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+         #
;                                                 +#+#+#+#+#+   +#+            #
;    Created: 2020/04/02 23:23:31 by lubenard          #+#    #+#              #
;    Updated: 2020/04/06 13:34:16 by lubenard         ###   ########.fr        ;
;                                                                              #
; **************************************************************************** #

; Prototype :
; void *ft_memcpy(void *dest, void *src, size_t n);

section .text
	global ft_memcpy

ft_memcpy:
	mov rax, rdi
	mov rcx, rdx
	rep movsb
	ret
