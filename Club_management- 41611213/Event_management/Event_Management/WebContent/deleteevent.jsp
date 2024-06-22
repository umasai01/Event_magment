<%@page import="com.dao.EventDao" %>

<jsp:useBean id="u" class="com.bean.Event"></jsp:useBean>
<jsp:setProperty property="*" name="u" />

<%
EventDao.delete(u);
response.sendRedirect("admin.jsp");
%>