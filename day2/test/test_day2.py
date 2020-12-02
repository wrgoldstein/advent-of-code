from collections import Counter
import re

def test_first():
    lines = open("test/test_input").readlines()
    valid = 0
    for line in lines:
        line = line.strip()
        m = re.match(
            "(?P<min>\d+)-(?P<max>\d+) (?P<char>\w)\: (?P<pass>\w+)", line
        ).groupdict()

        mn = int(m["min"])
        mx = int(m["max"])
        c = m["char"]

        v = Counter(list(m["pass"]))[c]

        if mn <= v <= mx:
            valid += 1

    assert valid == 2


def test_second():
    lines = open("test/test_input").readlines()
    valid = 0
    for line in lines:
        line = line.strip()
        m = re.match(
            "(?P<min>\d+)-(?P<max>\d+) (?P<char>\w)\: (?P<pass>\w+)", line
        ).groupdict()

        mn = int(m["min"])
        mx = int(m["max"])
        c = m["char"]
        p = m["pass"]

        if Counter([p[mn-1], p[mx-1]])[c] == 1:
            valid += 1

    assert valid == 1
