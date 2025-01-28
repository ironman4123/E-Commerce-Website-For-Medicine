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
<%String username = request.getParameter("username"); %>
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
    <div class="container center-content">
        <%@ page import="com.mongodb.*" %>
        <%
        String ID ;
        MongoClient mongo = new MongoClient("localhost", 27017);
        DB db = mongo.getDB("demo");
        DBCollection coll = db.getCollection("Marks");
        BasicDBList subjectsList;
        String subject = "";
        String attendance = "";
        float att, total = 44;

        // Query the database to retrieve the data
        DBCursor cursor = coll.find();
        while (cursor.hasNext()) {
        	DBObject document = cursor.next();
            ID = (String) document.get("ID");
            if (username.equals(ID)) {
        %>
       
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Subject</th>
                    <th>Attendance</th>
                </tr>
            </thead>
            <tbody>
                	<%
                        subjectsList = (BasicDBList) document.get("Subjects");
                        // Iterate through subjects and marks
                        for (int i = 0; i < subjectsList.size(); i++) {
                        	subject = (String) subjectsList.get(i);
                            attendance = (String) document.get(subject);
                            att = Float.parseFloat(attendance);
                            float a = (att/total)*100;
                    %>
                    <tr>
                        <td><%= subject %></td>
                        <td><%= a %>%</td>
                    </tr>
                    <%
                        }
           		break;		
           		}
            }
            cursor.close();
        %>
            </tbody>
        </table>
    </div>

    <!-- Add Bootstrap JS scripts (jQuery and Popper.js are required dependencies) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
