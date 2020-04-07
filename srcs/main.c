/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lubenard <lubenard@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/30 18:40:23 by lubenard          #+#    #+#             */
/*   Updated: 2020/04/01 21:03:38 by lubenard         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libfts.h"

#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <fcntl.h>
#include <errno.h>
#include <unistd.h>

# define PASSED		0
# define FAILED		1

# define FT_RED		"\033[1;31m"
# define FT_GREEN	"\033[1;32m"
# define FT_EOC		"\033[0m"

# define REAL		"\033[1;33mREAL\033[0m"
# define MINE		"\033[1;34mMINE\033[0m"

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
		printf("\t%s %s returned %d with parameter '%s'\n", REAL,
		function, i1, test);
		printf("\t%s %s returned %d with parameter '%s'\n", MINE,
		function, i2, test);
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
		printf("\t%s %s returned '%s' with parameter '%s'\n", REAL,
		function, s1, test);
		printf("\t%s %s returned '%s' with parameter '%s'\n", MINE,
		function, s2, test);
	}
	return (0);
}

/*
** Test function isprint
*/

void isprint_tests(char *fun_name)
{
	compare_int(fun_name, "0", isprint(0), ft_isprint(0));
	compare_int(fun_name, "48", isprint(48), ft_isprint(48));
	compare_int(fun_name, "55", isprint(55), ft_isprint(55));
	compare_int(fun_name, "128", isprint(128), ft_isprint(128));
}

/*
** Test function isdigit
*/

void isdigit_tests(char *fun_name)
{
	compare_int(fun_name, "0", isdigit(0), ft_isdigit(0));
	compare_int(fun_name, "48", isdigit(48), ft_isdigit(48));
	compare_int(fun_name, "55", isdigit(55), ft_isdigit(55));
	compare_int(fun_name, "128", isdigit(128), ft_isdigit(128));
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
** Test function isalpha
*/

void isalpha_tests(char *fun_name)
{
	compare_int(fun_name, "-1", isalpha(-1), ft_isalpha(-1));
	compare_int(fun_name, "0", isalpha(0), ft_isalpha(0));
	compare_int(fun_name, "100", isalpha(100), ft_isalpha(100));
	compare_int(fun_name, "128", isalpha(128), ft_isalpha(128));
}

/*
** Test function isalnum
*/

void isalnum_tests(char *fun_name)
{
	compare_int(fun_name, "-1", isalpha(-1), ft_isalpha(-1));
	compare_int(fun_name, "0", isalpha(0), ft_isalpha(0));
	compare_int(fun_name, "100", isalpha(100), ft_isalpha(100));
	compare_int(fun_name, "128", isalpha(128), ft_isalpha(128));
}


/*
** Test function toupper
*/

void toupper_tests(char *fun_name)
{
	compare_int(fun_name, "'A'", toupper('A'), ft_toupper('A'));
	compare_int(fun_name, "'!'", toupper('!'), ft_toupper('!'));
	compare_int(fun_name, "'a'", toupper('a'), ft_toupper('a'));
	compare_int(fun_name, "'z'", toupper('z'), ft_toupper('z'));
}

/*
** Test function tolower
*/

void tolower_tests(char *fun_name)
{
	compare_int(fun_name, "'a'", tolower('a'), ft_tolower('a'));
	compare_int(fun_name, "'!'", tolower('!'), ft_tolower('!'));
	compare_int(fun_name, "'A'", tolower('A'), ft_tolower('A'));
	compare_int(fun_name, "'Z'", tolower('Z'), ft_tolower('Z'));
}

/*
** Test function strcat
*/

void strcat_tests(char *fun_name)
{
	char real[19] = "hey ";
	char test[19] = "hey ";

	compare_str(fun_name, "hey you", strcat(real, "you!"), ft_strcat(test, "you!"));
}


/*
** Test function strlen
*/

void puts_tests(char *fun_name)
{
	compare_int(fun_name, "abcde", puts("abcde"), ft_puts("abcde"));
	compare_int(fun_name, "abcdefh", puts("abcdefh"), ft_puts("abcdefh"));
	compare_int(fun_name, "", puts(""), ft_puts(""));
	compare_int(fun_name, "abcdefhijkf", puts("abcdefhijkf"), ft_puts("abcdefhijkf"));
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
** Test function bzero
*/

void bzero_tests(char *fun_name)
{
	char *real;
	char *test;

	real = strdup("my buffer is filled");
	test = strdup("my buffer is filled");

	bzero(real, strlen(real));
	ft_bzero(test, strlen(test));
	compare_str(fun_name, "my buffer is filled", real, test);

	real = strdup("my buffer is filled");
	test = strdup("my buffer is filled");

	bzero(real, 6);
	ft_bzero(test, 6);
	compare_str(fun_name, "fer is filled", real, test);
}

/*
** Test function memset
*/

void memset_tests(char *fun_name)
{
	(void)fun_name;
	char *real = strdup("OOOH un monstre");
	char *test = strdup("OOOH un monstre");

	compare_str(fun_name, "OOOH un monstre", memset(real, 'A', 3),
											 ft_memset(test, 'A',3));
}


/*
** Test function memcpy
*/

void memcpy_tests(char *fun_name)
{
	char *real2 = strdup("Salut you !");
	char *test2 = strdup("Salut you !");

	compare_str(fun_name, "hello you", memcpy(real2, "Hello", 4), ft_memcpy(test2, "Hello", 4));
}

/*
** Test function strdup
*/

void strdup_tests(char *fun_name)
{
	(void)fun_name;
	char *str = strdup("test strdup ahahhahah");

	//char *ret1 = strdup(str);
	//char *ret2 = ft_strdup(str);
	//printf("rl_strdup %p / %p %s\n", str, ret1,ret1);
	//printf("ft_strdup %p / %p %s\n", str, ret2,ret2);
	compare_str(fun_name, "test strdup", strdup(str), ft_strdup(str));
}

/*
** Test function cat
*/

void cat_tests(char *fun_name)
{
	(void)fun_name;
	int fd = open("/root/libft_asm/file_cat", O_RDONLY);

	printf("passing %d as fd\n", fd);
	if (fd < 0)
		printf("ERRNO: %s. don't worry, this is not your fault\n",
		strerror(errno));
	ft_cat(fd);
	close(fd);
	//char *ret1 = strdup(str);
	//char *ret2 = ft_strdup(str);
	//printf("rl_strdup %p / %p %s\n", str, ret1,ret1);
	//printf("ft_strdup %p / %p %s\n", str, ret2,ret2);
}

void print_header(char *argument, void (*func)(char *))
{
	printf("===== Testing %s =====\n", argument);
	func(argument);
}

int main(void)
{
	print_header("isascii", isascii_tests);
	print_header("isprint", isprint_tests);
	print_header("isdigit", isdigit_tests);
	print_header("isalpha", isalpha_tests);
	print_header("isalnum", isalnum_tests);
	print_header("toupper", toupper_tests);
	print_header("tolower", tolower_tests);
	print_header("strcat", strcat_tests);
	print_header("puts", puts_tests);
	print_header("bzero", bzero_tests);
	print_header("strlen", strlen_tests);
	print_header("memcpy", memcpy_tests);
	print_header("memset", memset_tests);
	print_header("strdup", strdup_tests);
	print_header("ft_cat", cat_tests);
	return (0);
}
