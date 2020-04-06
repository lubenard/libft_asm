; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/04/06 13:51:25 by lubenard          #+#    #+#              ;
;    Updated: 2020/04/06 20:52:45 by lubenard         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; Prototype :
; char *ft_strdup(const char *s);

section .data
	str: db "OKAY"

section .text
	global ft_strdup
	extern ft_strlen  ; we say that ft_strlen is external as this program
	extern malloc
	extern ft_memcpy

ft_strdup:
	push rbp          ; c prologue, set stack frame setup
	mov rbp, rsp      ; c prologue

	push rdi          ; save rdi into stack
	mov rax, rdi      ; set rax as the string given
	call ft_strlen    ; call ft_strlen from the libft, and the argument is rax
	mov rdi, rax      ; return of ft_strlen is stored in rax, move it for malloc
	inc rdi           ; increment rdi for malloc of len + 1
	mov rbx, rax      ; save size for later
	call malloc       ; call malloc to allocate memory, allocated pointer is rax
	mov rdi, rax      ; move new pointer into rdi
	pop rsi           ; get rdi pushed earlier into rsi
	mov rdx, rbx      ; set size to write in new variable
	call ft_memcpy    ; call ft_memcpy to copy data

	mov   rsp, rbp    ; Put the stack pointer back where it was when
	pop   rbp         ; Restore the calling function's stack frame.
	ret
