; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isalpha.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/03/31 13:43:27 by lubenard          #+#    #+#              ;
;    Updated: 2020/04/07 20:47:18 by lubenard         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; Prototype :
; size_t ft_isalpha(int c);

section .text
	global ft_isalpha

ft_isalpha:
	cmp rdi, byte 'A'     ; compare c with 'A'
	jl second_cond        ; if c < 'A', jump to ret_else
	cmp rdi, byte 'Z'     ; compare c with 'Z'
	jle sucess            ; if c <= 'Z', jump to ret_success
second_cond:
	cmp rdi,  byte 'a'    ; compare c 'a'
	jl fail               ; if c < 'a', jump to ret_else
	cmp rdi, byte 'z'     ; compate c with 'a'
	jg fail               ; if c > 'z', jump to ret_else
sucess:
	mov rax, 1            ; set return code to 1
	ret                   ; return
fail:
	mov rax, 0            ; set return code to 0
	ret
