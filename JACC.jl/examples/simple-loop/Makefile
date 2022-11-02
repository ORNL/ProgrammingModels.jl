
# Must a compiler that supports acc
CC=nvc
CFLAGS=-O3 -acc

all: reduction assignment

reduction: simple-loop-reduction.c
	$(CC) simple-loop-reduction.c -o simple-loop-reduction $(CFLAGS)

assignment: simple-loop-assignment.c
	$(CC) simple-loop-assignment.c -o simple-loop-assignment $(CFLAGS)

clean:
	rm simple-loop-assignment simple-loop-reduction