#!/bin/env python3
from numba import njit, prange
import numpy as np

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

# pseudocode for the decomposition algorithm - which is paralelizable over the integer range
# 
# basically a two pointer walk over the primes
# 
# smallest prime after 1000 is 1009
# precondition: n >= 2018
# 
# set first pointer(to p) to 1009(index 168)
# find the largest prime for which p < n - 1000
# set second pointer(to r) to that prime
# loop while first pointer <= second pointer
# compare sum with n
# if equal, return 1
# if smaller, increment p
# if greater, decrement r
# 
# return 0

@njit
def decomposable(n: int, primes: np.ndarray, nprimes: np.ndarray) -> bool:
    if n < 2018: return False

    p_1 = 168
    p_2 = int(nprimes[n - 1009]) - 1

    while p_1 <= p_2:
        s = primes[p_1] + primes[p_2]
        if s == n: return True
        elif s < n: p_1 += 1
        else: p_2 -= 1

    return False

@njit(parallel=True)
def n_decomposable(nmax: int) -> int:
    (primes, nprimes) = sieve(nmax)
    res = 0

    stop = nmax//100

    for i in prange(0, nmax//2 + 1):
        if i%stop == 0:
            print(f"checked up to {i*2}")
        if decomposable(2*i, primes, nprimes): res += 1

    return res

def main():
    nmax = 100_000_000
    print(f"found {n_decomposable(nmax)} decomposable even numbers up to {nmax}")

if __name__ == "__main__":
    main()
