; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isalnum.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/03/31 13:43:27 by lubenard          #+#    #+#              ;
;    Updated: 2020/04/07 20:45:37 by lubenard         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; Prototype :
; size_t ft_isalnum(int c);

section .text
	global ft_isalnum
	extern ft_isalpha

ret_else:            ; label if condition is not fullfilled
	mov rax, 0       ; set return code to 0
	ret              ; return

ft_isalnum:
	call ft_isalpha  ; call ft_isalpha to check if 
	cmp rax, 1       ; compare if return of ft_isalpha is 1
	je ret_success   ; if it is, (ft_isalpha(c) == 1), then success !
	cmp rdi, '0'     ; compare c with 0
	jl ret_else      ; if c < '0', jump to ret_else
	cmp rdi, '9'     ; compate c with '9'
	jg ret_else      ; if c > '9', jump to ret_else
ret_success:
	mov rax, 1       ; if none of these jump append, set return code to 1
	ret              ; return
