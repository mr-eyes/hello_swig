import pytest
import unittest

import helloSwig as HS

class TestHelloSwig(unittest.TestCase):

    def test_one(self):
        x = "Hello World!"
        self.assertTrue(HS.get_hello() == "Hello World!")