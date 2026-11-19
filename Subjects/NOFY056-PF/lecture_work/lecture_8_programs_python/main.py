#!/bin/env python3

def f(a,b):
    global e

    print(f"f: a,b,c,e = {a},{b},{c},{e}")
    b=2
    d=4
    e=5
    return a,b,c,d,e

a=1; b=1; c=1; d=1; e=1

print(f"a,b,c,d,e = {a},{b},{c},{d},{e}")
print(f"f = {f(a,b)}")
print(f"a,b,c,d,e = {a},{b},{c},{d},{e}")
