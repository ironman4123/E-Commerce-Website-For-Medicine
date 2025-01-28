<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zoro.to</title>
<link rel="icon" href="https://icons.iconarchive.com/icons/crountch/one-piece-jolly-roger/256/Zoro-icon.png" type="image/x-icon">
<!-- Add Bootstrap CSS link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/style.css">

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="../../login.html">
                <img src="https://icons.iconarchive.com/icons/crountch/one-piece-jolly-roger/256/Zoro-icon.png"
                    alt="" class="d-inline-block align-text-top">
                Zoro.to
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../index.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="marks.html">Marks</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="attendance.html">Attendance</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container center-content">
    	<%@ page import="com.mongodb.*" %>
        <%
            
        String ID = request.getParameter("ID");
        String Branch = request.getParameter("Branch");
        String Year = request.getParameter("Year");

        // Retrieve subject names and marks from request parameters
        String[] subjects = new String[]{"DAA", "ML", "BLT", "CSDF", "STQA"};

        try {
            MongoClient mongo = new MongoClient("localhost", 27017);
            DB db = mongo.getDB("demo");
            DBCollection coll = db.createCollection("Attendance",null); // Use existing collection

            // Create a document to store the data
            BasicDBObject document = new BasicDBObject("ID", ID).append("Branch", Branch).append("Year", Year);
            BasicDBList coursesList = new BasicDBList();
            coursesList.add("DAA");
            coursesList.add("ML");
            coursesList.add("BLT");
            coursesList.add("CSDF");
            coursesList.add("STQA");
            document.append("Subjects", coursesList);
            
            // Create an array for subjects and marks
            if (subjects != null) {
                for (int i = 0; i < subjects.length ; i++) {
                    document.append(subjects[i], request.getParameter(subjects[i]));
                }
            }

            // Insert the document into the collection
            coll.insert(document);
        %>
        <p class="result-message">Done - Data with ID <%= ID %> has been added to the database.</p>
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
