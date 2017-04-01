# -*- encoding: utf-8 -*-

import unittest

class ${1:ClassTest}(unittest.TestCase):

    def test_${2:method}(self):
        ${0:self.assertEqual(str(2), '2')}

if __name__ == '__main__':
    unittest.main()
