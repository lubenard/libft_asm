; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isalpha.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/03/31 13:43:27 by lubenard          #+#    #+#              ;
;    Updated: 2020/04/03 21:59:21 by lubenard         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; Prototype :
; size_t ft_isalpha(int c);

section .text
	global ft_isalpha

ft_isalpha:
	cmp rdi, byte 'A'     ; compare c with 'a'
	jl second_cond        ; if c < 'a', jump to ret_else
	cmp rdi, byte 'Z'     ; compare c with 'z'
	jle sucess            ; if c <= 'z', jump to ret_success
second_cond:
	cmp rdi,  byte 'a'    ; compare c 'A'
	jl fail               ; if c < 65, jump to ret_else
	cmp rdi, byte 'z'     ; compate c with 'Z'
	jg fail               ; if c > 90, jump to ret_else

sucess:
	mov rax, 1
	ret
fail:
	mov rax, 0
	ret
