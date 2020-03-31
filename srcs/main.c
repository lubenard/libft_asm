/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/30 18:40:23 by lubenard          #+#    #+#             */
/*   Updated: 2020/03/31 23:49:15 by lubenard         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libfts.h"

#include <stdio.h>
#include <string.h>
#include <ctype.h>


/*
** Test function strlen
*/

void strlen_tests(void)
{
	//char *null_str = NULL;

	printf("REAL strlen returned %zu with parametter abcde\n", strlen("abcde"));
	printf("MINE strlen returned %zu with parametter abcde\n", ft_strlen("abcde"));
	printf("REAL strlen returned %zu with parametter abcdefh\n", strlen("abcdefh"));
	printf("MINE strlen returned %zu with parametter abcdefh\n", ft_strlen("abcdefh"));
	printf("REAL strlen returned %zu with parametter abcdefhijk\n", strlen("abcdefhijk"));
	printf("MINE strlen returned %zu with parametter abcdefhijk\n", ft_strlen("abcdefhijk"));
}

/*
** Test function isascii
*/

void isascii_tests(void)
{
	printf("REAL isascii returned %d with parametter 0\n", isascii(0));
	printf("MINE isascii returned %d with parametter 0\n", ft_isascii(0));

	printf("REAL isascii returned %d\n", isascii(128));
	printf("MINE isascii returned %d\n", ft_isascii(128));
}

/*
** Test function bzero
*/

void bzero_tests(void)
{
	char *test = strdup("my buffer is filled");

	printf("my buffer before with real '%s'\n", test);
	bzero(test, strlen(test));
	printf("my buffer after  with real '%s'\n", test);

	test = strdup("my buffer is filled");

	printf("my buffer before with mine '%s'\n", test);
	ft_bzero(test, strlen(test));
	printf("my buffer after  with mine '%s'\n", test);

	test = strdup("my buffer is filled");

	printf("my buffer before with real '%s'\n", test);
	bzero(test, 6);
	printf("my buffer after  with real '%s'\n", test + 6);

	test = strdup("my buffer is filled");

	printf("my buffer before with real '%s'\n", test);
	ft_bzero(test, 6);
	printf("my buffer after  with real '%s'\n", test + 6);



}

void print_header_footer(char *argument, void (*func)(void))
{
	printf("===== Testing %s =====\n", argument);
	func();
	printf("======================\n");
}

int main(void)
{
	print_header_footer("bzero", bzero_tests);
	print_header_footer("isascii", isascii_tests);
	print_header_footer("strlen", strlen_tests);
	return (0);
}
