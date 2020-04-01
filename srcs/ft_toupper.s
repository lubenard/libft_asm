; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_toupper.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/04/01 17:08:34 by lubenard          #+#    #+#              ;
;    Updated: 2020/04/01 17:28:49 by lubenard         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; Prototype :
; int ft_toupper(int c);

section .text
	global ft_toupper

ret_else:          ; label if condition is not fullfilled
	mov rax, rdi   ; set return code to 0
	ret            ; return

ft_toupper:
	cmp rdi, 97    ; compare c with 97 (aka 'a')
	jl ret_else    ; if c < 90, jump to ret_else
	cmp rdi, 122   ; compate c with 122 (aka 'z')
	jg ret_else    ; if c > 122, jump to ret_else
	sub rdi, 32    ; substract 32 to number
	mov rax, rdi   ; mov c into rax for return
	ret            ; return value (use rax as code)
