#!/bin/python3

import numpy as np

# numpy array programming and map-filter-reduce showcase

# sums the first n odd integers
def sum_odd(n):
    arr = np.arange(n)
    arr = arr*2 + 1
    sum = np.sum(arr)
    print(f"n = {n}, sum_n = {sum}")

# filters out odd integers out of the first n integers
def filter_odd(n):
    arr = np.arange(n)
    print(f"integers = {arr}")
    mask = arr%2 != 0
    print(f"mask = {mask}")
    res = arr[mask]
    print(f"res = {res}")

def filter_odd_mfr(n):
    res = [*filter(lambda x: x%2 == 1, range(n))]
    print(f"res = {res}")

# sums the first n odd integers
def sum_odd_mfr(n):
    res = sum(filter(lambda x: x%2 == 1, map(lambda x: x*2 +1, range(n))))
    print(f"res = {res}")

def main():
    sum_odd(10)
    filter_odd(10)
    filter_odd_mfr(10)
    sum_odd_mfr(10)

if __name__ == "__main__":
    main()
