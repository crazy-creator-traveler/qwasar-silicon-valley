# For compile > We must use command > make
CC = gcc
CFLAGS = -Wall -Wextra -Werror

SOURCES = my_mastermind.c library_tools.c
OBJECTS = $(SOURCES:.c=.o)
TARGET  = my_mastermind

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^


# For clean > We must use command > make clean
.PHONY: clean
clean:
	rm -f $(TARGET) $(OBJECTS)