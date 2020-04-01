; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isalpha.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/03/31 13:43:27 by lubenard          #+#    #+#              ;
;    Updated: 2020/03/31 17:12:10 by lubenard         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; Prototype :
; size_t ft_isalpha(int c);

section .text
	global ft_isalpha

ret_else:          ; label if condition is not fullfilled
	mov rax, 0     ; set return code to 0
	ret            ; return

ft_isalpha:
	cmp rdi, 0     ; compare c with 0
	jl ret_else    ; if c < 0, jump to ret_else
	cmp rdi, 127   ; compate c with 127 (end of ascii table)
	jg ret_else    ; if c > 127, jump to ret_else
	mov rax, 1     ; if none of these jump append, set return code to 1
	ret            ; return
