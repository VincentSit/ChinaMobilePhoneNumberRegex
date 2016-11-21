const all_prefixes = [130, 131, 132, 133,
					  1340, 1341, 1342, 1343, 1344, 1345, 1346, 1347, 1348, 1349,
					  135, 136, 137, 138, 139,
					  145, 147, 
					  150, 151, 152, 153, 155, 156, 157, 158, 159, 
					  1700, 1701, 1702, 1703, 1704, 1705, 1706, 1707, 1708, 1709, 
					  171, 176, 177, 178, 
					  180, 181, 182, 183, 184, 185, 186, 187, 188, 189
					  ].map(String);

const china_mobile_prefixes = [1340, 1341, 1342, 1343, 1344, 1345, 1346, 1347, 1348,
							   135, 136, 137, 138, 139,
							   147, 
							   150, 151, 152, 157, 158, 159, 
							   1703, 1705, 1706, 
							   178, 
							   182, 183, 184, 187, 188
							   ].map(String);
						
const china_unicom_prefixes = [130, 131, 132, 
							   145, 
							   155, 156, 
							   1704, 1707, 1708, 1709, 
							   171, 176, 
							   185, 186
							   ].map(String);
						
const china_telecom_prefixes = [133,
							    153, 
						 	    1700, 1701, 1702, 
							    177, 
							    180, 181, 189
							    ].map(String);

function generateRandomNumber(length = 11) {
	return Math.floor(Math.pow(10, length - 1) + Math.random() * 9 * Math.pow(10, length - 1)).toString();
}

function generateRandomValidNumbers(prefixes) {
	QUnit.test("generateRandomValidNumbers > testPrefixesShouldValid", function(assert) {
  		assert.ok(prefixes.length > 0);
	});

	var numbers = [];

	for (var i = 0; i < prefixes.length; i++) {
		var prefix = prefixes[i];
		var random_number = generateRandomNumber();
		var number = prefix + random_number.substring(prefix.length);
		numbers.push(number);
	}

	return numbers;
}

function doActuallyTest(pattern, prefixes) {
	QUnit.test("doActuallyTest > test `pattern` should be valid", function(assert) {
  		assert.ok(pattern);
	});

	QUnit.test("doActuallyTest > test `prefixes` should be valid", function(assert) {
  		assert.ok(prefixes.length > 0);
	});

	var numbers = generateRandomValidNumbers(prefixes);

	QUnit.test("doActuallyTest > test `numbers` should be valid", function(assert) {
  		assert.ok(numbers.length > 0);
	});
	
	var matches = numbers.filter(function(number) {
		return pattern.test(number);
	});

	QUnit.test("doActuallyTest > test `matches` should be same as `numbers`", function(assert) {
  		assert.deepEqual(matches, numbers);
	});
}

function doActuallyTest2(pattern, sub_pattern, prefixes) {
	QUnit.test("doActuallyTest2 > test `pattern` should be valid", function(assert) {
  		assert.ok(pattern);
	});

	QUnit.test("doActuallyTest2 > test `sub_pattern` should be valid", function(assert) {
  		assert.ok(sub_pattern);
	});

	QUnit.test("doActuallyTest2 > test `prefixes` should be valid", function(assert) {
  		assert.ok(prefixes.length > 0);
	});

	var numbers = generateRandomValidNumbers(prefixes);

	QUnit.test("doActuallyTest2 > test `numbers` should be valid", function(assert) {
  		assert.ok(numbers.length > 0);
	});

	var matches = numbers.filter(function(number) {
		return !sub_pattern.test(number);
	});

	QUnit.test("doActuallyTest2 > test `matches` should be valid", function(assert) {
  		assert.ok(matches.length > 0);
	});
	
	QUnit.test("doActuallyTest2 > test `matches` should be same as `numbers`", function(assert) {
		for (var i = 0; i < matches.length; i++) {
			var num = matches[i];
			assert.ok(pattern.test(num));
		}
	});	
}

QUnit.module("testMatchAll", function() {
	doActuallyTest(/^(?=\d{11}$)^1(?:3\d|4[57]|5[^4\D]|7[^249\D]|8\d)\d{8}$/,
				   all_prefixes);	
});

QUnit.module("testOnlyChinaMobile", function() {
	doActuallyTest(/^(?=\d{11}$)^1((?:3(?!49)[4-9\D]|47|5[012789]|7[8]|8[23478])\d{8}$|70[356]\d{7}$)/,
				   china_mobile_prefixes);	
});

QUnit.module("testOnlyChinaUnicom", function() {
	doActuallyTest(/^(?=\d{11}$)^1((?:3[0-2]|45|5[56]|7[156]|8[56])\d{8}$|70[4789]\d{7}$)/,
				   china_unicom_prefixes);	
});

QUnit.module("testOnlyChinaTelecom", function() {
	doActuallyTest(/^(?=\d{11}$)^1(?:(?:33|49|53|7[37]|8[019])\d{8}$|(?:349|70[0-2])\d{7}$)/,
				   china_telecom_prefixes);
});

QUnit.module("testExceptMVNOPhoneNumbers", function() {
	doActuallyTest2(/^(?=\d{11}$)^1(?:3\d|4[57]|5[^4\D]|7[^01249\D]|8\d)\d{8}$/,
				    /^(170|171)/,
				    all_prefixes);
});

QUnit.module("testExceptSatellitePhoneNumbers", function() {
	doActuallyTest2(/^(?=\d{11}$)^1(?:3(?!49)\d|4[57]|5[^4\D]|7[^249\D]|8\d)\d{8}$/,
				    /^1349/,
				    all_prefixes);
});

QUnit.module("testExceptDataOnlyPhoneNumbers", function() {
	doActuallyTest2(/^(?=\d{11}$)^1(?:3\d|5[^4\D]|7[^249\D]|8\d)\d{8}$/,
				    /^(145|147)/,
				    all_prefixes);
});
