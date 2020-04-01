; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_tolower.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/04/01 17:26:03 by lubenard          #+#    #+#              ;
;    Updated: 2020/04/01 17:28:01 by lubenard         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; Prototype :
; int ft_lower(int c);

section .text
	global ft_tolower

ret_else:          ; label if condition is not fullfilled
	mov rax, rdi   ; set return code to 0
	ret            ; return

ft_tolower:
	cmp rdi, 65    ; compare c with 65 (aka 'A')
	jl ret_else    ; if c < 65, jump to ret_else
	cmp rdi, 90    ; compate c with 90 (aka 'Z')
	jg ret_else    ; if c > 90, jump to ret_else
	add rdi, 32    ; add 32 to number
	mov rax, rdi   ; mov c into rax for return
	ret            ; return value (use rax as code)
