<%@ page import="java.sql.*" %>
<%
String userType = request.getParameter("user-type");
String username = request.getParameter("username"); // Changed to "username"
String password = request.getParameter("password"); // Changed to "password"

if (userType != null && username != null && password != null) {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/portal", "root", "toor");

        PreparedStatement ps = null;
        ResultSet rs = null;

        if ("admin".equalsIgnoreCase(userType)) {
            String query = "SELECT id, name, pwd FROM admin_table WHERE name=? AND pwd=?";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Login successful, set session attributes
                int adminId = rs.getInt("id");
                session.setAttribute("userid", username);
                session.setAttribute("user_type", "admin");
                session.setAttribute("adminId", adminId); // Add adminId to session
                response.sendRedirect("admin.jsp");
            } else {
                // Invalid credentials for admin
                out.println("Invalid username/password for admin. <a href='index.jsp'>Try Again</a>");
            }
        } else if ("student".equalsIgnoreCase(userType)) {
            String query = "SELECT id, name, pwd FROM student_table WHERE name=? AND pwd=?";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Login successful, set session attributes
                int studentId = rs.getInt("id");
                session.setAttribute("userid", username);
                session.setAttribute("user_type", "student");
                session.setAttribute("studentId", studentId); // Add studentId to session
                response.sendRedirect("student.jsp");
            } else {
                // Invalid credentials for student
                out.println("Invalid username/password for student. <a href='index.jsp'>Try Again</a>");
            }
        } else {
            // Invalid user type
            out.println("Invalid user type. <a href='index.jsp'>Try Again</a>");
        }

        // Close resources
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        con.close();

    } catch (ClassNotFoundException e) {
        out.println("Error: " + e.getMessage());
        e.printStackTrace();
    } catch (SQLException e) {
        out.println("Error: " + e.getMessage());
        e.printStackTrace();
    }
} else {
    out.println("Invalid input parameters. <a href='index.jsp'>Try Again</a>");
}
%>
