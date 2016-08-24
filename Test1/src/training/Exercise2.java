package training;


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


	class Adder{
		
		//To add the numbers
		public String add(String left,String right, int base){
			
			try{
				//To check if it is of proper base value
				int value1=Integer.parseInt(left,base);
				int value2=Integer.parseInt(right,base);
				Integer result=value1+value2;
				return result.toString();
			}
			catch(Exception e){
				System.out.println("Enter proper numbers according to the base");
			}
			return null;
		}
		
		//To subtract the numbers
		public String sub(String left,String right, int base){
			
			try{
				//To check if it is of proper base value
					int value1=Integer.parseInt(left,base);
					int value2=Integer.parseInt(right,base);
					
					Integer result=value1-value2;
					
					return result.toString();
					
			}
			catch(Exception e){
				System.out.println("Enter proper numbers according to the base");
			}
			
			return null;
		}
	}


	class BinaryAdder extends Adder{
		
		//To add binary numbers
		public String add(String left,String right,int base){
			
			String result=super.add(left,right,2);
			
			String value=Integer.toBinaryString(Integer.valueOf(result));
			
			return(value);
		}
		
		//To subtract binary numbers
		public String sub(String left,String right,int base){

			String result=super.sub(left,right,2);
			
			String value=Integer.toBinaryString(Integer.valueOf(result));
			
			return(value);
		
		}
	}
	class OctalAdder extends Adder{
		
		//To add octal numbers
		public String add(String left,String right,int base){

			String result=super.add(left,right,8);
			
			String value=Integer.toOctalString(Integer.valueOf(result));
			
			return(value);
		
		}
		//To subtract octal numbers
		public String subOctalNumbers(String left,String right,int base){

			String result=super.sub(left,right,8);
			
			String value=Integer.toBinaryString(Integer.valueOf(result));
			
			return(value);
		}
	}


	class HexAdder extends Adder{
		
		//To add hexadecimal numbers
		public String add(String left,String right,int base){
			

			String result=super.add(left,right,16);
			
			String value=Integer.toHexString(Integer.valueOf(result));
			
			return(value);
		
		}
		
		//To subtract hexadecimal numbers
		public String sub(String left,String right,int index){
			

			String result=super.sub(left,right,16);
			
			String value=Integer.toHexString(Integer.valueOf(result));
			
			return(value);
		}
	}

