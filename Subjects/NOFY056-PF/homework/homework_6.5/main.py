#!/bin/env python3
'''
Implements a visualization of the [Newton fractal](https://en.wikipedia.org/wiki/Newton_fractal).
'''

from dataclasses import dataclass
import numpy as np
import matplotlib.pyplot as plt

class NewtonFractal:
    epsilon = 1e-6

    def __init__(self, *roots) -> None:
        self.roots = np.asarray(roots, dtype=np.complex128)
        self.poly = np.polynomial.Polynomial.fromroots(self.roots)
        self.dpoly = self.poly.deriv()

    def compute(self, lower, upper, res, max_iter):
        plane = np.linspace(lower.real, upper.real, res)[None, :] + 1j * np.linspace(lower.imag, upper.imag, res)[:, None]

        for _ in range(max_iter):
            plane -= self.poly(plane)/self.dpoly(plane)

        # for each point compute distance to every root - shape expands to (res, res, len(roots))
        distances = np.abs(plane[..., None] - self.roots)
        # argmin by last(deepest) axis - returns the indices of the minimal distance n-tuples that correspond to the closest root
        # shape goes back to (res, res)
        root_indices = np.argmin(distances, axis=-1)
        # find those distances(by deepest axis again)
        # shape goes back to (res, res)
        min_distances = np.min(distances, axis=-1)

        # filter out all converged points
        converged = min_distances <= self.epsilon

        return np.where(converged, root_indices, -1)

    def plot(self, lower: complex, upper:complex, res = 800, max_iter = 20):
        rng = np.random.default_rng()
        n = len(self.roots)

        # generate random colors for the rooots
        colors = rng.integers(0, 256, size=(n,3), dtype=np.uint8)
        # last color is black for -1 indexing
        colors = np.vstack([colors, [0,0,0]])

        indices = self.compute(lower, upper, res, max_iter)
        img = colors[indices]

        plt.imshow(
            img,
            origin="lower",
            extent=(lower.real, upper.real, lower.imag, upper.imag),
        )

        plt.scatter(
            self.roots.real,
            self.roots.imag,
            c="white",
            edgecolors="black",
        )

        plt.xlabel("Re(z)")
        plt.ylabel("Im(z)")
        plt.savefig("out.png", dpi=300)
        plt.show()


def main():
    nf = NewtonFractal(-1, 1 + 1j, 1 - 1j, 0.5 + 0.33j)

    nf.plot(-2 -2j, 2 + 2j, res=1600)

if __name__ == "__main__":
    main()
