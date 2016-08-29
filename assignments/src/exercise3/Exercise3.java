package exercise3;

import java.io.File;
import java.io.IOException;
import java.util.Scanner;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import exercise.Exercise;

public class Exercise3 extends Exercise {
	private int numberOfExecutions;
	private String source;
	private String destination;
	private String resultFile;

	@Override
	public void getInput() {

		Scanner scan = new Scanner(System.in);

		System.out.println("Enter the number of times copy function should execute");
		numberOfExecutions = scan.nextInt();
		if (numberOfExecutions >= 10) {
			System.out.println("Please specify a value below 10");
			return;
		}

	}

	@Override
	public void execute() {
		for (int i = 0; i < numberOfExecutions; i++) {

			getFileNames();

			Runnable fileFunction = new FileFunctionality(source, destination, resultFile);
			Thread t = new Thread(fileFunction);
			t.start();

		}
	}

	@Override
	public void writeOutput(String... args) throws IOException {
		super.writeOutput("Files copied successfully");

	}

	// To get names of source, destination folders including resulting file
	// where details of copying are stored
	public void getFileNames() {

		Scanner scan = new Scanner(System.in);
		System.out.println("Enter the source folder");
		source = scan.nextLine();

		// to input destination folder
		System.out.println("Enter destination folder");
		destination = scan.nextLine();

		System.out.println("Enter the file to store the details of copying");
		resultFile = scan.nextLine();

	}
}
