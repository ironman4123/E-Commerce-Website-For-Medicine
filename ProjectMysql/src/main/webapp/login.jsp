<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Zoro.to</title>
    <link rel="icon" href="https://icons.iconarchive.com/icons/crountch/one-piece-jolly-roger/256/Zoro-icon.png" type="image/x-icon">
    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
  
</head>
<body>
    <div class="container center-content">
        <%@ page import="java.sql.*" %>
        <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean isAuthenticated = false; // Flag to track authentication
        
        if (username != null && password != null && !username.isEmpty() && !password.isEmpty()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_student", "root", "");
                Statement stmt = con.createStatement();
                
                ResultSet rs = stmt.executeQuery("SELECT * FROM login");
                while (rs.next()) {
                	if(username.equals(rs.getString(1)) && password.equals(rs.getString(2))) {
                        isAuthenticated = true; // Set the flag to true if either condition is met
                        break; // Exit the loop since authentication is successful
                    }
                }
               
            } catch (Exception e) {
                out.print("<div class='result-message text-danger'>An error occurred: " + e.getMessage() + "</div>");
            }
        }
        
        if (isAuthenticated) {
        %>
         <script>
            window.location.href = "admin/index.html";
        </script>
        <%
        }
        else {
            out.print("<div class='result-message text-danger'>Please enter a valid username and password.</div>");
        }
        %>
    </div>
    <!-- Add Bootstrap JS scripts (jQuery and Popper.js are required dependencies) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
