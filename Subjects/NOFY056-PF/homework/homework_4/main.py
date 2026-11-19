#!/bin/env python3

import numpy as np
from numba import njit

@njit
def sieve(nmax: int):
    """Returns the primes up to nmax and the amount of primes before(including) each integer up to nmax."""
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

    primes=np.zeros(count, dtype=np.uint32)
    nprime=0

    nprimes=np.zeros(nmax+1, dtype=np.uint32)

    for i in range(nmax+1):
        if found[i]:
            primes[nprime] = i
            nprime+=1

        nprimes[i] = nprime

    return (primes, nprimes)

@njit
def find_doubles_count(primes, nmax):
    doubles_count = 0
    res = np.zeros(nmax+1, dtype=np.uint32)


    for i in range(1, len(primes)):
        p_prev = primes[i-1]
        p = primes[i]

        res[p_prev:p] = doubles_count
        if p - p_prev == 2:
            doubles_count += 1

    res[primes[len(primes)-1]:] = doubles_count

    return res

def main():
    nmax = 100_000_000

    (primes, nprimes) = sieve(nmax)
    ndoubles = find_doubles_count(primes,nmax)

    # result is written in the following format: [i, nprimes, ndoubles]
    result = np.column_stack((np.arange(0, nmax+1, dtype=np.uint32), nprimes, ndoubles))

    np.save("./res", result)

if __name__ == "__main__":
    main()
