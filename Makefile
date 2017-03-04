CC=gcc
CFLAGS=-Wall 
LDFLAGS=
EXEC=executable
RM=rm -rf
.SUFFIXES:
.PHONY: clean, mrproper

all: main.o functions.o
	${CC} $^ -o ${EXEC} ${CFLAGS} ${LDFLAGS}

main.o: main.c functions.o
	${CC} -c $< -o $@ ${CFLAGS} ${LDFLAGS}

functions.o: functions.c
	${CC} -c $< -o $@ ${CLFAGS} ${LDFLAGS}

clean:
	${RM} *.o

mrproper: clean
	${RM} ${EXEC}
