; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcat.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/04/03 22:30:30 by lubenard          #+#    #+#              ;
;    Updated: 2020/04/03 23:00:41 by lubenard         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

; Prototype :
; void *ft_strcat(void *dest, void *src);

section .text
	global ft_strcat
	extern ft_strlen

ft_strcat:
	mov rax, rdi              ; mov dest into rax
	call ft_strlen            ; call ft_strlen
 	mov rcx, rax              ; mov result of strlen into rcx
	mov rax, rdi              ; remove dest into rax
	mov rdx, 0                ; set rdx to 0
loop:
	mov rbx, [rsi + rdx]      ; set rbx to src[rdx]
	mov [rax + rcx], rbx      ; set dest[rcx] = rbx
	inc rdx                   ; increment rdx
	inc rcx                   ; increment rcx
	cmp byte [rsi + rdx], 0   ; search for end of src
	jne loop                  ; if src is not over,loop
	ret                       ; return value (use rax as code)
