#!/usr/bin/env python

# %%
import matplotlib.pyplot as plt
import numba
import numpy as np
from numba import get_num_threads, njit, prange

X_MIN, X_MAX = -2.0, 1.0
Y_MIN, Y_MAX = -1.0, 1.0

# %%
@njit(fastmath=True, inline="always")
def escape_steps(cr, ci, max_iter):
    zr, zi = 0.0, 0.0
    saved_r, saved_i = 0.0, 0.0
    period, check = 0, 8

    for i in range(max_iter):
        zr, zi = zr*zr - zi*zi + cr, 2.0*zr*zi + ci

        if zr*zr + zi*zi >= 4.0:
            return i

        if abs(zr - saved_r) < 1e-12 and abs(zi - saved_i) < 1e-12:
            return -1

        period += 1
        if period == check:
            saved_r, saved_i = zr, zi
            period = 0
            check *= 2

    return -1

# %%
@njit(fastmath=True, parallel=True)
def calc_buddhabrot(max_iter: int, resolution: int, samples: int):
    steps_x = 3 * resolution
    steps_y = 2 * resolution

    n_threads = get_num_threads()
    per_thread = (samples + n_threads - 1) // n_threads

    maps = np.zeros((n_threads, steps_x, steps_y), dtype=np.uint32)

    for t in prange(n_threads):
        density = maps[t]

        for _ in range(per_thread):
            cr = np.random.uniform(X_MIN, X_MAX)
            ci = np.random.uniform(Y_MIN, Y_MAX)

            steps = escape_steps(cr, ci, max_iter)
            if steps <= 0:
                continue

            # record density
            zr, zi = 0.0, 0.0
            for _k in range(steps):
                zr, zi = zr*zr - zi*zi + cr, 2.0*zr*zi + ci

                px = int((zr - X_MIN) * resolution)
                py = int((zi - Y_MIN) * resolution)

                if 0 <= px < steps_x and 0 <= py < steps_y:
                    density[px, py] += 1

    return maps.sum(axis=0)

# %%
def plot(density_map):
    # Log-transform density map
    img = np.log1p(density_map.T.astype(np.float64))

    plt.figure(figsize=(8, 6))
    im = plt.imshow(
        img,
        cmap="gray",
        origin="lower",
        vmin=0.0,
        vmax=np.percentile(img, 99.9),
        aspect="equal",  # optional: adjust if pixel aspect ratio is non-square
    )

    plt.colorbar(im, label="log(1 + density)")
    plt.title("Density Map")
    plt.xlabel("X")
    plt.ylabel("Y")
    plt.show()

# %%
def main():
    numba.set_num_threads(10)

    # warm-up
    calc_buddhabrot(10, 10, 10)

    resolution = 1_000
    max_iter = 100_000
    res = calc_buddhabrot(max_iter, resolution, 20_000_000)

    plot(res)

if __name__ == "__main__":
    main()
