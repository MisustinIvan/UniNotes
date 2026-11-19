.DEFAULT_GOAL := run

FC = gfortran
FFLAGS = -Wall -Wextra

build: ./main.F90
	$(FC) $(FFLAGS) -o main ./main.F90

run: build
	./main
