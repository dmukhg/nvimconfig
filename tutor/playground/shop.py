import os

from inventory import RETRY_LIMIT, Item, restock, total_value


def main() -> None:
    stock = [Item("apple", 3, 50), Item("pear", 0, 75)]
    stock[1] = restock(stock[1], "10")
    print("value:", total_valu(stock))
    print("retries:", RETRY_LIMIT)


if __name__ == "__main__":
    main()
