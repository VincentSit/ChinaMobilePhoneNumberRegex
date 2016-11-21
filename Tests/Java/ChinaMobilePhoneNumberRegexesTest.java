import java.util.Random;
import java.util.ArrayList;
import org.junit.Test;
import static org.junit.Assert.*;

public class ChinaMobilePhoneNumberRegexesTest {
	final String allPrefixes[] = {"130", "131", "132", "133",
								  "1340", "1341", "1342", "1343", "1344", "1345", "1346", "1347", "1348", "1349",
								  "135", "136", "137", "138", "139",
								  "145", "147", 
								  "150", "151", "152", "153", "155", "156", "157", "158", "159", 
								  "1700", "1701", "1702", "1703", "1704", "1705", "1706", "1707", "1708", "1709", 
								  "171", "176", "177", "178", 
								  "180", "181", "182", "183", "184", "185", "186", "187", "188", "189"
								 };
					
	final String chinaMobilePrefixes[] = {"1340", "1341", "1342", "1343", "1344", "1345", "1346", "1347", "1348",
									      "135", "136", "137", "138", "139",
									      "147", 
									      "150", "151", "152", "157", "158", "159", 
									      "1703", "1705", "1706", 
									      "178", 
									      "182", "183", "184", "187", "188"
									     };
							
	final String chinaUnicomPrefixes[] = {"130", "131", "132", 
									      "145", 
									      "155", "156", 
									      "1704", "1707", "1708", "1709", 
									      "171", "176", 
									      "185", "186"
									     };
							
	final String chinaTelecomPrefixes[] = {"133",
									  	   "153", 
								 	  	   "1700", "1701", "1702", 
									  	   "177", 
									  	   "180", "181", "189"
									  	  };


	private long generateRandomNumber() {
		int length = 11;
		Random random = new Random();
    	char[] digits = new char[length];
    	digits[0] = (char) (random.nextInt(9) + '1');
    	
    	for (int i = 1; i < length; i++) {
     	   digits[i] = (char) (random.nextInt(10) + '0');
   		}

    	return Long.parseLong(new String(digits));
	}

	private ArrayList<String> generateRandomValidNumbers(String prefixes[]) {
		assertNotNull(prefixes);

		ArrayList<String> numbers = new ArrayList<String>();

		for (String prefix : prefixes) {
			String randomNumber = Long.toString(generateRandomNumber());
			String number = prefix + randomNumber.substring(prefix.length(), randomNumber.length());
			numbers.add(number);
		}

		return numbers;
	}

	private ArrayList<String> grepArrayFromArray(String pattern, ArrayList<String> array) {
		assertNotNull(pattern);
		assertNotNull(array);

		ArrayList<String> matches = new ArrayList<String>();
		
		for (String string : array) {
			if (string.matches(pattern)) {
				matches.add(string);
			}
		}

		return matches;
	}

	private void doActuallyTest(String pattern, String prefixes[]) {
		assertNotNull(pattern);
		assertNotNull(prefixes);

		ArrayList<String> numbers = generateRandomValidNumbers(prefixes);

		assertNotNull(numbers.get(0));

		for (String number : numbers) {
			assertTrue(number.matches(pattern));
		}
	}

	private void doActuallyTest(String pattern, String subPattern, String prefixes[]) {
		assertNotNull(pattern);
		assertNotNull(subPattern);
		assertNotNull(prefixes);

		ArrayList<String> numbers = generateRandomValidNumbers(prefixes);

		assertNotNull(numbers.get(0));

		ArrayList<String> matchSubPatternNumbers = grepArrayFromArray(subPattern, numbers);

		assertNotNull(matchSubPatternNumbers.get(0));

		numbers.removeAll(matchSubPatternNumbers);

		assertNotNull(numbers.get(0));

		for (String number : numbers) {
			assertTrue(number.matches(pattern));
		}
	}

	@Test
	public void testMatchAll() {
		doActuallyTest("^(?=\\d{11}$)^1(?:3\\d|4[57]|5[^4\\D]|7[^249\\D]|8\\d)\\d{8}$", this.allPrefixes);
	}

	@Test
	public void testOnlyChinaMobile() {
		doActuallyTest("^(?=\\d{11}$)^1((?:3(?!49)[4-9\\D]|47|5[012789]|7[8]|8[23478])\\d{8}$|70[356]\\d{7}$)",
					   this.chinaMobilePrefixes);
	}

	@Test
	public void testOnlyChinaUnicom() {
		doActuallyTest("^(?=\\d{11}$)^1((?:3[0-2]|45|5[56]|7[156]|8[56])\\d{8}$|70[4789]\\d{7}$)",
					   this.chinaUnicomPrefixes);
	}

	@Test
	public void testOnlyChinaTelecom() {
		doActuallyTest("^(?=\\d{11}$)^1(?:(?:33|49|53|7[37]|8[019])\\d{8}$|(?:349|70[0-2])\\d{7}$)",
					   this.chinaTelecomPrefixes);
	}

	@Test
	public void testExceptMVNOPhoneNumbers() {
		doActuallyTest("^(?=\\d{11}$)^1(?:3\\d|4[57]|5[^4\\D]|7[^01249\\D]|8\\d)\\d{8}$",
					   "^(170|171)\\w+",
					   this.allPrefixes);
	}

	@Test
	public void testExceptSatellitePhoneNumbers() {
		doActuallyTest("^(?=\\d{11}$)^1(?:3(?!49)\\d|4[57]|5[^4\\D]|7[^249\\D]|8\\d)\\d{8}$",
					   "^1349\\w+",
					   this.allPrefixes);
	}

	@Test
	public void testExceptDataOnlyPhoneNumbers() {
		doActuallyTest("^(?=\\d{11}$)^1(?:3\\d|5[^4\\D]|7[^249\\D]|8\\d)\\d{8}$",
					   "^(145|147)\\w+",
					   this.allPrefixes);
	}
}