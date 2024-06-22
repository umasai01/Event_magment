<%@ page import="java.sql.*"%>
<%
String eventName = request.getParameter("eventName");
int studentId = Integer.parseInt(request.getParameter("studentId"));

boolean alreadyApplied = false;

if (eventName != null && studentId > 0) {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/portal", "root", "toor");

        // Check in event-specific table
        String tableName = eventName.replaceAll("[^a-zA-Z0-9]", "_");
        String checkQuery = "SELECT * FROM `" + tableName + "` WHERE id = ?";
        PreparedStatement pstmt = con.prepareStatement(checkQuery);
        pstmt.setInt(1, studentId);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            alreadyApplied = true;
        }

        rs.close();
        pstmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

response.setContentType("text/plain");
response.getWriter().write(Boolean.toString(alreadyApplied));
%>
