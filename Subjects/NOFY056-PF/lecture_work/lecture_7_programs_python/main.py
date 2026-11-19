#!/bin/env python3

def f(x: int):
    '''Returns the argument x incremented by 1, the argument must also be non-negative.'''
    assert x >= 0, 'argument x musí být nezáporný'

    return x + 1

def main():
    print(f"f.__doc__ = {f.__doc__}")
    help(f)
    print(f"f(1) = {f(1)}")
    print(f"f(-1) = {f(-1)}")
    pass

if __name__ == "__main__":
    main()
