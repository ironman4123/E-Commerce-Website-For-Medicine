import java.sql.*;
import java.util.*;
import java.io.*;
class connect{
	public static void main(String args[]) throws IOException
	{
		Scanner in = new Scanner(System.in);
		
		int ch;
	  try{
		System.out.println("welcome....\n\n");
		//Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root",""); 
		Statement stmt = con.createStatement();
		System.out.println("Connection is established\n\n");
		
		do {
			System.out.println("\n1. Insert");
			System.out.println("2. Display");
			System.out.println("3. Delete");
			System.out.println("4. Update");
			System.out.println("5. PDF");
			System.out.println("6. Exit\n");
			
			
			System.out.print("Enter Your Choice :");
			ch = in.nextInt();
			
			System.out.println("\n");
			
			switch(ch) {
				case 1:
					System.out.println("Enter Roll no , Name, Branch, Percentage: ");
					int rollno = in.nextInt();
					String name = in.next();
					String branch = in.next();
					int per = in.nextInt();
					
					//System.out.println("insert into stud values('"+rollno+"','"+name+"','"+branch+"','"+per+"');");
					String sql = "insert into stud values('"+rollno+"','"+name+"','"+branch+"','"+per+"');";
					stmt.executeUpdate(sql);
					
					System.out.println("Inserted Successfuly.....");
			
					break;
				
				case 2:
					ResultSet rs = stmt.executeQuery("Select * from stud");
					
					while(rs.next())	
					{
						System.out.println(rs.getInt(1)+"\t"+rs.getString(2)+"\t"+rs.getString(3)+"\t"+rs.getInt(4));
					}
					break;
					
				case 3:
					System.out.println("Enter Roll no to be delete :");
					int roll_no = in.nextInt();
					
					String sql1 = "DELETE FROM stud WHERE Rollno ='"+roll_no+"';";
					stmt.executeUpdate(sql1);
					System.out.println("Deleteded Successfuly.....");
					break;
					
				case 4:
					System.out.println("\n1. Change Name");	
					System.out.println("2. Change Percentage");	
					System.out.println("3. Change Branch");	
					System.out.print("your choice :");	
					int s = in.nextInt();
					
					switch(s) {
					case 1:
						System.out.println("\n Enter roll no. and Name");
						int roll1 = in.nextInt();
						String name1 = in.next();
						
						String sql2 = "UPDATE stud SET Name = '"+name1+"' WHERE Rollno = '"+roll1+"';";
						stmt.executeUpdate(sql2);
						
						break;
						
					case 2:
						System.out.println("\n Enter roll no. and percentage");
						int roll2 = in.nextInt();
						int perc = in.nextInt();
						
						String sql3 = "UPDATE stud SET Percent = '"+perc+"' WHERE Rollno = '"+roll2+"';";
						stmt.executeUpdate(sql3);
						
						break;
						
					case 3:
						System.out.println("\n Enter roll no. and Branch");
						int roll3 = in.nextInt();
						String branch1 = in.next();
						
						String sql4 = "UPDATE stud SET Branch = '"+branch1+"' WHERE Rollno = '"+roll3+"';";
						stmt.executeUpdate(sql4);
						
						break;
					}
			
				case 5:
					ResultSet rs1 = stmt.executeQuery("Select * from stud");
					BufferedWriter bw = new BufferedWriter(new FileWriter("op.txt"));
					while(rs1.next())	
					{
						bw.write(rs1.getInt(1)+"\t"+rs1.getString(2)+"\t"+rs1.getString(3)+"\t"+rs1.getInt(4)+"\n");
					}
					bw.close();
					break;
					
				case 6:
					break;
					
				default:
					System.out.println("Invalid entry....");
					
					
			}
	  	}while(ch != 6);
		System.out.println("................Exit............");
		con.close();
		
		}catch(Exception e)
		{
			  	e.printStackTrace();
			  	//System.out.println(e.getMessage());
		}
	}
}