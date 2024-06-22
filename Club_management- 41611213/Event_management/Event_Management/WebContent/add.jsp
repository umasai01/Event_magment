<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Event</title>
</head>
<body>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            padding: 20px;
        }
        .event-form {
            background-color: #fff;
            padding: 40px;
            border: 2px solid #007bff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 400px;
            margin: 0 auto;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input[type="text"],
        .form-group input[type="date"],
        .form-group textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            resize: vertical; /* Allows vertical resizing of textarea */
        }
        .form-group button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .form-group button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="event-form">
        <h2>Add Event Details</h2>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <form action="event-register.jsp" method="POST">
            <div class="form-group">
                <label>Event Name:</label>
                <input type="text" id="event-name" name="event-name" placeholder="enter the name of the event" required>
            </div>
            <div class="form-group">
                <label>Event Date:</label>
                <input type="date" id="event-date" name="event-date" placeholder="select date" required>
            </div>
            <div class="form-group">
                <label>Event Venue:</label>
                <input type="text" id="event-venue" name="event-venue" placeholder="enter venue details" required>
            </div>
            <div class="form-group">
                <label>Description:</label>
                <textarea id="event-description" name="event-description" rows="4" placeholder="enter the event description" required></textarea>
            </div>
            <div class="form-group">
                <label>Event Requirements:</label>
                <textarea id="event-requirements" name="event-requirements" rows="4" placeholder="give requirements" required></textarea>
            </div>
            <div class="form-group">
                <button type="submit">Submit Event</button>
            </div>
        </form>
    </div>
     <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script>
        // Initialize Flatpickr on the event-date input field
        flatpickr('#event-date', {
            dateFormat: 'Y-m-d', // Date format
            minDate: 'today' // Minimum date is today
        });
    </script>
</body>
</html>