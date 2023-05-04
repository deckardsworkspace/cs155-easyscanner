CC=gcc
FLEX=flex

# Darwin uses '-ll' for Flex, Windows and Linux use '-lfl'
ifeq ($(OS),Windows_NT)
	CFLAGS=-lfl
else
	PLATFORM := $(shell uname -s)
	ifeq ($(PLATFORM),Darwin)
		CFLAGS=-ll
	else
		CFLAGS=-lfl
	endif
endif

all: easy

easy: lex.yy.c
	$(CC) -o easy lex.yy.c $(CFLAGS)

lex.yy.c:
	$(FLEX) easy.lex

clean:
	rm -f easy lex.yy.c
