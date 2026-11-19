#!/usr/bin/env python3

from abc import ABC, abstractmethod
from collections.abc import Iterator
from dataclasses import dataclass
from enum import Enum, auto

class PointState(Enum):
    ESCAPED = auto()
    TRAPPED = auto()
    UNDEFINED = auto()

@dataclass(slots=True)
class FractalPoint:
    point: complex
    state: PointState
    index: int | None = None

@dataclass(slots=True)
class AABB:
    x_min: float
    x_max: float
    y_min: float
    y_max: float

    @property
    def width(self) -> float:
        return abs(self.x_max - self.x_min)

    @property
    def height(self) -> float:
        return abs(self.y_max - self.y_min)

def aabb_iter(bounds: AABB, resolution: int) -> Iterator[tuple[float, float]]:
    steps_x = max(1, int(bounds.width * resolution))
    steps_y = max(1, int(bounds.height * resolution))

    step_x: float = bounds.width / steps_x
    step_y: float = bounds.height / steps_y

    for x in range(steps_x):
        for y in range(steps_y):
            yield (bounds.x_min + x * step_x, bounds.y_min + y * step_y)

class AbstractFractal(ABC):
    @abstractmethod
    def func(self, z: complex, c: complex) -> complex:
        pass

    @abstractmethod
    def get_initial_state(self, point: complex) -> tuple[complex, complex]:
        """Returns (initial_z, parameter_c) for the given grid coordinate."""
        pass

    def measure(self, point: complex, max_iter: int) -> FractalPoint:
        z, c = self.get_initial_state(point)
        for i in range(max_iter):
            z = self.func(z, c)
            if z.real * z.real + z.imag * z.imag >= 4.0:
                return FractalPoint(point, PointState.ESCAPED, i)
        return FractalPoint(point, PointState.TRAPPED, None)

    def eval(self, bounds: AABB, resolution: int, max_iter: int) -> Iterator[FractalPoint]:
        for x, y in aabb_iter(bounds, resolution):
            yield self.measure(complex(x, y), max_iter)

class Mandelbrot(AbstractFractal):
    def __init__(self, seed: complex = 0j) -> None:
        self.seed = seed

    def get_initial_state(self, point: complex) -> tuple[complex, complex]:
        return self.seed, point

    def func(self, z: complex, c: complex) -> complex:
        return z * z + c

class Julia(AbstractFractal):
    def __init__(self, c: complex) -> None:
        self.c = c

    def get_initial_state(self, point: complex) -> tuple[complex, complex]:
        return point, self.c

    def func(self, z: complex, c: complex) -> complex:
        return z * z + c

def main() -> None:
    fractal = Julia(c=-0.5125 + 0.5123j)

    bounds = AABB(-1.5, 1.5, -1.5, 1.5)
    points = fractal.eval(bounds, resolution=1000, max_iter=100)

    with open("points.dat", mode="w") as f:
        f.writelines(f"{pt.point.real} {pt.point.imag} {pt.index}\n" for pt in points)

if __name__ == "__main__":
    main()
