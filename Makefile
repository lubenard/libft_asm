# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/30 16:12:37 by lubenard          #+#    #+#              #
#    Updated: 2020/04/01 17:42:08 by lubenard         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC 		= 	nasm
CC_LNK	=	clang
CFLAGS	+=	-Wall -Werror -Wextra -g3

NAME 	=	libfts.a
SRCDIR	=	srcs
INCDIR	=	includes
OBJDIR	=	objs
FILES	=	ft_isascii.s	\
			ft_isalnum.s	\
			ft_isalpha.s	\
			ft_isdigit.s	\
			ft_isprint.s	\
			ft_toupper.s	\
			ft_tolower.s	\
			ft_puts.s		\
			ft_bzero.s		\
			ft_strlen.s		\
			ft_memcpy.s

SRCS	=	$(addprefix $(SRCDIR)/, $(FILES))
OBJS	=	$(SRCS:$(SRCDIR)/%.s=$(OBJDIR)/%.o)
OBJSD	=	$(SRCS:$(SRCDIR)/%.s=$(OBJDIR)/%.d)

##### Colors #####
_END=\x1b[0m
_BOLD=\x1b[1m
_UNDER=\x1b[4m
_REV=\x1b[7m
_GREY=\x1b[30m
_RED=\x1b[31m
_GREEN=\x1b[32m
_YELLOW=\x1b[33m
_BLUE=\x1b[34m
_PURPLE=\x1b[35m
_CYAN=\x1b[36m
_WHITE=\x1b[37m

.PHONY: all clean fclean re

.SILENT:

all: $(NAME)

$(NAME): $(OBJS)
	@echo -e -n "\n${_BLUE}${_BOLD}[Linking] $(NAME)${_END}"
	@ar rc $(NAME) $(OBJS)
	@echo -e -n "\n${_GREEN}${_BOLD}$(NAME) done.${_END}"
	@echo -e -n "\n${_GREEN}${_BOLD}Linking to main...${_END}"
	$(CC_LNK) $(CFLAGS) -o test srcs/main.c $(NAME) -I$(INCDIR)

$(OBJDIR)/%.o: $(SRCDIR)/%.s
	@[ -d $(OBJDIR) ] || mkdir -p $(OBJDIR)
	@echo -n -e "\r\033[K${_PURPLE}${BOLD}[${NAME}] Compiling $<${_END}"
	@$(CC) -f elf64 -o $@ $<

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@[ -d $(OBJDIR) ] || mkdir -p $(OBJDIR)
	@echo -n -e "\r\033[K${_PURPLE}${BOLD}[${NAME}] Compiling $<${_END}"
	@$(CC_LNK) $(CFLAGS) -I $(INCDIR) -o $@ -c $<

clean:
	@echo -e "${_RED}${_BOLD}Removing obj files...${_END}"
	@rm -f $(OBJS)
	@rm -f $(OBJSD)

fclean: clean
	@echo -e "${_RED}${_BOLD}Removing $(NAME)...${_END}"
	@rm -f $(NAME)
	@rm -rf $(OBJDIR)
	@rm -rf test

re: fclean
	$(MAKE) $(NAME)

-include $(OBJSD)
