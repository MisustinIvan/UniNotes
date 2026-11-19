#!/usr/bin/env python3

from numba import njit
import sympy as sp
import numpy as np

def integral_1(lower, upper):
    x = sp.Symbol('x')
    expr = x*x
    indefinite = sp.integrate(expr, x)
    res = sp.integrate(expr, (x, lower, upper))
    print(f"integral 1 = {indefinite}, from {lower} to {upper} = {res}")

def integral_2(lower, upper):
    x = sp.Symbol('x')
    expr = sp.sin(x)
    indefinite = sp.integrate(expr, x)
    res = sp.integrate(expr, (x, lower, upper))
    print(f"integral 2 = {indefinite}, from {lower} to {upper} = {res}")

def integral_3(lower, upper):
    x = sp.Symbol('x')
    expr = (16*x - 16)/(x**4 - 2*x**3 + 4*x - 4)
    indefinite = sp.integrate(expr, x)
    res = sp.integrate(expr, (x, lower, upper))
    print(f"integral 3 = {indefinite}, from {lower} to {upper} = {res}")

@njit
def f1(x):
    return x*x

@njit
def f2(x):
    return np.sin(x)

@njit
def f3(x):
    return (16*x - 16)/(((x - 2)*x*x + 4)*x - 4)

@njit
def quad_for(f, a, b, nmax):
    result = 0.5*(f(a) + f(b))
    h = (b - a)/nmax
    x = a
    for n in range(1, nmax):
        x += h
        result += f(x)
    return result*h


def main() -> None:
    integral_1(0,1)
    print(f"by quadrature with 1_000_000 samples: {quad_for(f1, 0, 1, 1_000_000)}")
    integral_2(0,np.pi)
    print(f"by quadrature with 1_000_000 samples: {quad_for(f2, 0, np.pi, 1_000_000)}")
    integral_3(0,1)
    print(f"by quadrature with 1_000_000 samples: {quad_for(f3, 0, 1, 1_000_000)}")

if __name__ == "__main__":
    main()
