; **************************************************************************** #
;                                                                              #
;                                                         :::      ::::::::    #
;    ft_bzero.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      #
;    By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+         #
;                                                 +#+#+#+#+#+   +#+            #
;    Created: 2020/03/30 19:09:07 by lubenard          #+#    #+#              #
;    Updated: 2020/03/31 17:34:14 by lubenard         ###   ########.fr        ;
;                                                                              #
; **************************************************************************** #

; Prototype :
; void ft_bzero(void *s, size_t n);

section .text
	global ft_bzero

ft_bzero:
	mov rcx, 0           ; set rcx (counter) to 0
	mov rax, rdi     ; load string (s) into rax
loop:
	mov BYTE [rax + rcx], 0           ; replace content by '\0'
	inc rcx              ; increment rcx, aka counter of loop
	cmp rcx, rsi         ; compare rcx with 19
	jl loop              ; if rcx < 19, jump to loop label
	ret
