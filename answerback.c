#define _POSIX_C_SOURCE 200112L

#include <signal.h> /* for signal handling */
#include <stdio.h> /* fopen(), et al. */
#include <unistd.h> /* for ssize_t, read, write */
#include <stdlib.h> /* for EXIT_SUCCESS, EXIT_FAILURE */
#include <termios.h> /* ctermid, et al. */

#define ANSWERBACK_LEN 16
#define ANSWERBACK_CODE 5

int main()
{
	const char *cterm = ctermid(NULL);

	if (cterm == NULL)
	{
		fputs("Cannot get the path to the console", stderr);
		return EXIT_FAILURE;
	}

	FILE *fp;
	if ((fp = fopen(cterm, "r+b")) == NULL)
	{
		perror("open");
		return EXIT_FAILURE;
	}

	if (setvbuf(fp, NULL, _IONBF, ANSWERBACK_LEN))
	{
		perror("setvbuf");
		return EXIT_FAILURE;
	}

	int fd = fileno(fp);
	if (fd == -1)
	{
		perror("fileno");
		return EXIT_FAILURE;
	}

	sigset_t new_sig;
	if (sigemptyset(&new_sig) == -1)
	{
		perror("sigemptyset");
		return EXIT_FAILURE;
	}
	if (sigaddset(&new_sig, SIGINT) == -1)
	{
		perror("sigaddset");
		return EXIT_FAILURE;
	}
	if (sigaddset(&new_sig, SIGTSTP) == -1)
	{
		perror("sigaddset");
		return EXIT_FAILURE;
	}
	sigset_t old_sig;
	if (sigprocmask(SIG_BLOCK, &new_sig, &old_sig) == -1)
	{
		perror("sigprocmask");
		return EXIT_FAILURE;
	}

	struct termios old_term;
	if (tcgetattr(fd, &old_term) == -1)
	{
		perror("tcgetattr");
		return EXIT_FAILURE;
	}

	struct termios new_term = old_term;
	new_term.c_lflag &= ~(ECHO | ECHOE | ECHOK | ECHONL | ICANON);
	new_term.c_cc[VMIN] = 0;
	new_term.c_cc[VTIME] = 1;

	if (tcsetattr(fd, TCSAFLUSH, &new_term) == -1)
	{
		perror("tcsetattr");
		if (tcsetattr(fd, TCSAFLUSH, &old_term) == -1)
		{
			perror("tcsetattr");
		}
		return EXIT_FAILURE;
	}

	char code = ANSWERBACK_CODE;
	for (;;)
	{
		ssize_t ret = write(fd, &code, sizeof(code));
		if (ret == -1)
		{
			perror("write");
			tcsetattr(fd, TCSAFLUSH, &old_term);
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
		tcsetattr(fd, TCSAFLUSH, &old_term);
		return EXIT_FAILURE;
	}
	buffer[ret] = '\0';

	if (tcsetattr(fd, TCSAFLUSH, &old_term) == -1)
	{
		perror("tcsetattr");
		return EXIT_FAILURE;
	}

	if (sigprocmask(SIG_SETMASK, &old_sig, NULL) == -1)
	{
		perror("sigprocmask");
		return EXIT_FAILURE;
	}

	if (fclose(fp) == EOF)
	{
		perror("fclose");
		return EXIT_FAILURE;
	}

	if (ret == 0)
	{
		return EXIT_FAILURE;
	}

	puts(buffer);
	return EXIT_SUCCESS;
}
