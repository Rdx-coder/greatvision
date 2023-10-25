<%
String email = (String) session.getAttribute("id"); // downcasting
%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ include file="db.jsp" %>
<% int total = 0; %>
<%
String qr = "select * from client where email='" + email + "'";

Statement st = con.createStatement();
ResultSet rs = st.executeQuery(qr);
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            font-family: "Lato", sans-serif;
            background-color: #f5f5f5;
        }

        .card {
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2);
            max-width: 400px;
            margin: 20px auto;
            text-align: center;
            background: linear-gradient(to right, #ff9a44, #ffbe70);
            padding: 20px;
            border-radius: 10px;
            transition: transform 0.2s;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .title {
            color: #fff;
            font-size: 28px;
            margin-bottom: 10px;
        }

        .info {
            font-size: 20px;
            margin: 10px 0;
            color: #333;
            text-align: left;
            padding: 10px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 5px;
        }

        .card img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
        }

        .social-icons {
            margin: 24px 0;
        }

        .social-icons a {
            text-decoration: none;
            font-size: 24px;
            color: #ff9a44;
            margin: 0 15px;
        }

        .edit-button {
            background-color: #ff9a44;
            color: #fff;
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            font-size: 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .edit-button:hover {
            background-color: #ffbe70;
        }
    </style>
</head>
<body>

<h2 style="text-align: center">Profile</h2>

<%
if (rs.next()) {
  do {
    String name = rs.getString("name");
    String mobile = rs.getString("mobile");
    String dob = rs.getString("dob");
    String pan = rs.getString("pan");
    String account = rs.getString("account");
%>
    <div class="card">
      <img src="rubic/public_html/assets/imgs/avatar2.jpg" alt="img">
      <p class="title"><%= name %></p>
      <p class="info"><strong>Name:</strong> <%= name %></p>
      <p class="info"><strong>EMAIL:</strong> <%= email %></p>
      <p class="info"><strong>MOBILE :</strong> <%= mobile %></p>
      <p class="info"><strong>DOB:</strong> <%= dob %></p>
      <p class="info"><strong>PAN CARD:</strong> <%= pan %></p>
      <p class="info"><strong>ACCOUNT:</strong> <%= account %></p>
      <div class="social-icons">
        <a href="#"><i class="fa fa-dribbble"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-facebook"></i></a>
      </div>
      <button class="edit-button">Edit Profile</button>
    </div>
<%
  } while (rs.next());
} else {
  out.println("Error found");
}
%>

</body>
</html>
