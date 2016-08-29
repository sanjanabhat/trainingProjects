package exercise2;

public class Adder {

	// To add the numbers
	public String add(String left, String right, int base) {

		try {
			// To check if it is of proper base value
			int value1 = Integer.parseInt(left, base);
			int value2 = Integer.parseInt(right, base);
			Integer result = value1 + value2;
			return result.toString();
		} catch (Exception e) {
			System.out.println("Enter proper numbers according to the base");
		}
		return null;
	}

	// To subtract the numbers
	public String sub(String left, String right, int base) {

		try {
			// To check if it is of proper base value
			int value1 = Integer.parseInt(left, base);
			int value2 = Integer.parseInt(right, base);

			Integer result = value1 - value2;

			return result.toString();

		} catch (Exception e) {
			System.out.println("Enter proper numbers according to the base");
		}

		return null;
	}
}
