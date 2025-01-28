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
        <a class="navbar-brand" href="../login.html">
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
              <a class="nav-link" href="delete.html#">Delete</a>
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
         <%@ page import="java.sql.*" %>
	    <%@ page import="java.io.*" %>
	    <%@ page import="java.util.*" %>
        <%

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_student", "root", "");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM data");
			int i = 0;
			String userHome = System.getProperty("user.home");
			BufferedWriter bw = new BufferedWriter(new FileWriter(userHome + "/Downloads/op.txt"));
			
			 bw.write("ID" + "\t\t" + "Full Name" + "\t\t\t" + "Branch" + "\t\t\t" + "Percentage" + "\n\n");
			 bw.write("-------------------------------------------------------------------------------------\n");
            while (rs.next()) {
                bw.write(rs.getString(1) + "\t\t" + rs.getString(2) + "\t\t" + rs.getString(3) + "\t\t" + rs.getString(4) + "\n");
                i++;
            }
            bw.write("-------------------------------------------------------------------------------------\n");
            bw.write("\nTotal Rows are :"+i);
            bw.close();
            out.print("<div class='output-message'>Data exported to op.txt successfully.</div>");
        } catch (Exception e) {
            out.print("<div class='output-message text-danger'>An error occurred: " + e.getMessage() + "</div>");
        }
        %>
        
    </div>

    <!-- Add Bootstrap JS scripts (jQuery and Popper.js are required dependencies) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
