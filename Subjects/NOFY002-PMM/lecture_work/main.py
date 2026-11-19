#!/bin/env python3

def fib_ratio(n):
    a = 0
    b = 1
    for i in range(n):
        s = a + b
        a = b
        b = s
    return b/a

def main():
    nmax = 10_000
    print(fib_ratio(nmax))

if __name__ == "__main__":
    main()
