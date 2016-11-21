<?php

use PHPUnit\Framework\TestCase;

class TestChinaMobilePhoneNumberRegexes extends TestCase {

	private $all_prefixes = [130, 131, 132, 133,
							 1340, 1341, 1342, 1343, 1344, 1345, 1346, 1347, 1348, 1349,
							 135, 136, 137, 138, 139,
							 145, 147, 
							 150, 151, 152, 153, 155, 156, 157, 158, 159, 
							 1700, 1701, 1702, 1703, 1704, 1705, 1706, 1707, 1708, 1709, 
							 171, 176, 177, 178, 
							 180, 181, 182, 183, 184, 185, 186, 187, 188, 189
							];
					
	private $china_mobile_prefixes = [1340, 1341, 1342, 1343, 1344, 1345, 1346, 1347, 1348,
									  135, 136, 137, 138, 139,
									  147, 
									  150, 151, 152, 157, 158, 159, 
									  1703, 1705, 1706, 
									  178, 
									  182, 183, 184, 187, 188
									  ];
							
	private $china_unicom_prefixes = [130, 131, 132, 
									  145, 
									  155, 156, 
									  1704, 1707, 1708, 1709, 
									  171, 176, 
									  185, 186
									  ];
							
	private $china_telecom_prefixes = [133,
									   153, 
								 	   1700, 1701, 1702, 
									   177, 
									   180, 181, 189
									   ];
	
	private function generateRandomNumber($length = 11) {
		$min = pow(10, $length - 1);
		$max = pow(10, $length) - 1;
		
		return rand($min, $max);
	}
	
	private function generateRandomValidNumbers($prefixes) {
		$this->assertGreaterThan(0, count($prefixes));
		
		$numbers = [];
		
		foreach ($prefixes as $prefix) {
			$random_number = $this->generateRandomNumber();
			$number = substr_replace($random_number, $prefix, 0, strlen($prefix));
			$numbers[] = $number;
		}
		
		return $numbers;
	}
	
	private function doActuallyTest($pattern, $prefixes) {
		$this->assertNotNull($pattern);
		$this->assertGreaterThan(0, count($prefixes));
		
		$numbers = $this->generateRandomValidNumbers($prefixes);
		
		$this->assertGreaterThan(0, count($numbers));
		
		foreach ($numbers as $number) {
			$this->assertRegExp($pattern, $number);
		}
	}

	private function doActuallyTest2($pattern, $sub_pattern, $prefixes) {
		$this->assertNotNull($pattern);
		$this->assertNotNull($sub_pattern);
		$this->assertGreaterThan(0, count($prefixes));

		$numbers = $this->generateRandomValidNumbers($prefixes);

		$this->assertGreaterThan(0, count($numbers));
		
		$match_sub_pattern_numbers = preg_grep($sub_pattern, $numbers, PREG_GREP_INVERT);
		
		$this->assertGreaterThan(0, count($match_sub_pattern_numbers));

		foreach ($match_sub_pattern_numbers as $number) {
			$this->assertRegExp($pattern, $number);
		}
	}
	
	public function testMatchAll() {
		$this->doActuallyTest('/^(?=\d{11}$)^1(?:3\d|4[57]|5[^4\D]|7[^249\D]|8\d)\d{8}$/',
							  $this->all_prefixes);
	}
	
	public function testExceptMVNOPhoneNumbers() {
		$this->doActuallyTest2('/^(?=\d{11}$)^1(?:3\d|4[57]|5[^4\D]|7[^01249\D]|8\d)\d{8}$/',
							   '/^(170|171)/',
							   $this->all_prefixes);
	}
	
	public function testExceptSatellitePhoneNumbers() {
		$this->doActuallyTest2('/^(?=\d{11}$)^1(?:3(?!49)\d|4[57]|5[^4\D]|7[^249\D]|8\d)\d{8}$/',
							   '/^1349/',
							   $this->all_prefixes);
	}
	
	public function testExceptDataOnlyPhoneNumbers() {
		$this->doActuallyTest2('/^(?=\d{11}$)^1(?:3\d|5[^4\D]|7[^249\D]|8\d)\d{8}$/',
							   '/^(145|147)/',
							   $this->all_prefixes);
	}
	
	public function testOnlyChinaMobile() {
		$this->doActuallyTest('/^(?=\d{11}$)^1((?:3(?!49)[4-9\D]|47|5[012789]|7[8]|8[23478])\d{8}$|70[356]\d{7}$)/',
							  $this->china_mobile_prefixes);
	}
	
	public function testOnlyChinaUnicom() {
		$this->doActuallyTest('/^(?=\d{11}$)^1((?:3[0-2]|45|5[56]|7[156]|8[56])\d{8}$|70[4789]\d{7}$)/',
							  $this->china_unicom_prefixes);
	}
	
	public function testOnlyChinaTelecom() {
		$this->doActuallyTest('/^(?=\d{11}$)^1(?:(?:33|49|53|7[37]|8[019])\d{8}$|(?:349|70[0-2])\d{7}$)/',
							  $this->china_telecom_prefixes);
	}
}