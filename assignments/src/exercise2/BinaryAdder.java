package exercise2;

public class BinaryAdder extends Adder {

	// To add binary numbers
	public String add(String left, String right, int base) {

		String result = super.add(left, right, 2);

		String value = Integer.toBinaryString(Integer.valueOf(result));

		return (value);
	}

	// To subtract binary numbers
	public String sub(String left, String right, int base) {

		String result = super.sub(left, right, 2);

		String value = Integer.toBinaryString(Integer.valueOf(result));

		return (value);

	}
}
