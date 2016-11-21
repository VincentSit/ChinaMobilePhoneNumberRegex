#!/usr/bin/ruby
# frozen_string_literal: true

require 'test/unit'

class TestChinaMobilePhoneNumberRegexes < Test::Unit::TestCase

	def setup
		@all_prefixes = [130, 131, 132, 133,
						 1340, 1341, 1342, 1343, 1344, 1345, 1346, 1347, 1348, 1349,
						 135, 136, 137, 138, 139,
						 145, 147, 
						 150, 151, 152, 153, 155, 156, 157, 158, 159, 
						 1700, 1701, 1702, 1703, 1704, 1705, 1706, 1707, 1708, 1709, 
						 171, 176, 177, 178, 
						 180, 181, 182, 183, 184, 185, 186, 187, 188, 189
						 ].map(&:to_s)

		@china_mobile_prefixes = [1340, 1341, 1342, 1343, 1344, 1345, 1346, 1347, 1348,
								  135, 136, 137, 138, 139,
								  147, 
								  150, 151, 152, 157, 158, 159, 
								  1703, 1705, 1706, 
								  178, 
								  182, 183, 184, 187, 188
								  ].map(&:to_s)
						
		@china_unicom_prefixes = [130, 131, 132, 
								  145, 
								  155, 156, 
								  1704, 1707, 1708, 1709, 
								  171, 176, 
								  185, 186
								  ].map(&:to_s)
								
		@china_telecom_prefixes = [133,
								   153, 
							 	   1700, 1701, 1702, 
								   177, 
								   180, 181, 189
								   ].map(&:to_s)
	end

	def teardown
		@all_prefixes = nil
		@china_mobile_prefixes = nil
		@china_unicom_prefixes = nil
		@china_telecom_prefixes = nil
	end
	
	def generate_random_valid_numbers(prefixes)
		return nil if prefixes.empty? or prefixes.nil?

		numbers = []

		prefixes.each do |prefix|
			random_number = rand.to_s[2..12]
			number = prefix + random_number[prefix.length..-1]
			numbers << number
		end

		return numbers
	end

	def do_actually_test(pattern, prefixes)
		assert_not_nil(pattern)
		assert_not_nil(prefixes)

		numbers = generate_random_valid_numbers(prefixes)

		assert_not_equal(0, numbers.size)

		assert_equal(numbers, numbers.grep(pattern))
	end

	def do_actually_test_2(pattern, sub_pattern, prefixes)
		assert_not_nil(pattern)
		assert_not_nil(sub_pattern)
		assert_not_nil(prefixes)

		numbers = generate_random_valid_numbers(prefixes)

		assert_not_equal(0, numbers.size)

		match_sub_pattern_numbers = numbers.select {|num| num !~ sub_pattern}
		
		assert_not_equal(0, match_sub_pattern_numbers.size)

		assert_equal(match_sub_pattern_numbers, match_sub_pattern_numbers.grep(pattern))
	end

	def test_match_all
		do_actually_test(/^(?=\d{11}$)^1(?:3\d|4[57]|5[^4\D]|7[^249\D]|8\d)\d{8}$/,
					     @all_prefixes)
	end

	def test_only_china_mobile
		do_actually_test(/^(?=\d{11}$)^1((?:3(?!49)[4-9\D]|47|5[012789]|7[8]|8[23478])\d{8}$|70[356]\d{7}$)/,
					     @china_mobile_prefixes)
	end

	def test_only_china_unicom
		do_actually_test(/^(?=\d{11}$)^1((?:3[0-2]|45|5[56]|7[156]|8[56])\d{8}$|70[4789]\d{7}$)/,
					     @china_unicom_prefixes)
	end

	def test_only_china_telecom
		do_actually_test(/^(?=\d{11}$)^1(?:(?:33|49|53|7[37]|8[019])\d{8}$|(?:349|70[0-2])\d{7}$)/,
					     @china_telecom_prefixes)
	end

	def test_except_mvno_phone_numbers
		do_actually_test_2(/^(?=\d{11}$)^1(?:3\d|4[57]|5[^4\D]|7[^01249\D]|8\d)\d{8}$/,
						   /^(170|171)/,
					       @all_prefixes)
	end

	def test_except_satellite_phone_numbers
		do_actually_test_2(/^(?=\d{11}$)^1(?:3(?!49)\d|4[57]|5[^4\D]|7[^249\D]|8\d)\d{8}$/,
						   /^1349/,
						   @all_prefixes)
	end

	def test_except_data_only_phone_numbers
		do_actually_test_2(/^(?=\d{11}$)^1(?:3\d|5[^4\D]|7[^249\D]|8\d)\d{8}$/,
						   /^(145|147)/,
						   @all_prefixes)
	end

end