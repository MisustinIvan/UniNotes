#!/bin/python3

from abc import ABC, abstractmethod
from dataclasses import dataclass
from pathlib import Path
from typing import List, Tuple
from typing_extensions import override
from sys import argv
import numpy as np
import numpy.typing as npt
import matplotlib.pyplot as plt

@dataclass
class HarmonicOscilator:
    amplitude: np.float64
    frequency: np.float64
    phase: np.float64

    def eval(self, t: npt.NDArray[np.float64]) -> npt.NDArray[np.float64]:
        return self.amplitude * np.sin(self.frequency * t + self.phase)

class Lissajous(ABC):
    @abstractmethod
    def evaluate(self, t_min: np.float64, t_max: np.float64, steps: int) -> npt.NDArray[np.float64]:
        pass

    @property
    @abstractmethod
    def dim(self) -> int:
        return 0

    def dump(self, filepath: str | Path, t_min: np.float64, t_max: np.float64, steps: int) -> None:
        data = self.evaluate(t_min, t_max, steps).T
        np.savetxt(filepath, data, fmt="%.10f", delimiter=" ")

    def dump_gnuplot(self, filepath: str | Path, t_min: np.float64, t_max: np.float64, steps: int) -> None:
        data = self.evaluate(t_min, t_max, steps).T
        dest = Path(filepath).stem + ".png"
        lines: List[str] = [
            f"set output '{dest}'",
            "set terminal pngcairo"
        ]

        match self.dim:
            case 2:
                lines.append("plot '-' with lines")
                lines += [f"{x} {y}" for (x,y) in data]
            case 3:
                lines.append("splot '-' with lines")
                lines += [f"{x} {y} {z}" for (x,y,z) in data]

        lines += [ "e", "set output" ]

        with open(filepath, mode="w+") as f:
            f.writelines("\n".join(lines))

class Lissajous2D(Lissajous):
    def __init__(self, axes: Tuple[HarmonicOscilator, HarmonicOscilator]) -> None:
        self.axes = axes

    @property
    def dim(self) -> int:
        return 2

    def evaluate(self, t_min: np.float64, t_max: np.float64, steps: int) -> npt.NDArray[np.float64]:
        t = np.linspace(t_min, t_max, steps)
        return np.vstack([axis.eval(t) for axis in self.axes])

class Lissajous2DT(Lissajous2D):
    def __init__(self, axes: Tuple[HarmonicOscilator, HarmonicOscilator]) -> None:
        super().__init__(axes)

    @property
    def dim(self) -> int:
        return 3

    @override
    def evaluate(self, t_min: np.float64, t_max: np.float64, steps: int) -> npt.NDArray[np.float64]:
        t = np.linspace(t_min, t_max, steps)
        return np.vstack([axis.eval(t) for axis in self.axes] + [t])

class Lissajous3D(Lissajous):
    def __init__(self, axes: Tuple[HarmonicOscilator, HarmonicOscilator, HarmonicOscilator]) -> None:
        self.axes = axes

    @property
    def dim(self) -> int:
        return 3

    def evaluate(self, t_min: np.float64, t_max: np.float64, steps: int) -> npt.NDArray[np.float64]:
        t = np.linspace(t_min, t_max, steps)
        return np.vstack([axis.eval(t) for axis in self.axes])

def plot(curve: Lissajous, t_min: np.float64, t_max: np.float64, steps: int) -> None:
    data = curve.evaluate(t_min, t_max, steps)
    dim = curve.dim

    fig = plt.figure(figsize=(16,16))

    match dim:
        case 2:
            ax = fig.add_subplot(111)
            ax.plot(data[0], data[1], linestyle="-", color="b", lw=1.2)
            ax.set_xlabel("X")
            ax.set_ylabel("Y")

        case 3:
            ax = fig.add_subplot(111, projection="3d")
            ax.plot(data[0], data[1], data[2], linestyle="-", color="b", lw=1.2)
            ax.set_xlabel("X")
            ax.set_ylabel("Y")
            ax.set_zlabel("Z")

    plt.title("Lissajous curve")
    plt.grid(True, linestyle="--", alpha=0.6)
    plt.show()


def main():
    lc_2d = Lissajous2D((
        HarmonicOscilator(np.float64(1.), np.float64(5.), np.float64(np.pi/2)),
        HarmonicOscilator(np.float64(1.), np.float64(4.), np.float64(0.))
    ))

    lc_2dt = Lissajous2DT((
        HarmonicOscilator(np.float64(1.), np.float64(3.), np.float64(0.)),
        HarmonicOscilator(np.float64(1.), np.float64(2.), np.float64(0.))
    ))

    lc_3d = Lissajous3D((
        HarmonicOscilator(np.float64(1.), np.float64(3.), np.float64(0.1)),
        HarmonicOscilator(np.float64(1.), np.float64(4.), np.float64(0.7)) ,
        HarmonicOscilator(np.float64(1.), np.float64(7.), np.float64(0.))
    ))

    if "--preview" in argv:
        plot(lc_2d, np.float64(0.), np.float64(2 * np.pi), 1000)
        plot(lc_2dt, np.float64(0.), np.float64(2 * np.pi), 1000)
        plot(lc_3d, np.float64(0.), np.float64(2 * np.pi), 1000)

    if "--dump_gnuplot" in argv:
        lc_2d.dump_gnuplot("lissajous_2d.gn", np.float64(0.), np.float64(2 * np.pi), 1000)
        lc_2dt.dump_gnuplot("lissajous_2dt.gn", np.float64(0.), np.float64(2 * np.pi), 1000)
        lc_3d.dump_gnuplot("lissajous_3d.gn", np.float64(0.), np.float64(2 * np.pi), 1000)

    if "--dump_dat" in argv:
        lc_2d.dump("lissajous_2d.dat", np.float64(0.), np.float64(2 * np.pi), 1000)
        lc_2dt.dump("lissajous_2dt.dat", np.float64(0.), np.float64(2 * np.pi), 1000)
        lc_3d.dump("lissajous_3d.dat", np.float64(0.), np.float64(2 * np.pi), 1000)

if __name__ == "__main__":
    main()
