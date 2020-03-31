; **************************************************************************** #
;                                                                              #
;                                                         :::      ::::::::    #
;    ft_strlen.s                                        :+:      :+:    :+:    #
;                                                     +:+ +:+         +:+      #
;    By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+         #
;                                                 +#+#+#+#+#+   +#+            #
;    Created: 2020/03/31 22:08:15 by lubenard          #+#    #+#              #
;    Updated: 2020/03/31 22:08:16 by lubenard         ###   ########.fr        #
;                                                                              #
; **************************************************************************** #

; Prototype :
; size_t ft_strlen(const char *s);

section .text
	global ft_strlen

; why use rax as counter instead of standart rcx ?
; because, ret use rax as return value
; by using rax, we avoid doing:
; mov rax, rcx

ft_strlen:
	mov rax, -1               ; set rcx to 0
loop:
	inc rax                   ; increment rcx, aka counter of loop
	cmp byte[rdi + rax], 0    ; compare rcx with '\0'
	jne loop                  ; if rcx not equal to '\0', loop
	ret                       ; return value (use rax as code)
