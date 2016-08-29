package exercise;

import java.io.IOException;
import java.util.*;

import exercise1.*;
import exercise2.*;
import exercise3.*;

public class Access {
	
public static void main(String[] args) throws IOException{
		
	Exercise exercise=null;
	Scanner scan=new Scanner(System.in);
		
	System.out.println("Please choose which program do you want to execute");
	System.out.println("Press 1 ---> Removal of alphabets from string "
				+ "2--->Calculations using binary,octal and hexadecimal adders "
				+ "3---> File copy operation");
		
	int choiceOfProgram=scan.nextInt();
	
	switch(choiceOfProgram){
	case 1:exercise=new Exercise1();
			break;
				
	case 2:exercise=new Exercise2();
			break;
				
	case 3:exercise=new Exercise3();
			break;
				
	default:System.out.println("Wrong choice of program");
		}
	
	final Exercise finalTask=exercise;
	Thread thread=new Thread(new Runnable(){
	public void run(){
		if(finalTask!=null){
			finalTask.getInput();
			finalTask.execute();
			try {
				finalTask.writeOutput(null);
			} catch (IOException e) {
			// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	});
	thread.start();
		
	}
}
