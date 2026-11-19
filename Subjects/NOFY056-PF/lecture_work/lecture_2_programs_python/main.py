#!/bin/python3

from sys import argv

import numpy as np

def sum_n_iter(n: int) -> int:
    acc = 0
    for i in range(1,n+1):
        acc += i
    return acc

def sum_n_func(n: int) -> int:
    return sum(range(1, n+1))

def sum_n_simp(n: int) -> int:
    return n//2 * (n+1)

def sum_n_simp_np(n: np.int64) -> np.int64:
    return n//2 * (n+1)

def sum_harmonic(n: int) -> float:
    acc = 0
    for i in range(1,n+1):
        acc += 1/i
    return acc

def main():
    if len(argv) != 2:
        print("usage: prog <N>")
    try:
        n = int(argv[1])
        if n < 0:
            raise ValueError

        print(f"sum_n_iter(n) = {sum_n_iter(n)}")
        print(f"sum_n_func(n) = {sum_n_func(n)}")
        print(f"sum_n_simp(n) = {sum_n_simp(n)}")
        print(f"sum_n_simp_np(n) = {sum_n_simp_np(np.int64(n))}")
        print(f"sum_harmonic(n) = {sum_harmonic(n)}")

    except ValueError:
        print(f"argument \"{argv[1]}\" není celé kladné číslo")
    pass

if __name__ == "__main__":
    main()
