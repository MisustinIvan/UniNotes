#!/usr/bin/env python

import numpy as np
from numba import njit, prange

@njit(inline="always")
def mandelbrot(z, c):
    return z*z + c

@njit(inline="always")
def mag_squared(z):
    return z.real*z.real + z.imag*z.imag

@njit(fastmath=True, inline="always")
def mandelbrot_index(c, max_iter):
    z = 0.0j
    for i in range(max_iter):
        z = mandelbrot(z, c)
        if mag_squared(z) >= 4.0:
            return i
    return max_iter

@njit(fastmath=True, parallel=True)
def calc_mandelbrot(max_iter: int, resolution: int):
    steps_x = 3*resolution
    steps_y = 2*resolution

    step_x = 3.0/steps_x
    step_y = 2.0/steps_y

    res = np.empty((steps_x, steps_y), dtype=np.uint16)

    for x in prange(steps_x):
        cx = -2.0 + step_x*x
        for y in range(steps_y):
            cy = -1.0 + step_y*y
            c = cx + 1j*cy
            res[x, y] = mandelbrot_index(c, max_iter)

    return res

def main():
    # warm up
    calc_mandelbrot(1, 1)

    resolution = 2_000
    res = calc_mandelbrot(1_000, resolution)

    steps_x = 3*resolution
    steps_y = 2*resolution

    step_x = 3.0/steps_x
    step_y = 2.0/steps_y

    with open("./mandelbrot.dat", mode="w") as f:
        for i, point in enumerate(res.ravel()):
            x_idx = i // steps_y
            y_idx = i % steps_y
            cx = -2.0 + x_idx * step_x
            cy = -1.0 + y_idx * step_y
            f.write(f"{cx:.6f} {cy:.6f} {point}\n")

if __name__ == "__main__":
    main()
