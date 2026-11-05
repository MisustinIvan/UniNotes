#!/bin/python3

# %%
a = [i for i in range(100)]
b = [i**2 for i in range(100)]
print(a)
print(b)

# %%
def main():
    a = int(1e9)
    print(f"a = {a:b}")
    print(f"a = {a:o}")
    print(f"a = {a:x}")

    n = input("input: ")
    print(n)

# %%
if __name__ == "__main__":
    main()
