#!/usr/bin/env python3

from numba import njit
import numpy as np

def main() -> None:
    nmax = 10_000
    A = np.full((nmax, nmax), 1/nmax) # coefficient matrix
    np.fill_diagonal(A, 1)
    B = np.ones(nmax) # right hand side vector
    X = np.linalg.solve(A,B) # solution vector
    print(X)

if __name__ == "__main__":
    main()
