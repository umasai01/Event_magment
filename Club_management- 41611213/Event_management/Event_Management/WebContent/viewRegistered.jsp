<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registered Participants</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
    }
    .container {
        margin-top: 20px;
    }
</style>
</head>
<body>
    <div class="container">
        <h2 class="mb-4">Registered Participants</h2>
        <%
        String eventName = request.getParameter("eventName");
        List<Map<String, String>> participants = new ArrayList<Map<String, String>>();

        if (eventName != null && !eventName.isEmpty()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/portal", "root", "toor");
                String tableName = eventName.replaceAll("[^a-zA-Z0-9]", "_");
                String query = "SELECT * FROM `" + tableName + "`";
                PreparedStatement ps = con.prepareStatement(query);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    Map<String, String> participant = new HashMap<String, String>();
                    participant.put("id", String.valueOf(rs.getInt("id")));
                    participant.put("name", rs.getString("name"));
                    participants.add(participant);
                }

                rs.close();
                ps.close();
                con.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
        %>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                </tr>
            </thead>
            <tbody>
                <%
                for (Map<String, String> participant : participants) {
                %>
                <tr>
                    <td><%= participant.get("id") %></td>
                    <td><%= participant.get("name") %></td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
