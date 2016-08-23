package TrainingProject;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class Operations {
	
public static void main(String[] args) throws IOException{
	
	Scanner scan =new Scanner(System.in);
	
	//To enter from console or file 
	int choice;
	
	while(true){
		
		System.out.println("Press 1 to enter from console, 2 to take file as input and 3 to exit");
		choice = scan.nextInt();
		
		switch(choice){
		
			case 1: System.out.print("Enter the string to be tested");
					String str;
					BufferedReader input=new BufferedReader(new InputStreamReader(System.in));
					str=input.readLine();
					retainLetters(str);
					break;
	
			case 2:	System.out.println("Enter the file to be tested");
					String path=scan.next();
					try {
						readFromFile(path);
					} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
						//e.printStackTrace();
						System.out.println("Wrong file entered");
					}
					break;
			
			case 3: System.out.println("You have chosen to exit. See you next time!!");
					return;
	
			default: System.out.println("Wrong choice");
	
		}
	
	}
}
	
public static void retainLetters(String str){
	//To create a mutable string.
	StringBuilder mutablestr=new StringBuilder(str);
	
	//counter to move around the string
	int i=0; 
	
	while(i<mutablestr.length()){
		
		//checks if a character in a string is letter or not and deletes it 
		if(!Character.isLetter(mutablestr.charAt(i))&&!Character.isSpaceChar(mutablestr.charAt(i))){
			mutablestr.deleteCharAt(i);
			i--;
		}
		else {
			i++;
		}
	}
	
	System.out.println(mutablestr);
	
}

public static void readFromFile(String path) throws FileNotFoundException{
	
	BufferedReader textReader=new BufferedReader(new FileReader(path));
	
	try {
		String singleString;
		
		while((singleString=textReader.readLine())!=null){
			retainLetters(singleString);
		}
	} catch (IOException e) {
		// TODO Auto-generated catch block
		//e.printStackTrace();
	
		System.out.println("Wrong file entered");
		
		}
}
}
