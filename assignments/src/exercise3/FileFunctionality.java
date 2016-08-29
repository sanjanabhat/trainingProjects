package exercise3;

import java.io.File;

import java.io.*;
import java.util.*;
import exercise.Exercise;

public class FileFunctionality extends Exercise implements Runnable {
	private static Map<String, Integer> fileNames;
	private String source;
	private String destination;
	private String resultFile;

	FileFunctionality() {
	}

	FileFunctionality(String source, String destination, String resultFile) {
		this.source = source;
		this.destination = destination;
		this.resultFile = resultFile;
	}

	public void run() {

		File sourceFile = new File(source);

		File destinationFile = new File(destination);

		try {
			copyFolder(sourceFile, destinationFile);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		fileNames = new TreeMap<>();
		getNames(destinationFile);
		try {
			putContents();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// copy the contents of folder
	public static void copyFolder(File src, File dest) throws IOException {

		if (src.isDirectory()) {

			// if directory not exists, create it
			if (!dest.exists()) {
				dest.mkdir();

			}

			// list all the directory contents
			String files[] = src.list();

			for (String file : files) {

				File srcFile = new File(src, file);
				File destFile = new File(dest, file);

				copyFolder(srcFile, destFile);
			}

		} else {

			// if file, then copy it
			InputStream in = new FileInputStream(src.toString());
			OutputStream out = new FileOutputStream(dest.toString());
			byte[] buf = new byte[1024];
			int len;
			while ((len = in.read(buf)) > 0) {
				out.write(buf, 0, len);
			}
			in.close();
			out.close();
		}
	}

	// get the names of files
	public static void getNames(File dest) {
		if (dest.isDirectory()) {

			fileNames.put(dest.getName(), (int) dest.length());
			String fileList[] = dest.list();

			for (String file : fileList) {
				File destFile = new File(dest, file);
				getNames(destFile);

			}
		} else {
			fileNames.put(dest.getName(), (int) dest.length());
		}

	}

	// put the contents into file
	public void putContents() throws IOException {
		OutputStream stream = new FileOutputStream(resultFile);
		PrintStream printer = new PrintStream(stream);
		printer.println("File Details");
		printer.println("-----------------------------");

		for (Map.Entry<String, Integer> name : fileNames.entrySet()) {
			printer.println(name.getKey() + "      " + name.getValue());
		}

	}
}
