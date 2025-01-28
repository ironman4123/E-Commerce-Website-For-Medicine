<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Zoro.to</title>
    <link rel="icon" href="https://icons.iconarchive.com/icons/crountch/one-piece-jolly-roger/256/Zoro-icon.png" type="image/x-icon">
    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            text-align: center;
            background-image: url('https://media.giphy.com/media/9az09tlYyYNfq/giphy.gif'); /* Replace with your image URL */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        .center-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            background-color: rgba(255, 255, 255, 0.8); /* Add a semi-transparent white background for better readability */
            padding: 20px;
            border-radius: 10px;
        }
        .output-message {
            margin-top: 20px;
            font-size: 18px;
            color: #007bff;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container center-content">
        <%@ page import="com.mongodb.*" %>
        <%
        String ID = request.getParameter("ID");
        String password = request.getParameter("password");
        boolean isAuthenticatedAdmin = false; // Flag for admin authentication
        boolean isAuthenticatedUser = false; // Flag for user authentication
        
        try {
            MongoClient mongo = new MongoClient("localhost", 27017);
            DB db = mongo.getDB("demo");
            DBCollection coll = db.getCollection("login");
            
            if (ID.equals("admin") && password.equals("zoro@2003")) {
                isAuthenticatedAdmin = true; // Set the flag to true if admin credentials are met
            }
            else {
                BasicDBObject query = new BasicDBObject("ID", ID).append("Password", password);
                DBObject user = coll.findOne(query);
                
                if (user != null) {
                    isAuthenticatedUser = true; // Set the flag to true if user credentials are met
                }
            }
            
            mongo.close(); // Close the MongoDB connection
        } catch (Exception e) {
            out.print("<div class='output-message text-danger'>An error occurred: " + e.getMessage() + "</div>");
        }
        
        if (isAuthenticatedAdmin) {
            // If admin authentication is successful, use JavaScript to redirect to admin.html
        %>
        <script>
            window.location.href = "admin/index.html";
        </script>
        <%
        }
        else if (isAuthenticatedUser) {
            // If user authentication is successful, use JavaScript to redirect to student.html
        %>
        <script>
            window.location.href = "student/student.jsp?username=<%= ID %>";
        </script>
        <%
        }
        else {
            // Authentication failed for both admin and user
        %>
        <div class="output-message text-danger">Authentication failed. Please check your credentials.</div>
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
