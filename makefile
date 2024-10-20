CC = gcc
SRC = src
LIB = lib
main: main.c $(LIB)/libcal.a 
	$(CC) main.c -L $(LIB)/ -lcal -I include/ -o main
OBJ = $(SRC)/add.c $(SRC)/sub.c
.PHONY: clean
0 = ./src/add.o ./src/sub.o
./src/add.o : $(SRC)/add.c
	$(CC) -c $(SRC)/add.c  -I include -o $@
./src/sub.o: $(SRC)/sub.c
	$(CC) -c $(SRC)/sub.c -I include -o $@
$(LIB)/libcal.a : $(0)
	ar rcs $(LIB)/libcal.a $(0)
clean:
	rm *.o
	rm main

