; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isalnum.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/03/31 13:43:27 by lubenard          #+#    #+#              ;
;    Updated: 2020/04/03 22:06:30 by lubenard         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; Prototype :
; size_t ft_isalnum(int c);

section .text
	global ft_isalnum
	extern ft_isalpha

ret_else:          ; label if condition is not fullfilled
	mov rax, 0     ; set return code to 0
	ret            ; return

ft_isalnum:
	mov rax, rdi
	call ft_isalpha
	cmp rax, 1
	je ret_success
	cmp rdi, 48     ; compare c with 0
	jl ret_else    ; if c < 0, jump to ret_else
	cmp rdi, 57   ; compate c with 127 (end of ascii table)
	jg ret_else    ; if c > 127, jump to ret_else
ret_success:
	mov rax, 1     ; if none of these jump append, set return code to 1
	ret            ; return
