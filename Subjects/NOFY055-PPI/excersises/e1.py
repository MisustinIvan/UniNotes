from typing import List
from functools import reduce
from random import randint
from sys import maxsize


def avg(data: List[int]):
    sum = reduce(lambda a,b: a+b, data)
    return sum/len(data)

def median(data: List[int]):
    pass


def seed_random_data(length: int, max_val: int):
    return [randint(0, max_val) for n in range(length)]


# for i in range(1, 7):
#     print("rozdíl od průměru")
#     print(abs(500 - avg(seed_random_data(10**i, 1000))))
#     print("rozdíl od mediánu")
#     print(abs(500 - median(seed_random_data(10**i, 1000))))
