package exercise;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.Scanner;

import exercise1.*;
import exercise2.*;
import exercise3.*;

public class Exercise {
	
public void getInput(){
	
}

public void execute(){
	
}

public void writeOutput(String... strings) throws IOException{
	
	Scanner scan=new Scanner(System.in);
	PrintStream printer=new PrintStream(System.out);
	String path;
	
	System.out.println("Do you want the output generated to be displayed in file?(1/0)");
	int outputToFile=scan.nextInt();
	
	if(outputToFile==1){
		System.out.println("Enter the file where result should be placed");
		path=scan.next();
		File file=new File(path);
		OutputStream stream=new FileOutputStream(path);
		printer=new PrintStream(stream);
		
	}
	
	
	for(String s:strings){
		printer.println(s);
	}
}
}