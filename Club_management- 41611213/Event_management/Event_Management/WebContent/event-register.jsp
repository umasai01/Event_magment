<%@ page import="java.sql.*"%>
<%
String name = request.getParameter("event-name");
String date = request.getParameter("event-date");
String venue = request.getParameter("event-venue");
String desc = request.getParameter("event-description");
String requ = request.getParameter("event-requirements");

if (name != null && date != null && venue != null && desc != null && requ != null) {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/portal", "root", "toor");

        // Insert event into events table
        String insertQuery = "INSERT INTO events(event_name, event_date, event_venue, event_desc, event_req) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(insertQuery);
        pstmt.setString(1, name);
        pstmt.setString(2, date);
        pstmt.setString(3, venue);
        pstmt.setString(4, desc);
        pstmt.setString(5, requ);

        int i = pstmt.executeUpdate();

        if (i > 0) {
            // Create new table for the event
            String createTableQuery = "CREATE TABLE `" + name.replaceAll("[^a-zA-Z0-9]", "_") + "` ("
                                    + "id INT NOT NULL, "
                                    + "name VARCHAR(100) NOT NULL)";
            Statement stmt = con.createStatement();
            stmt.executeUpdate(createTableQuery);

            response.sendRedirect("admin.jsp");
        } else {
            out.println("Event not added!! <a href='add.jsp'>Try Again</a>");
        }

        pstmt.close();
        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
} else {
    out.println("All fields are required! <a href='add.jsp'>Try Again</a>");
}
%>
