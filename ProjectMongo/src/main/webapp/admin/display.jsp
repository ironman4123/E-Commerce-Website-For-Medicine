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
        <h1 class="mb-4">Welcome to Zoro.to</h1>
        <div class="table-responsive">
           <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Date Of Birth</th>
                        <th>Branch</th>
                        <th>Blood group</th>
                        <th>Parent number</th>
                        <th>Self number</th>
                        <th>Year</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>City</th>
                        <th>State</th>
                        <th>Pincode</th>
                    </tr>
                </thead>
                <tbody>
                    <%@ page import="com.mongodb.*" %>
                    <%
                        String ID, Name, Branch, bloodgrp, DOB, par_number, self_number, Year, email, Address, city, state, pincode;
                        try {
                            MongoClient mongo = new MongoClient("localhost", 27017);
                            DB db = mongo.getDB("demo");
                            DBCollection coll = db.createCollection("info", null);

                            DBCursor cur = coll.find();
                            while (cur.hasNext()) {
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
                    %>
                    <tr>
                        <td><%= ID %></td>
                        <td><%= Name %></td>
                        <td><%= DOB %></td>
                        <td><%= Branch %></td>
                        <td><%= bloodgrp %></td>
                        <td><%= par_number %></td>
                        <td><%= self_number %></td>
                        <td><%= Year %></td>
                        <td><%= email %></td>
                        <td><%= Address %></td>
                        <td><%= city %></td>
                        <td><%= state %></td>
                        <td><%= pincode %></td>
                    </tr>
                    <%
                        }
                    } catch (Exception e) {
                        out.print(e);
                    }
                    %>
                </tbody>
            </table>
        </div>
        <a href="download-pdf.jsp" class="btn btn-primary">Download PDF</a>
    </div>

    <!-- Add Bootstrap JS scripts (jQuery and Popper.js are required dependencies) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
