; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_memset.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/04/03 23:54:05 by lubenard          #+#    #+#              ;
;    Updated: 2020/04/04 00:26:55 by lubenard         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; Prototype :
; void *ft_memset(void *s, int c, size_t n);

section .text
	global ft_memset

ft_memset:
	mov rcx, 0               ; set rcx (counter) to 0
loop:
	mov [rdi + rcx], rsi
	inc rcx                  ; increment rcx, aka counter of loop
	cmp rcx, rdx             ; compare rcx with third parameter (n)
	jl loop                  ; if rcx < rsi (third parameter), loop
	mov rax, rdi
	ret                      ; return
