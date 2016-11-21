#!/usr/bin/python
# coding=utf8

import re
import unittest
from random import randint

class TestChinaMobilePhoneNumberRegexes(unittest.TestCase):
	
	@classmethod
	def setUpClass(cls):
		cls.all_prefixes = map(str, [130, 131, 132, 133,
									 1340, 1341, 1342, 1343, 1344, 1345, 1346, 1347, 1348, 1349,
									 135, 136, 137, 138, 139,
									 145, 147, 
									 150, 151, 152, 153, 155, 156, 157, 158, 159, 
									 1700, 1701, 1702, 1703, 1704, 1705, 1706, 1707, 1708, 1709, 
									 171, 176, 177, 178, 
									 180, 181, 182, 183, 184, 185, 186, 187, 188, 189
									 ])
				
		cls.china_mobile_prefixes = map(str, [1340, 1341, 1342, 1343, 1344, 1345, 1346, 1347, 1348,
											  135, 136, 137, 138, 139,
											  147, 
											  150, 151, 152, 157, 158, 159, 
											  1703, 1705, 1706, 
											  178, 
											  182, 183, 184, 187, 188
											  ])
						
		cls.china_unicom_prefixes = map(str, [130, 131, 132, 
											  145, 
											  155, 156, 
											  1704, 1707, 1708, 1709, 
											  171, 176, 
											  185, 186
											  ])
								
		cls.china_telecom_prefixes = map(str, [133,
											   153, 
										 	   1700, 1701, 1702, 
											   177, 
											   180, 181, 189
											   ])

	@classmethod
	def tearDownClass(cls):
		cls.all_prefixes = None
		cls.china_mobile_prefixes = None
		cls.china_unicom_prefixes = None
		cls.china_telecom_prefixes = None

	def generate_random_number(self, length = 11):
		min = 10 ** (length - 1)
		max = (10 ** length) - 1
		
		return str(randint(min, max))
	
	def generate_random_valid_numbers(self, prefixes):
		self.assertIsNotNone(prefixes)
			
		numbers = []
		
		for prefix in prefixes:
			random_number = self.generate_random_number()
			number = prefix + random_number[len(prefix):]
			numbers.append(number)
			
		return numbers

	def validate(self, pattern, subject):
		if not pattern or not subject:
			return False
			
		regex = re.compile(pattern)
		
		return regex.match(subject)
		
	def do_actually_test(self, pattern, prefixes):
		self.assertIsNotNone(pattern)
		self.assertIsNotNone(prefixes)

		numbers = self.generate_random_valid_numbers(prefixes)

		self.assertTrue(numbers)

		for number in numbers:
			self.assertTrue(self.validate(pattern, number))

	def do_actually_test_2(self, pattern, sub_pattern, prefixes):
		self.assertIsNotNone(pattern)
		self.assertIsNotNone(sub_pattern)
		self.assertIsNotNone(prefixes)

		numbers = self.generate_random_valid_numbers(prefixes)

		self.assertTrue(numbers)

		match_sub_pattern_numbers = filter(lambda num: not self.validate(sub_pattern, num), numbers)
		
		self.assertTrue(match_sub_pattern_numbers);

		for number in match_sub_pattern_numbers:
			self.assertTrue(self.validate(pattern, number))
	
	def test_match_all(self):
		self.do_actually_test(ur"^(?=\d{11}$)^1(?:3\d|4[57]|5[^4\D]|7[^249\D]|8\d)\d{8}$",
						      self.all_prefixes)
			
	def test_only_china_mobile(self):
		self.do_actually_test(ur"^(?=\d{11}$)^1((?:3(?!49)[4-9\D]|47|5[012789]|7[8]|8[23478])\d{8}$|70[356]\d{7}$)",
						      self.china_mobile_prefixes)
	
	def test_only_china_unicom(self):
		self.do_actually_test(ur"^(?=\d{11}$)^1((?:3[0-2]|45|5[56]|7[156]|8[56])\d{8}$|70[4789]\d{7}$)",
						      self.china_unicom_prefixes)
	
	def test_only_china_telecom(self):
		self.do_actually_test(ur"^(?=\d{11}$)^1(?:(?:33|49|53|7[37]|8[019])\d{8}$|(?:349|70[0-2])\d{7}$)",
						      self.china_telecom_prefixes)

	def test_except_mvno_phone_numbers(self):
		self.do_actually_test_2(ur"^(?=\d{11}$)^1(?:3\d|4[57]|5[^4\D]|7[^01249\D]|8\d)\d{8}$",
						        ur"^(170|171)", 
						        self.all_prefixes)
	
	def test_except_satellite_phone_numbers(self):
		self.do_actually_test_2(ur"^(?=\d{11}$)^1(?:3(?!49)\d|4[57]|5[^4\D]|7[^249\D]|8\d)\d{8}$",
						        ur"^1349", 
						        self.all_prefixes)
			
	def test_except_data_only_phone_numbers(self):
		self.do_actually_test_2(ur"^(?=\d{11}$)^1(?:3\d|5[^4\D]|7[^249\D]|8\d)\d{8}$",
						        ur"^(145|147)", 
						        self.all_prefixes)

if __name__ == '__main__':
	unittest.main()