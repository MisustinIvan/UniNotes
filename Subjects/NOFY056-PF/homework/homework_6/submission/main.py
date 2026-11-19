#!/bin/env python3

import numpy as np
from math import comb

# Analytický vzorec pro inverzní Hilbertovu matici z https://en.wikipedia.org/wiki/Hilbert_matrix#Properties
# používáme pythonský int, jelikož nepřeteče
def hilbert_inverse(n: int) -> np.ndarray:
    inv_h = np.empty((n, n), dtype=object)
    for i in range(1, n + 1):
        for j in range(1, n + 1):
            sign = -1 if (i + j) % 2 else 1
            val = sign * (i + j - 1) * comb(n + i - 1, n - j) * comb(n + j - 1, n - i) * (comb(i + j - 2, i - 1) ** 2)

            inv_h[i - 1, j - 1] = val
    return inv_h

def main():
    for n in range(1, 200):
        print(f"n = {n}, n^2 = {n*n} sum = {hilbert_inverse(n).sum()}")

if __name__ == "__main__":
    main()
