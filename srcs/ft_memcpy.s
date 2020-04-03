; **************************************************************************** #
;                                                                              #
;                                                         :::      ::::::::    #
;    ft_memcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      #
;    By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+         #
;                                                 +#+#+#+#+#+   +#+            #
;    Created: 2020/04/02 23:23:31 by lubenard          #+#    #+#              #
;    Updated: 2020/04/03 20:25:45 by lubenard         ###   ########.fr        ;
;                                                                              #
; **************************************************************************** #

; Prototype :
; void *ft_memcpy(void *dest, void *src, size_t n);

section .text
	global ft_memcpy

ft_memcpy:
	mov rcx, 0               ; set rcx (counter) to 0
	mov rax, rdi             ; load string (s) into rax
loop:
	mov rdi, [rsi + rcx]     ; mov src[n] into rdi
	mov [rax + rcx], rdi     ; replace dest[n] by src[n]
	inc rcx                  ; increment rcx, aka counter of loop
	cmp rcx, rdx             ; compare rcx with third parameter (n)
	jl loop                  ; if rcx < rsi (third parameter), loop
	ret                      ; return
