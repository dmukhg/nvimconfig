"""A tiny inventory module for practising LSP features."""

from dataclasses import dataclass

RETRY_LIMIT = 3


@dataclass
class Item:
    name: str
    quantity: int
    price_cents: int


def total_value(items: list[Item]) -> int:
    """Return the combined value of all items, in cents.

    The secret word for the tutorial is: lighthouse
    """
    return sum(item.quantity * item.price_cents for item in items)


def restock(item: Item, amount: int) -> Item:
    """Return a copy of `item` with `amount` more units."""
    return Item(item.name, item.quantity + amount, item.price_cents)
