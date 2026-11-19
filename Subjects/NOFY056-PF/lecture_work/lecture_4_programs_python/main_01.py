#!/bin/python3

import numpy as np

def main():
    # cycle with a real-valued increment
    steps = 0
    for i in np.arange(np.float32(0.), np.float32(7.), np.float32(0.7)):
        steps += 1
        print(f"val={i}")

    print(f"steps={steps}")

if __name__ == "__main__":
    main()
