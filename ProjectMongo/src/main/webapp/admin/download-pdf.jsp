<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Zoro.to</title>
    <link rel="icon" href="https://icons.iconarchive.com/icons/crountch/one-piece-jolly-roger/256/Zoro-icon.png" type="image/x-icon">
    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="../new.html">
                <img src="https://icons.iconarchive.com/icons/crountch/one-piece-jolly-roger/256/Zoro-icon.png" alt="" class="d-inline-block align-text-top">
                Zoro.to
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="insert.html">Insert</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="display.jsp">Display</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="delete.html">Delete</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="update.html">Update</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container center-content">
        <h1 class="mb-4">Export Data to File</h1>
        <%@ page import="com.mongodb.*" %>
        <%@ page import="java.io.*" %>
        <%@ page import="java.util.*" %>
        <%
        String ID, Name, Branch, bloodgrp, DOB, par_number, self_number, Year, email, Address, city, state, pincode;
		
        try {
            String userHome = System.getProperty("user.home");
            BufferedWriter bw = new BufferedWriter(new FileWriter(userHome + "/Downloads/op.txt"));
			
            MongoClient mongo = new MongoClient("localhost", 27017);
            DB db = mongo.getDB("demo");
            DBCollection coll = db.createCollection("info", null);
			
            bw.write("-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n");
            bw.write("ID"+"\t"+"Name"+"\t\t"+"Date Of Birth"+"\t"+"Branch"+"\t\t\t"+"Blood group"+"\t"+"Parent number"+"\t"+"Self number"+"\t"+"Year"+"\t"+"Email"+"\t\t\t\t"+"Address"+"\t\t"+"City"+"\t\t"+"State"+"\t\t"+"Pincode"+"\n");
			bw.write("-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n");
            DBCursor cur = coll.find();
            
            int count = 0;
            while(cur.hasNext()) {
                BasicDBObject document = (BasicDBObject) cur.next();
                ID = document.getString("ID");
                Name = document.getString("Name");
                Branch = document.getString("Branch");
                bloodgrp = document.getString("Bloodgrp");
                DOB = document.getString("DOB");
                par_number = document.getString("parent_number");
                self_number = document.getString("self_number");
                Year = document.getString("Year");
                email = document.getString("email");
                Address = document.getString("Address");
                city = document.getString("city");
                state = document.getString("state");
                pincode = document.getString("pincode");

                bw.write(ID +"\t" + Name +"\t"+ DOB +"\t"+ Branch +"\t"+ bloodgrp +"\t\t"+ par_number +"\t"+ self_number +"\t"+ Year +"\t"+ email +"\t"+ Address +"\t\t"+ city +"\t\t"+ state +"\t"+ pincode + "\n");
            	count++;
            }
            bw.write("\n-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n\n");
            bw.write("Total Number Of Rows Are :"+count);
            bw.close();
            out.print("<div class='result-message'>Data exported to op.txt successfully.</div>");
        } catch (Exception e) {
            out.print("<div class='result-message text-danger'>An error occurred: " + e.getMessage() + "</div>");
        }
        %>

    </div>

    <!-- Add Bootstrap JS scripts (jQuery and Popper.js are required dependencies) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
