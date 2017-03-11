CC=gcc
CFLAGS=-Wall
LDFLAGS=
EXEC=executable
RM=rm -rf
.SUFFIXES:
.PHONY: clean, mrproper

all: ${EXEC} 

${EXEC}: main.o functions.o 
	${CC} $^ -o ${EXEC} ${CFLAGS} ${LDFLAGS} 

main.o: main.c functions.h
	${CC} -c $< -o $@ ${CFLAGS} ${LDFLAGS}

staticexe: functions.o main.o 
	${CC} -static $^ -o $@ ${CFLAGS} ${LDFLAGS} 

liblph.a: functions.o 
	ar r $@ $^
	ranlib $@

ranlibexe: liblph.a main.o 
	${CC} main.o -o $@ -L . -llph  

liblphd.so: functionsfpic.o
	${CC} -shared $^ -o $@ 

dynamicexe: main.o liblphd.so
	${CC} $< -o $@ ${CFLAGS} ${LDFLAGS} -L . -llphd

functions.o: functions.c
	${CC} -c $< -o $@ ${CFLAGS} ${LDFLAGS}

functionsfpic.o: functions.c
	${CC} -c $< -o $@ ${CFLAGS} ${LDFLAGS} -fpic

clean:
	${RM} *.o
	${RM} *.so
	${RM} *.a

mrproper: clean
	${RM} ${EXEC} dynamicexe ranlibexe staticexe
