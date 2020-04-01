/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/30 18:40:23 by lubenard          #+#    #+#             */
/*   Updated: 2020/04/01 17:02:47 by lubenard         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libfts.h"

#include <stdio.h>
#include <string.h>
#include <ctype.h>

# define PASSED 0
# define FAILED 1

# define FT_RED			"\033[1;31m"
# define FT_GREEN		"\033[1;32m"
# define FT_EOC			"\033[0m"

# define REAL			"\033[1;33mREAL\033[0m"
# define MINE			"\033[1;34mMINE\033[0m"

void print_result(char *test, int status)
{
	printf("Test of '%s' %s%s%s\n", test, (!status) ? FT_GREEN : FT_RED,
	(!status) ? "Succeed" : "Failed", FT_EOC);
}

/*
** Compare functions
*/

int compare_int(char *function, char *test, int i1, int i2)
{
	if (i1 == i2)
		print_result(test, PASSED);
	else
	{
		print_result(test, FAILED);
		printf("%s %s returned %d with parameter '%s'\n", REAL, function, i1, test);
		printf("%s %s returned %d with parameter '%s'\n", MINE, function, i2, test);
	}
	return (0);
}

int compare_str(char *function, char *test, char *s1, char *s2)
{
	if (!strcmp(s1, s2))
		print_result(test, PASSED);
	else
	{
		print_result(test, FAILED);
		printf("%s %s returned %s with parameter '%s'\n", REAL, function, s1, test);
		printf("%s %s returned %s with parameter '%s'\n", MINE, function, s2, test);
	}
	return (0);
}

/*
** Test function strlen
*/

void strlen_tests(char *fun_name)
{
	compare_int(fun_name, "abcde", strlen("abcde"), ft_strlen("abcde"));
	compare_int(fun_name, "abcdefh", strlen("abcdefh"), ft_strlen("abcdefh"));
	compare_int(fun_name, "", strlen(""), ft_strlen(""));
	compare_int(fun_name, "abcdefhijkf", strlen("abcdefhijkf"), ft_strlen("abcdefhijkf"));
}

/*
** Test function isprint
*/

void isprint_tests(char *fun_name)
{
	compare_int(fun_name, "0", isascii(0), ft_isascii(0));
	compare_int(fun_name, "48", isascii(48), ft_isascii(48));
	compare_int(fun_name, "55", isascii(55), ft_isascii(55));
	compare_int(fun_name, "128", isascii(128), ft_isascii(128));
}

/*
** Test function isdigit
*/

void isdigit_tests(char *fun_name)
{
	compare_int(fun_name, "0", isascii(0), ft_isascii(0));
	compare_int(fun_name, "48", isascii(48), ft_isascii(48));
	compare_int(fun_name, "55", isascii(55), ft_isascii(55));
	compare_int(fun_name, "128", isascii(128), ft_isascii(128));
}

/*
** Test function isascii
*/

void isascii_tests(char *fun_name)
{
	compare_int(fun_name, "-1", isascii(-1), ft_isascii(-1));
	compare_int(fun_name, "0", isascii(0), ft_isascii(0));
	compare_int(fun_name, "50", isascii(50), ft_isascii(50));
	compare_int(fun_name, "128", isascii(128), ft_isascii(128));
}

/*
** Test function bzero
*/

void bzero_tests(char *fun_name)
{
	char *real;
	char *test;

	real = strdup("my buffer is filled");
	test = strdup("my buffer is filled");

	bzero(real, strlen(real));
	bzero(test, strlen(test));
	compare_str(fun_name, "my buffer is filled", real, test);

	real = strdup("my buffer is filled");
	test = strdup("my buffer is filled");

	bzero(real, 6);
	bzero(test, 6);
	compare_str(fun_name, "fer is filled", real, test);
}

void print_header_footer(char *argument, void (*func)(char *))
{
	printf("===== Testing %s =====\n", argument);
	func(argument);
	printf("======================\n");
}

int main(void)
{
	print_header_footer("isascii", isascii_tests);
	print_header_footer("isdigit", isdigit_tests);
	print_header_footer("isdigit", isdigit_tests);
	print_header_footer("bzero", bzero_tests);
	print_header_footer("strlen", strlen_tests);
	return (0);
}
