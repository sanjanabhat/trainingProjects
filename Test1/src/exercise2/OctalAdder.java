package exercise2;


	public class OctalAdder extends Adder{
		
		//To add octal numbers
		public String add(String left,String right,int base){

			String result=super.add(left,right,8);
			
			String value=Integer.toOctalString(Integer.valueOf(result));
			
			return(value);
		
		}
		//To subtract octal numbers
		public String sub(String left,String right,int base){

			String result=super.sub(left,right,8);
			
			String value=Integer.toOctalString(Integer.valueOf(result));
			
			return(value);
		}
	}


