package exercise2;

import java.io.IOException;
import java.io.OutputStream;
import java.util.*;

import exercise.Exercise;

public class Exercise2 extends Exercise {
	private int choiceOfOperation;
	private int choiceOfBase;
	private String left;
	private String right;
	private String result;

	@Override
	public void getInput() {

		Scanner scan = new Scanner(System.in);

		System.out.println("Welcome! Enter 1 for binary calculation 2 for octal calculation and "
				+ "3 for hexadecimal calculation");
		choiceOfBase = scan.nextInt();
		System.out.println("Enter 1-->addition, 2-->subtraction");
		choiceOfOperation = scan.nextInt();
		if (choiceOfOperation != 1 || choiceOfOperation != 2) {
			System.out.println("Wrong choice of operation");
			return;
		}
		System.out.println("Enter two numbers");

		left = scan.next();
		right = scan.next();
		System.out.println(left + " " + right);

	}

	// To execute operation
	@Override
	public void execute() {

		if (choiceOfOperation != 1 || choiceOfOperation != 2) {

			return;
		}
		switch (choiceOfBase) {

		case 1:
			BinaryAdder binAdder = new BinaryAdder();
			if (choiceOfOperation == 1) {
				result = binAdder.add(left, right, 2);
				System.out.println("hi");

			} else {
				result = binAdder.sub(left, right, 2);

			}
			break;
		case 2:
			OctalAdder octAdder = new OctalAdder();
			if (choiceOfOperation == 1) {
				result = octAdder.add(left, right, 8);

			} else {
				result = octAdder.sub(left, right, 8);

			}
			break;
		case 3:
			HexAdder hexAdder = new HexAdder();
			if (choiceOfOperation == 1) {
				result = hexAdder.add(left, right, 16);

			} else {
				result = hexAdder.sub(left, right, 16);

			}
			break;
		default:
			System.out.println("Wrong choice of base");
			return;
		}

	}
	@Override
	public void writeOutput(String... strings) throws IOException {
		String resultingString;
		if (result == null) {
			System.out.println("Wrong entry of base/operation/number");
			System.exit(1);
		} else {
			resultingString = "The result is " + result;

			super.writeOutput(resultingString);
		}
	}
}
