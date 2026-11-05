#!/bin/python3

from math import pi, sqrt
from typing import Callable
from time import process_time
from numba import njit

def measure(func: Callable[[int], float], arg: int):
    t = process_time()
    res = func(arg)
    delta = process_time() - t

    label = f"{func.__name__}({arg})"
    print(f"{label} = {res} in {delta} seconds")
    return (res, label)

@njit()
def calc_pi_euler(n: int) -> float:
    total = sum(1./x**2. for x in range(1,n+1))
    return sqrt(6.*total)

@njit()
def piRamanujan(n: int) -> float:
    a = 1.
    res = a*1103
    for i in [float(i) for i in range(1, n+1)]:
        a*=(4*i - 3)*(4*i - 2)*(4*i-1)*(4*i)/((396*i)**4)
        res += a*(1103+26390*i)

    return 1/(res*sqrt(8)/9801)

def main():
    for i in range(1,9):
        (res, _ ) = measure(piRamanujan, 10**i)


if __name__ == "__main__":
    main()
