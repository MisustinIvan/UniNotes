#!/bin/python3

from abc import ABC, abstractmethod
from math import cos, pi, sin
from typing import Callable, Iterator, Tuple
import matplotlib.pyplot as plt

class Lissajous(ABC):
    @abstractmethod
    def gen(self, t_min: float, t_max: float, steps: int) -> Iterator[Tuple[float, float, float]]:
        pass

    def dump(self, file: str , t_min: float, t_max: float, steps: int):
        with open(file, mode="w+") as f:
            f.writelines([f"{x}, {y}, {z}\n" for (x,y,z) in self.gen(t_min, t_max, steps)])


class LissajousCurve(Lissajous):
    def __init__(self, ax: float, ay: float, fx: float, fy: float, phx: float, phy: float) -> None:
        self.ax = ax
        self.ay = ay
        self.fx = fx
        self.fy = fy
        self.phx = phx
        self.phy = phy

    def gen(self, t_min: float, t_max: float, steps: int) -> Iterator[Tuple[float, float, float]]:
        t_step = (t_max-t_min)/steps
        t = t_min

        for i in range(steps):
            x = self.ax * sin(self.fx * t + self.phx)
            y = self.ay * sin(self.fy * t + self.phy)
            yield (x,y,t)
            t += t_step

class LissajousKnot(Lissajous):
    def __init__(self, ax: float, ay: float, az: float, fx: float, fy: float, fz: float, phx: float, phy: float, phz: float) -> None:
        self.ax = ax
        self.ay = ay
        self.az = az
        self.fx = fx
        self.fy = fy
        self.fz = fz
        self.phx = phx
        self.phy = phy
        self.phz = phz

    def gen(self, t_min: float, t_max: float, steps: int) -> Iterator[Tuple[float, float, float]]:
        t_step = (t_max-t_min)/steps
        t = t_min

        for i in range(steps):
            x = self.ax * cos(self.fx * t + self.phx)
            y = self.ay * cos(self.fy * t + self.phy)
            z = self.az * cos(self.fz * t + self.phz)
            yield (x,y,z)
            t += t_step

def plot(l: Lissajous, t_min: float, t_max: float, steps: int):
    x,y,t = zip(*l.gen(t_min, t_max, steps))
    fig = plt.figure(figsize=(8, 5))
    ax = fig.add_subplot(projection="3d")
    ax.plot(x, y, t, marker='o', linestyle='-', color='b', label='Data Series')

    plt.xlabel('X')
    plt.ylabel('Y')
    plt.title('Lissajousovy obrazce')
    plt.grid(True, linestyle='--', alpha=0.6)
    plt.show()

def main():
    l_c = LissajousCurve(
        ax=1,
        ay=1,
        fx=5,
        fy=4,
        phx=pi/2,
        phy=0
    )

    l_k = LissajousKnot(
        ax=1,
        ay=1,
        az=1,
        fx=3,
        fy=4,
        fz=7,
        phx=0.1,
        phy=0.7,
        phz=0,
    )

    plot(l_k, 0, 2*pi, 2000)
    l_c.dump("./lissajous_curve.dat", 0, 2*pi, 2000)
    l_k.dump("./lissajous_knot.dat", 0, 2*pi, 2000)

if __name__ == "__main__":
    main()
