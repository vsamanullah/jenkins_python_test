import unittest
from xmlrunner import XMLTestRunner


def add_numbers(a, b):
    """
    Adds two numbers and returns the result.

    Args:
        a (int or float): The first number.
        b (int or float): The second number.

    Returns:
        int or float: The sum of the two numbers.
    """
    return a + b




class TestAddFunction(unittest.TestCase):
    def test_add_positive_numbers(self):
        self.assertEqual(add_numbers(2, 3), 5)

    def test_add_negative_numbers(self):
        self.assertEqual(add_numbers(-2, -3), -5)

    def test_add_positive_and_negative(self):
        self.assertEqual(add_numbers(2, -3), -1)

    def test_add_with_zero(self):
        self.assertEqual(add_numbers(0, 5), 5)
        self.assertEqual(add_numbers(5, 0), 5)

    def test_add_floats(self):
        self.assertAlmostEqual(add_numbers(2.5, 3.1), 5.6)

if __name__ == "__main__":
    with open('test-results.xml', 'wb') as output:
        unittest.main(testRunner=XMLTestRunner(output=output), verbosity=2)