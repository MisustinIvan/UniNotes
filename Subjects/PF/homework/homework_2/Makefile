.DEFAULT_GOAL := run

build: ./main.F90
	gcc -o main ./main.F90 -lgfortran -lm

run: build
	./main
