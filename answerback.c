#define _POSIX_C_SOURCE 200112L

#include <signal.h>  /* for signal handling */
#include <stdio.h>   /* fopen(), et al. */
#include <fcntl.h>   /* for open() */
#include <unistd.h>  /* for ssize_t, read(), write() */
#include <stdlib.h>  /* for EXIT_SUCCESS, EXIT_FAILURE */
#include <termios.h> /* ctermid(), et al. */

#define ANSWERBACK_LEN 16
#define ANSWERBACK_CODE 5

static struct termios old_term;
static int fd;

static void
tty_reset(void)
{
	if (tcsetattr(fd, TCSAFLUSH, &old_term) == -1)
	{
		perror("tcsetattr");
	}

	if (close(fd) == -1)
	{
		perror("close");
	}
}

int main()
{
	char term[L_ctermid];
	const char *cterm = ctermid(term);

	if (cterm[0] == '\0')
	{
		(void)fputs("Cannot get the path to the console", stderr);
		return EXIT_FAILURE;
	}

	if ((fd = open(cterm, O_RDWR)) == -1)
	{
		perror("open");
		return EXIT_FAILURE;
	}

	if (tcgetattr(fd, &old_term) == -1)
	{
		perror("tcgetattr");
		return EXIT_FAILURE;
	}

	if (atexit(tty_reset) != 0)
	{
		(void)fputs("Cannot set the exit function", stderr);
		return EXIT_FAILURE;
	}

	struct termios new_term = old_term;
	new_term.c_lflag &= ~(ECHO | ECHOE | ECHOK | ECHONL | ICANON | ISIG | IEXTEN);
	new_term.c_cc[VMIN] = 0;
	new_term.c_cc[VTIME] = 1;

	if (tcsetattr(fd, TCSAFLUSH, &new_term) == -1)
	{
		perror("tcsetattr");
		return EXIT_FAILURE;
	}

	char code = ANSWERBACK_CODE;
	for (;;)
	{
		ssize_t ret = write(fd, &code, sizeof(code));
		if (ret == -1)
		{
			perror("write");
			return EXIT_FAILURE;
		}
		else if (ret > 0)
		{
			break;
		}
	}

	char buffer[ANSWERBACK_LEN] = { 0 };
	ssize_t ret = read(fd, buffer, sizeof(buffer) - 1);
	if (ret == -1)
	{
		perror("read");
		return EXIT_FAILURE;
	}

	buffer[ret] = '\0';

	if (ret == 0)
	{
		return EXIT_FAILURE;
	}

	puts(buffer);
	return EXIT_SUCCESS;
}
