; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isascii.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/03/31 13:43:27 by lubenard          #+#    #+#              ;
;    Updated: 2020/03/31 17:12:10 by lubenard         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; Prototype :
; void ft_isascii(int c);

section .text
	global ft_isascii

ret:
	mov rax, 1
	ret

sup:
	cmp rdi, 127
	jle ret
	mov rax, 0
	ret

ft_isascii:
	cmp rdi, 0
	jge sup
	mov rax, 0
	ret
