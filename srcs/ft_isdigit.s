; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isdigit.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/03/31 13:43:27 by lubenard          #+#    #+#              ;
;    Updated: 2020/03/31 17:12:10 by lubenard         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; Prototype :
; size_t ft_isdigit(int c);

section .text
	global ft_isdigit

ret_else:          ; label if condition is not fullfilled
	mov rax, 0     ; set return code to 0
	ret            ; return

ft_isdigit:
	cmp rdi, 48    ; compare c with 48 (0 in ascii table)
	jl ret_else    ; if c < 48, jump to ret_else
	cmp rdi, 57    ; compate c with 57 (9 in ascii table)
	jg ret_else    ; if c > 57, jump to ret_else
	mov rax, 1     ; if none of these jump append, set return code to 1
	ret            ; return
