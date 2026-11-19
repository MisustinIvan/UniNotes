#!/usr/bin/env python3

import numpy as np
from numba import njit

@njit
def sieve(nmax: int):
    found = np.full(nmax+1, True)
    found[0:2] = False
    n = 2
    while n <= np.sqrt(nmax):
        nn=n*n
        while nn <= nmax:
            found[nn] = False
            nn += n
        while True:
            n+=1
            if found[n]: break

    count = 0
    for n in range(nmax+1):
        if found[n]: count+=1

    result=np.zeros(count, dtype=np.int32)
    nprime=0
    for n in range(nmax+1):
        if found[n]:
            result[nprime] = n
            nprime+=1
    return result




def main() -> None:
    sieve(1)
    nmax = 1_000_000
    primes = sieve(nmax)
    indices = np.arange(1, len(primes)+1)
    res = np.column_stack([primes, indices])
    np.savetxt("./primes.dat", res, fmt="%d")

if __name__ == "__main__":
    main()
