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

        # iterations at which a given point has converged, max_iter means non-convergence
        iterations = np.full(plane.shape, max_iter, dtype=np.int32)
        # mask to update the plane
        active = np.ones(plane.shape, dtype=bool)

        for i in range(max_iter):
            # update only non-converged points
            z = plane[active]
            plane[active] = z - self.poly(z)/self.dpoly(z)

            # filter out newly converged points
            dist = np.min(np.abs(plane[active][:, None] - self.roots), axis=-1)
            newly_converged = np.zeros(plane.shape, dtype=bool)
            newly_converged[active] = dist <= self.epsilon

            # update iterations plane
            iterations[newly_converged] = i
            # update active mask
            active &= ~newly_converged

            # exit early if all points converged
            if not active.any():
                break

        return iterations

    def plot(self, lower: complex, upper: complex, res=800, max_iter=50):
        iterations = self.compute(lower, upper, res, max_iter)

        plt.imshow(
            iterations,
            origin="lower",
            extent=(lower.real, upper.real, lower.imag, upper.imag),
            cmap="inferno",
        )
        plt.colorbar(label="Convergence iteration count")

        plt.scatter(self.roots.real, self.roots.imag, c="white", edgecolors="black")
        plt.xlabel("Re(z)")
        plt.ylabel("Im(z)")
        plt.savefig("out.png", dpi=300)
        plt.show()


def main():
    nf = NewtonFractal(*[np.e**(2/3 * np.pi * 1j * i) for i in [0,1,2]])

    nf.plot(-10 -10j, 10 + 10j, res=2000, max_iter=100)

if __name__ == "__main__":
    main()
