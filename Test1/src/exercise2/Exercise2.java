package exercise2;

import java.util.*;



public class Exercise2 {
	public static void main(String[] args){
		
		Scanner scan=new Scanner(System.in);
		
		//To choose the base value
		int choice;
		
		System.out.println("Welcome! Enter 1 for binary calculation 2 for octal calculation and "
				+ "3 for hexadecimal calculation");
		choice=scan.nextInt();
		switch(choice){
		case 1: chooseOperation(2);
				break;
		case 2:chooseOperation(8);
				break;
		case 3:chooseOperation(16);
				break;
		default:System.out.println("Wrong choice");
				return;
		}
	}
	
	//To choose addition or subtraction
	public static void chooseOperation(int base){
		
		Scanner scan=new Scanner(System.in);
		
		System.out.println("Enter 1 for addition and 2 for subtraction");
		
		int choiceOfOperation;
		choiceOfOperation = scan.nextInt();
		
		switch(choiceOfOperation){
			
		case 1: executeOperation(base,1);
				break;
				
		case 2:executeOperation(base,2);
				break;
				
		default:System.out.println("Wrong choice of operation");
				return;
		}
	}
	
	//To execute the operation and print result.
	public static void executeOperation(int base, int choice){
		
		Scanner scan=new Scanner(System.in);
		
		String result=null;
		String left;
		String right;
		
		System.out.println("Enter two numbers");
		
		left=scan.next();
		right=scan.next();
		if(base==2||base==8){
			try{
				Integer.parseInt(left);
				Integer.parseInt(right);
			}
			catch(Exception e){
				System.out.println("Terminated due to wrong number entry");
				return;
			}
		}
		
		switch(base){
		
		case 2: BinaryAdder binAdder=new BinaryAdder();
				if(choice==1){
					result=binAdder.add(left, right,2);
					
				}
				else {
					result=binAdder.sub(left, right,2);
					
				}
				break;
		case 8: OctalAdder octAdder=new OctalAdder();
				if(choice==1){
					result=octAdder.add(left, right,8);
					
				}
				else {
					result=octAdder.sub(left, right,8);
					
				}
				break;
		case 16: HexAdder hexAdder=new HexAdder();
				if(choice==1){
					result=hexAdder.add(left, right,16);
					
				}
				else {
					result=hexAdder.sub(left, right,16);
					
				}
				break;
		}
		if(result==null){
			System.out.println("Wrong number entry");
		}
		System.out.println("The result is "+result );
	}
	
}



