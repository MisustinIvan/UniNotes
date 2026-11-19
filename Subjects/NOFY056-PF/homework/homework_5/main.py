#!/bin/env python3

from numpy import sqrt
from numba import njit
import numpy as np


@njit
def pulkruh(x):
    return sqrt(1 - x*x)

@njit
def pulkruh_cos(x):
    tmp = np.cos(x)
    return tmp*tmp

@njit
def polokoule(x,y):
    r_squared = 1 - x*x - y*y
    return sqrt(r_squared) if r_squared > 0 else 0

@njit
def quad(f, x_min, x_max, res):
    disc = np.linspace(x_min, x_max, res+1)
    return f(disc).sum() * (x_max - x_min)/res

@njit
def doublequad(f, xmin, xmax, ymin, ymax, res):
    result = 0

    dx = (xmax-xmin)/res
    dy = (ymax-ymin)/res

    tmp = 0.5*(f(xmin,ymin) + f(xmax,ymin))

    for x in np.linspace(xmin+dx,xmax-dx,res-1):
        tmp+=f(x,ymin)

    result += 0.5*tmp

    for y in np.linspace(ymin+dy,ymax-dy,res-1):
        tmp = 0.5*(f(xmin,y) + f(xmax,y))

        for x in np.linspace(xmin+dx,xmax-dx,res-1):
            tmp += f(x,y)

        result += tmp

    tmp = 0.5*(f(xmin,ymax) + f(xmax,ymax))

    for x in np.linspace(xmin+dx,xmax-dx,res-1):
        tmp += f(x,ymax)

    result += 0.5*tmp

    return result*dx*dy

def main():
    print(f"unit circle area cartesian = {2*quad(pulkruh, -1, 1, 100_000_000)}")
    print(f"unit circle area polar = {2*quad(pulkruh_cos, -np.pi/2, np.pi/2, 100)}")
    print(f"3/4 unit sphere volume cartesian = {3/4 * 2*doublequad(polokoule, -1, 1, -1, 1, 10_000)}")
    pass

if __name__ == "__main__":
    main()
