<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Dashboard</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
	function goToHome() {
    	window.location.href = "index.jsp";
	}
</script>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
    }
    .add-btn {
        background-color: #ffffff;
        color: #9e1c3f;
        border: none;
        padding: 8px 16px;
        font-size: 16px;
        cursor: pointer;
        border-radius: 4px;
    }
    .add-btn:hover {
        background-color: #9e1c3f;
        color: white;
    }
    .club-header {
        background: #9e1c3f;
        height: 60px;
        width: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 20px;
        color: white;
    }
    .club-header h1 {
        margin: 0;
        font-size: 24px;
    }
    .card {
        border: none;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    .card-body {
        padding: 20px;
    }
    .card-title {
        font-size: 20px;
        font-weight: bold;
    }
    .card-subtitle {
        font-size: 14px;
        margin-bottom: 10px;
    }
    .card-text {
        margin: 5px;
    }
    .btn-disabled {
        background-color: #6c757d;
        border-color: #6c757d;
    }
</style>
</head>
<body>
    <%@ page import="com.dao.EventDao,com.bean.*,java.util.*" %>
    <%
    List<Event> list = EventDao.getAllRecords();
    String studentName = (String) session.getAttribute("userid");
    int studentId = (Integer) session.getAttribute("studentId");
    %>
    <div class="club-header">
        <h1>Student Dashboard</h1>
        <button class="add-btn" onclick="goToHome()">Logout</button>
    </div>
    <div class="container mt-5">
        <h2 class="mb-4">All Events</h2>
        <div class="row">
            <%
            for (Event event : list) {
            %>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%= event.getName() %></h5>
                        <h6 class="card-subtitle mb-2 text-muted">Date: <%= event.getDate() %></h6>
                        <p class="card-text">Venue: <%= event.getVenue() %></p>
                        <p class="card-text"><%= event.getDescription() %></p>
                        <p class="card-text">Requirements: <%= event.getRequirements() %></small></p>
                        <div id="applyButtonContainer<%= event.getName().hashCode() %>">
                            <script>
                                (function() {
                                    var xhr = new XMLHttpRequest();
                                    var eventName = "<%= event.getName() %>";
                                    var studentId = <%= studentId %>;
                                    xhr.open("GET", "checkApplication.jsp?eventName=" + encodeURIComponent(eventName) + "&studentId=" + studentId, true);
                                    xhr.onreadystatechange = function () {
                                        if (xhr.readyState === 4 && xhr.status === 200) {
                                            var response = xhr.responseText.trim();
                                            var container = document.getElementById("applyButtonContainer<%= event.getName().hashCode() %>");
                                            if (response === "false") {
                                                container.innerHTML = '<form action="applyEvent.jsp" method="post">' +
                                                    '<input type="hidden" name="eventName" value="' + eventName + '">' +
                                                    '<input type="hidden" name="studentName" value="<%= studentName %>">' +
                                                    '<input type="hidden" name="studentId" value="' + studentId + '">' +
                                                    '<button type="submit" class="btn btn-primary">Apply</button>' +
                                                    '</form>';
                                            } else {
                                                container.innerHTML = '<button class="btn btn-disabled" disabled>Already Applied</button>';
                                            }
                                        }
                                    };
                                    xhr.send();
                                })();
                            </script>
                        </div>
                    </div>
                </div>
            </div>
            <%
            }
            %>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
