import sys
import os
import json

sys.path.insert(0, f"{os.getcwd()}/src/")

from main import handler  # noqa: E402


def test_main():
    actual = json.loads(handler(event=None, context=None))
    expected = 200

    assert actual["Status"] == expected
