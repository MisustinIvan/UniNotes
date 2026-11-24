#!/bin/env python3
'''
Monte Carlo integration
'''

# %%
'''
First we define the functions we wish to integrate:
'''

import numpy as np
from numba import njit


@njit
def fpol(x):
  return x*x
@njit
def fgon(x):
  return np.sin(x)
@njit
def frat(x):
  return (16*x-16)/(((x-2)*x*x+4)*x-4)
# %%
'''
Then we define the method for Monte Carlo integration:
'''

@njit
def monte_carlo_integral(f, a, b, nmax):
    res = 0
    for _ in range(nmax):
        x = a+(b-a)*np.random.random()
        res+= f(x)

    return res * (b-a)/nmax
# %%
'''
Let's evaluate the integrals then:
'''

nmax = 1_000_000_00

print(monte_carlo_integral(fpol, 0,1, nmax))
print(monte_carlo_integral(fgon, 0,np.pi, nmax))
print(monte_carlo_integral(frat, 0,1, nmax))

# %%
'''
Finding roots by repeated interval bisection
'''

# %%
'''
The functions we wish to find the roots of:
'''

@njit
def fpol_b(x):
    return x*x*x-1

@njit
def fpolprime_b(x):
    return 3*x*x

# %%
'''
First define a function that searches a given interval for roots
'''

@njit
def bisect(f, a, b, x_tol=1e-12, max_iter = 60):
    iter = 0
    while (b-a) > x_tol:
        iter += 1
        x = (a+b)/2
        if f(a)*f(x) < 0:
            b = x
        else:
            a = x
        if iter >= max_iter: break
    return (a+b)/2, iter

# %%
'''
Then we find some roots of our functions:
'''

import scipy

a = 0.5
b = 2

# our bisect
print(bisect(fpol_b, a,b))
# scipy bisect
print(scipy.optimize.bisect(fpol_b,a,b))

# %%
'''
Newton's method approximates the function by it's derivative
'''

@njit
def newton(f,fprime, x_0 = 0.0, x_tol = 1e-8, maxiter = 60):
    x = x_0
    iter = 0
    for i in range(maxiter):
        iter = i
        x -= f(x)/fprime(x)

        if abs(x) < x_tol: break
    return x, iter

# %%
'''
Then calculate the roots
'''

# our newton
print(newton(fpol_b, fpolprime_b, x_0=0.5))
# scipy newton
print(scipy.optimize.newton(fpol_b,0.5,fpolprime_b))
