/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libfts.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/30 19:06:49 by lubenard          #+#    #+#             */
/*   Updated: 2020/04/07 15:57:56 by lubenard         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFTS_H
# define LIBFTS_H

# include <stdlib.h>

/*
** issomething functions
*/

int		ft_isascii(int c);
int		ft_isprint(int c);
int		ft_isdigit(int c);
int		ft_isalpha(int c);
int		ft_isalnum(int c);

/*
** toupper / tolower
*/

int		ft_toupper(int c);
int		ft_tolower(int c);

char	*ft_strcat(char *dest, char *src);

int		ft_puts(const char *s);

void	ft_bzero(void *s, size_t n);
size_t	ft_strlen(const char *s);

void	*ft_memcpy(void *dest, const void *src, size_t n);

void	*ft_memset(void *s, int c, size_t n);

char	*ft_strdup(const char *s);

void	ft_cat(int fd);
#endif
