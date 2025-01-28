import com.mongodb.*;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.*;


public class test1 {
      public static void main(String[] args) {
    	  Scanner in = new Scanner(System.in);
    	  int ch;
    	try {
    		MongoClient mongo = new MongoClient("localhost", 27017);
			DB db = mongo.getDB("demo");
    		DBCollection coll = db.createCollection("Student", null);
    		System.out.println("Connection establish....");
    		
    		do {
    			System.out.println("\n1. Insert");
    			System.out.println("2. Display");
    			System.out.println("3. Delete");
    			System.out.println("4. Update");
    			System.out.println("5. PDF");
    			System.out.println("6. Exit");
    			
    			System.out.print("Enter your choice :");
    			ch = in.nextInt();
    			switch(ch) {
    			case 1:
    				System.out.println("\nEnter ID, Name, Branch, Percentage :");
    				int ID = in.nextInt();
    				String name = in.next();
    				String branch = in.next();
    				int Percent = in.nextInt();
    				
    				BasicDBObject d1 = new BasicDBObject("ID",ID).append("Name", name).append("Branch",branch).append("Percent",Percent);
    				coll.insert(d1);
    				System.out.println(d1);
    				
    				System.out.println("Done");
    				break;
    				
    			case 2:
    				DBCursor cur = coll.find();
    				while(cur.hasNext()) {
    					BasicDBObject document = (BasicDBObject) cur.next();
    					int id = document.getInt("ID");
    	                String n = document.getString("Name");
    	                String b = document.getString("Branch");
    	                int p = document.getInt("Percent");
    	                System.out.println(id+"\t"+"\t" + n + "\t" + b+"\t"+p);
    				}
    				break;
    				
    			case 3:
    				System.out.println("\nEnter ID to delete :");
    				int id_remove = in.nextInt();
    				BasicDBObject delete = new BasicDBObject("ID",id_remove);
    				coll.remove(delete);
    				
    				System.out.println("Done");
    				break;
    				
    			case 4:
    				System.out.println("\n1. Change Name");	
					System.out.println("2. Change Percentage");	
					System.out.println("3. Change Branch");	
					System.out.print("your choice :");	
					int s = in.nextInt();
					
					switch(s) {
					case 1:
						System.out.println("\n Enter ID and Name");
						int id1 = in.nextInt();
						String name1 = in.next();
						
						BasicDBObject nem_change = new BasicDBObject("$set",new BasicDBObject().append("Name", name1));			
			    		BasicDBObject searchQuery = new BasicDBObject().append("ID",id1);
			    		coll.update(searchQuery, nem_change);
						
			    		System.out.println("Done");
						break;
						
					case 2:
						System.out.println("\n Enter ID and percentage");
						int id2 = in.nextInt();
						int perc = in.nextInt();
						
						BasicDBObject nem_change1 = new BasicDBObject("$set",new BasicDBObject().append("Percentage", perc));			
			    		BasicDBObject searchQuery1 = new BasicDBObject().append("ID",id2);
			    		coll.update(searchQuery1, nem_change1);
						
			    		System.out.println("Done");
						break;
						
					case 3:
						System.out.println("\n Enter ID and Branch");
						int id3 = in.nextInt();
						String branch1 = in.next();
						
						BasicDBObject nem_change2 = new BasicDBObject("$set",new BasicDBObject().append("Branch", branch1));			
			    		BasicDBObject searchQuery2 = new BasicDBObject().append("ID",id3);
			    		coll.update(searchQuery2, nem_change2);
						
			    		System.out.println("Done");
						break;
					}
    			case 5:
    				BufferedWriter bw = new BufferedWriter(new FileWriter("op.txt"));
    				DBCursor cur1 = coll.find();
    				while(cur1.hasNext()) {
    					BasicDBObject document = (BasicDBObject) cur1.next();
    					int id = document.getInt("ID");
    	                String n = document.getString("Name");
    	                String b = document.getString("Branch");
    	                int p = document.getInt("Percent");
    	                bw.write(id+"\t"+"\t" + n + "\t" + b+"\t"+p+"\n");
    				}
					bw.close();
					
					System.out.println("Done");
					break;
    				
    			case 6:
    				break;
    			default:
    				System.out.println("Invalid Entry");
    			}
    		}while(ch != 6);
    		System.out.println("Exit");
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
  }
}
