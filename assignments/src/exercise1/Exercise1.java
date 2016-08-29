package exercise1;

import java.io.*;
import java.util.*;
import exercise.Exercise;

public class Exercise1 extends Exercise {

	private String inputString;
	private String inputFile;
	private ArrayList<String> outputString = new ArrayList<>();
	private ArrayList<Integer> countOfNonAlphabets = new ArrayList<>();
	private String path;

	@Override
	public void getInput() {

		Scanner scan = new Scanner(System.in);

		// To enter from console or file
		int choice;

		System.out.println("Press 1 to enter from console, 2 to take file as input ");
		choice = scan.nextInt();

		switch (choice) {

		case 1:
			System.out.print("Enter the string to be tested");
			BufferedReader input = new BufferedReader(new InputStreamReader(System.in));
			try {
				inputString = input.readLine();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;

		case 2:
			System.out.println("Enter the file to be tested");
			inputFile = scan.next();
			File file = new File(inputFile);
			if (!(file.isFile())) {
				System.out.println("Wrong file entered");
				return;
			}
			break;

		default:
			System.out.println("Wrong choice");
		}
	}

	@Override
	public void execute() {

		if (inputFile != null) {
			try {
				readFromFile();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (inputString != null) {
			retainLetters(inputString);

		} else {
			System.out.println("Some error on your side please rectify");
		}
	}

	public void retainLetters(String str) {

		// To create a mutable string.
		StringBuilder mutablestr = new StringBuilder(str);

		// counter to move around the string
		int i = 0;
		int count = 0;
		while (i < mutablestr.length()) {

			// checks if a character in a string is letter or not and deletes it
			if (!Character.isLetter(mutablestr.charAt(i)) && !Character.isSpaceChar(mutablestr.charAt(i))) {
				count += 1;
				mutablestr.deleteCharAt(i);

			} else {
				i++;
			}
		}
		outputString.add(mutablestr.toString());
		countOfNonAlphabets.add(count);

	}

	public void readFromFile() throws FileNotFoundException {

		BufferedReader textReader = new BufferedReader(new FileReader(inputFile));

		try {
			String singleString;
			if ((singleString = textReader.readLine()) == null) {
				System.out.println("Empty file");
			} else {

				retainLetters(singleString);
			}
			while ((singleString = textReader.readLine()) != null) {

				retainLetters(singleString);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();

			System.out.println("Wrong file entered");

		}
	}
	@Override
	public void writeOutput(String... values) throws IOException {
		ArrayList<String> result = new ArrayList<>();

		for (int i = 0; i < countOfNonAlphabets.size(); i++) {
			result.add("The resulting String is " + outputString.get(i) + "The number of characters "
					+ "other than alphabets " + countOfNonAlphabets.get(i));
		}
		String[] resultingString = result.toArray(new String[0]);
		super.writeOutput(resultingString);
	}
}
