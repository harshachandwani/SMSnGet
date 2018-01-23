package smsnget;

import java.util.StringTokenizer;

public class SMS {
	public static void main(String args[])
	{
		
		StringTokenizer st = new StringTokenizer(args[2]);
		
		String result = ""; //Final result
		String keyword; //First message token 
		
	
		if(st.countTokens() > 1)
		{
			//Message should contain atleast 2 tokens
			keyword = st.nextToken();
			
			//If keyword is PMT, search for buses
			if((keyword.compareTo("PMT") == 0) && (st.countTokens() == 2))
			{
				DatabaseHandler obj = new DatabaseHandler();
				obj.getConnection();
	
				//String Tokenizing over spaces
				String src = st.nextToken();
				String dst = st.nextToken();
				result = obj.busexecute(src, dst);
			}
			
			//If keyword is ADDR, search for place
			else if((keyword.compareTo("ADDR") == 0) && (st.countTokens() == 1))
			{
				DatabaseHandler obj = new DatabaseHandler();
				obj.getConnection();
				
				String name = st.nextToken();
				result = obj.collexecute(name);
			}
			
			//Message not in format
			else
				result = "Bad input";
		}
		//Bad Message
		else
			result = "Bad input";
		
		//Formatted result
		System.out.println("{SMS:TEXT:FORMATTED}{Idea}{" + args[0] + "}{" + args[1] + "}{" + result + "}");
	}
}
