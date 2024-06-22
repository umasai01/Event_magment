<%@ page import="java.sql.*"%>
<%
String eventName = request.getParameter("eventName");
String studentName = request.getParameter("studentName");
int studentId = Integer.parseInt(request.getParameter("studentId"));

if (eventName != null && studentName != null && studentId > 0) {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/portal", "root", "toor");

        // Insert into event-specific table
        String tableName = eventName.replaceAll("[^a-zA-Z0-9]", "_");
        String insertQuery = "INSERT INTO `" + tableName + "` (id, name) VALUES (?, ?)";
        PreparedStatement pstmt = con.prepareStatement(insertQuery);
        pstmt.setInt(1, studentId);
        pstmt.setString(2, studentName);

        int i = pstmt.executeUpdate();

        if (i > 0) {
            response.sendRedirect("student.jsp");
        } else {
            out.println("Application failed!! <a href='student.jsp'>Try Again</a>");
        }

        pstmt.close();
        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
} else {
    out.println("All fields are required! <a href='student.jsp'>Try Again</a>");
}
%>
