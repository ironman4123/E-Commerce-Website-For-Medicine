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
<%String username = request.getParameter("username");   %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <nav class="navbar navbar-light bg-light">
      <div class="container-fluid">
        <a class="navbar-brand" href="../new.html">
          <img src="https://icons.iconarchive.com/icons/crountch/one-piece-jolly-roger/256/Zoro-icon.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
          Zoro.to
        </a>
      </div>
    </nav>
   
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="student.jsp?username=<%= username %>">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="marks.jsp?username=<%= username %>">Marks</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="attendance.jsp?username=<%= username %>">Attendance</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><span class="navbar-username"><%= request.getParameter("username") %></span></a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<section id="home">
    <div class="container center-content">
       
        <%@ page import="com.mongodb.*" %>
        <%@ page import="java.io.*" %>
        <%@ page import="java.util.*" %>
        <%  
        String ID, Name, Branch, bloodgrp, dob, par_number, self_number, Year, email, Address, city, state, pincode;

        try {
            MongoClient mongo = new MongoClient("localhost", 27017);
            DB db = mongo.getDB("demo");
            DBCollection coll = db.getCollection("info");
                
            DBCursor cur = coll.find();
            while (cur.hasNext()) {
                BasicDBObject document = (BasicDBObject) cur.next();
                ID = document.getString("ID");
                Name = document.getString("Name");
                Branch = document.getString("Branch");
                bloodgrp = document.getString("Bloodgrp");
                dob = document.getString("DOB");
                par_number = document.getString("parent_number");
                self_number = document.getString("self_number");
                Year = document.getString("Year");
                email = document.getString("email");
                Address = document.getString("Address");
                city = document.getString("city");
                state = document.getString("state");
                pincode = document.getString("pincode");

                if (username.equals(ID)) {
        %>      
             
        <div class="info-label info-data">
            <span class="col-md-3">ID:</span>
            <span class="col-md-9"><%= ID %></span>
        </div>
        <div class="info-label info-data">
            <span class="col-md-3">Name:</span>
            <span class="col-md-9"><%= Name %></span>
        </div>
        <div class="info-label info-data">
            <span class="col-md-3">Branch:</span>
            <span class="col-md-9"><%= Branch %></span>
        </div>
        <div class="info-label info-data">
            <span class="col-md-3">Blood Group:</span>
            <span class="col-md-9"><%= bloodgrp %></span>
        </div>
        <div class="info-label info-data">
            <span class="col-md-3">Date Of Birth:</span>
            <span class="col-md-9"><%= dob %></span>
        </div>
        <div class="info-label info-data">
            <span class="col-md-3">Parent Phone Number:</span>
            <span class="col-md-9"><%= par_number %></span>
        </div>
        <div class="info-label info-data">
            <span class="col-md-3">Self Phone Number:</span>
            <span class="col-md-9"><%= self_number %></span>
        </div>
        <div class="info-label info-data">
            <span class="col-md-3">Year:</span>
            <span class="col-md-9"><%= Year %></span>
        </div>
        <div class="info-label info-data">
            <span class="col-md-3">Email:</span>
            <span class="col-md-9"><%= email %></span>
        </div>
        <div class="info-label info-data">
            <span class="col-md-3">Address:</span>
            <span class="col-md-9"><%= Address %></span>
        </div>
        <div class="info-label info-data">
            <span class="col-md-3">City:</span>
            <span class="col-md-9"><%= city %></span>
        </div>
        <div class="info-label info-data">
            <span class="col-md-3">State:</span>
            <span class="col-md-9"><%= state %></span>
        </div>
        <div class="info-label info-data">
            <span class="col-md-3">Pincode:</span>
            <span class="col-md-9"><%= pincode %></span>
        </div>
        <!-- Add similar rows for other fields like InstituteName, par_number, etc. -->
        <%   
                    break; // Exit the loop when the username is found
                }
            }
        } catch (Exception e) {
            out.print("<div class='output-message text-danger'>An error occurred: " + e.getMessage() + "</div>");
        }
        %>
    </div>
</section>
    <!-- Add Bootstrap JS scripts (jQuery and Popper.js are required dependencies) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
