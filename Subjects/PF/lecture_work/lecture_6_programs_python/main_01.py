#!/bin/python3

# %%
class test:
    morbilon: list[int]

    def __init__(self) -> None:
        self.morbilion = [0]*10000

    def __len__(self):
        return len(self.morbilion)

# %%
def main():
    a = test()
    print(f"a.__len__ = {a.__len__()}")
    print(f"len(a) = {len(a)}")

# %%
if __name__ == "__main__":
    main()
