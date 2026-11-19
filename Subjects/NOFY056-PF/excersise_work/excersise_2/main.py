#!/bin/python3

from math import pi, sqrt
from collections.abc import Iterator,Callable
from time import process_time

def float_span(start: float, stop: float, n: int) -> Iterator[float]:
    step = (stop-start)/n
    for i in range(n):
        yield start + step*(i + 0.5)

def calc_pi_integral(n: int) -> float:
    dx = 2/n
    return sum(dx/sqrt(1-x**2) for x in float_span(-1,1,n))

def calc_pi_leibniz(n: int) -> float:
    return 4*sum((1 if x & 1 else -1) / (2*x -1) for x in range(1, n+1))

def calc_pi_euler(n: int) -> float:
    total = sum(1/x**2 for x in range(1,n+1))
    return sqrt(6*total)

def calc_pi_viet(n: int) -> float:
    a_prev = 0
    res = 1
    for _ in range(n):
        a_prev = sqrt(0.5 + 0.5*a_prev)
        res *= a_prev

    return 2/res

def calc_pi_wallis(n: int) -> float:
    res = 1
    for i in range(1,n+1):
        res *= (4*i*i)/((2*i+1)*(2*i-1))
    return 2*res

def measure(func: Callable[[int], float], arg: int):
    t = process_time()
    res = func(arg)
    delta = process_time() - t

    label = f"{func.__name__}({arg})"
    print(f"{label} = {res} in {delta} seconds")
    return (res, label)

def main():
    print(f"math.pi = {pi}")

    print("timed results\n")

    results = [
        measure(calc_pi_integral, 1_000),
        measure(calc_pi_integral, 1_000_000),
        measure(calc_pi_leibniz, 1_000),
        measure(calc_pi_leibniz, 1_000_000),
        measure(calc_pi_euler, 1_000),
        measure(calc_pi_euler, 1_000_000),
        measure(calc_pi_viet, 10),
        measure(calc_pi_viet, 100),
        measure(calc_pi_viet, 1_000),
        measure(calc_pi_wallis, 1_000),
        measure(calc_pi_wallis, 1_000_000),
    ]

    print("\n")

    print("most accurate results\n")

    results = sorted(results, key=lambda x: abs(x[0] - pi))
    for (val, label) in results:
        print(f"{label} = {val}")

    print("\n")

if __name__ == "__main__":
    main()
