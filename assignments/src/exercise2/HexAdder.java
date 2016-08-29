package exercise2;

public class HexAdder extends Adder {

	// To add hexadecimal numbers
	public String add(String left, String right, int base) {

		String result = super.add(left, right, 16);

		String value = Integer.toHexString(Integer.valueOf(result));

		return (value);

	}

	// To subtract hexadecimal numbers
	public String sub(String left, String right, int index) {

		String result = super.sub(left, right, 16);

		String value = Integer.toHexString(Integer.valueOf(result));

		return (value);
	}

}
