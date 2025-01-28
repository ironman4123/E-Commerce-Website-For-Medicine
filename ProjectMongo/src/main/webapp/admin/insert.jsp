<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
              <a class="nav-link" href="MA/marks.html">Marks</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="MA/attendance.html">Attendance</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="container center-content">
        <%@ page import="com.mongodb.*" %>
        <%
            String ID = request.getParameter("ID");
            String password = request.getParameter("password");
            String Name = request.getParameter("Name");
            String Branch = request.getParameter("Branch");
            String bloodgrp = request.getParameter("bloodgrp");
            String dob = request.getParameter("dob");
            String par_number = request.getParameter("par_number");
            String self_number = request.getParameter("self_number");
            String Year = request.getParameter("Year");
            String email = request.getParameter("email");
            String Address = request.getParameter("Address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String pincode = request.getParameter("pincode");

            try {
                MongoClient mongo = new MongoClient("localhost", 27017);
                DB db = mongo.getDB("demo");

                DBCollection coll1 = db.createCollection("login", null); // Create the "login" collection

                BasicDBObject d2 = new BasicDBObject("ID", ID).append("Password", password);
                coll1.insert(d2); // Insert into the "login" collection

                DBCollection coll2 = db.createCollection("info", null); // Create the "info" collection

                BasicDBObject d3 = new BasicDBObject("ID", ID)
                        .append("Name", Name)
                        .append("Branch",Branch)
                        .append("Bloodgrp",bloodgrp )
                        .append("DOB", dob)
                        .append("parent_number", par_number)
                        .append("self_number",self_number )
                        .append("Year", Year)
                        .append("email",email )
                        .append("Address", Address)
                        .append("city", city)
                        .append("state", state)
                        .append("pincode",pincode )             
                        ;
                coll2.insert(d3); // Insert into the "info" collection

        %>
        <p class="result-message">Done - Data has been inserted for <%= Name %> with ID <%= ID %>.</p>
        <%
            } catch (Exception e) {
        %>
        <p class="result-message">Error - <%= e.getMessage() %></p>
        <%
            }
        %>
    </div>

    <!-- Add Bootstrap JS scripts (jQuery and Popper.js are required dependencies) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
