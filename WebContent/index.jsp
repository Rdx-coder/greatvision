<%@page import="greatvison.GoogleAuthHelper"%>
<%@page import="java.sql.*, java.io.*, org.json.simple.*" %>
<%@page import="org.json.simple.parser.ParseException" %>
<%@page import="org.json.simple.parser.JSONParser" %>
<%@page import="org.json.simple.JSONObject" %>
<%@page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.DriverManager, java.sql.SQLException" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Google OAuth 2.0</title>
</head>
<body>
    <div class="oauthDemo">
        <%
            /*
             * The GoogleAuthHelper handles all the heavy lifting and contains all "secrets"
             * required for constructing a Google login URL.
             */
            final GoogleAuthHelper helper = new GoogleAuthHelper();

            if (request.getParameter("code") == null || request.getParameter("state") == null) {

                /*
                 * Initial visit to the page
                 */
                out.println("<a href='" + helper.buildLoginUrl() + "'>Log in with Google</a>");

                /*
                 * Set the secure state token in the session to be able to track what we sent to Google
                 */
                session.setAttribute("state", helper.getStateToken());

            } else if (request.getParameter("code") != null && request.getParameter("state") != null
                    && request.getParameter("state").equals(session.getAttribute("state"))) {

                session.removeAttribute("state");

                out.println("<pre>");
                /*
                 * Executes after Google redirects to the callback URL.
                 * Please note that the state request parameter is for convenience to differentiate
                 * between authentication methods (e.g., Facebook OAuth, Google OAuth, Twitter, in-house).
                 * 
                 * GoogleAuthHelper()#getUserInfoJson(String) method returns a String containing
                 * the JSON representation of the authenticated user's information.
                 * At this point, you should parse and persist the info.
                 */

                String userInfoJson = helper.getUserInfoJson(request.getParameter("code"));
                out.println(userInfoJson);

                // Parse JSON to extract user information
                JSONParser parser = new JSONParser();
                try {
                    JSONObject jsonObject = (JSONObject) parser.parse(userInfoJson);
                    String userId = (String) jsonObject.get("id");
                    String email = (String) jsonObject.get("email");
                    String name = (String) jsonObject.get("name");
                    String givenName = (String) jsonObject.get("given_name");
                    String familyName = (String) jsonObject.get("family_name");
                    String picture = (String) jsonObject.get("picture");
                    String locale = (String) jsonObject.get("locale");

                    // Database Connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/indore", "root", "123456");

                    // Check if the user already exists in the database
                    String checkQuery = "SELECT COUNT(*) FROM usersdata WHERE user_id = ?";
                    PreparedStatement checkStatement = con.prepareStatement(checkQuery);
                    checkStatement.setString(1, userId);
                    ResultSet resultSet = checkStatement.executeQuery();
                    resultSet.next();
                    int count = resultSet.getInt(1);

                    if (count == 0) {
                        // Insert data into the database only if the user doesn't already exist
                        String insertQuery = "INSERT INTO usersdata (user_id, email, name, given_name, family_name, picture, locale) VALUES (?, ?, ?, ?, ?, ?, ?)";

                        try {
                            PreparedStatement preparedStatement = con.prepareStatement(insertQuery);
                            preparedStatement.setString(1, userId);
                            preparedStatement.setString(2, email);
                            preparedStatement.setString(3, name);
                            preparedStatement.setString(4, givenName);
                            preparedStatement.setString(5, familyName);
                            preparedStatement.setString(6, picture);
                            preparedStatement.setString(7, locale);
                            preparedStatement.executeUpdate();
                            out.println("User data inserted successfully.");
                        } catch (SQLException e) {
                            e.printStackTrace();
                            out.println("Error inserting user data: " + e.getMessage());
                        }
                    } else {
                        out.println("User data already exists in the database. No new data inserted.");
                    }

                } catch (ParseException e) {
                    e.printStackTrace();
                    out.println("Error parsing user data: " + e.getMessage());
                }
                out.println("</pre>");
            }
        %>
    </div>
</body>
</html>
