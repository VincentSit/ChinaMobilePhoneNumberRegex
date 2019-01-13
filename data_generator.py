#!/usr/bin/env python
# coding=utf-8

import json
import itertools
from random import randint
from pathlib import Path


def random_digits(n):
    """
    Generates a random number with a length of n.
    """
    range_start = 10 ** (n - 1)
    range_end = (10 ** n) - 1
    return str(randint(range_start, range_end))


def generate_test_data_json_file():
    """
    Generate a test number file named test_data.json based on the rules in rules.json.
    """
    with open("rules.json", "r") as f:
        rules = json.load(f)

    test_data = {}
    for key in rules:
        if "misc" == key:
            continue
        test_data[key] = {}

        # How many numbers are generated for each prefix.
        # Be careful to increase this value, it will significantly affect the time it takes for the unit test.
        repeat_per_prefix = 1
        for operator, value in rules[key].items():
            if dict != type(value):
                continue

            prefixes = value["prefixes"]
            if list != type(prefixes):
                continue

            length = (
                rules[key][operator]["length"]
                if ("reserved" == key)
                else rules[key]["length"]
            )
            test_data[key].update(
                {
                    operator: [
                        int(prefix + random_digits(length - len(prefix)))
                        for prefix in list(map(str, prefixes))
                        for _ in itertools.repeat(None, repeat_per_prefix)
                    ]
                }
            )

    filename = "test_data.json"
    with open(filename, "w") as outfile:
        json.dump(test_data, outfile, indent=4)

    print(f"The file was successfully saved to {Path().absolute()}/{filename}")


if __name__ == "__main__":
    generate_test_data_json_file()

