

# Club Management System

A comprehensive **Club Management System** built using **HTML, CSS, JavaScript, JDBC, JSP, MySQL, and Java**. The system allows club administrators to manage club activities, member registrations, event scheduling, and financial tracking through an intuitive web interface.

## 📌 Features

- ✅ User-friendly interface for both **Admin** and **Users**.
- ✅ Admin access panel to:
  - Add and manage clubs.
  - View registered members.
  - Track events and activities.
  - Manage finances and contributions.
- ✅ User access panel to:
  - Register and access club information.
  - View events and schedules.
  - Interact with club activities easily.
- ✅ Secure backend using **JDBC** and **MySQL** for database interactions.
- ✅ Developed using **JSP** for server-side rendering and **Java** for business logic.

---

## 🛠 Technology Stack

- **Frontend:** HTML, CSS, JavaScript  
- **Backend:** Java, JSP, JDBC  
- **Database:** MySQL  
- **Tools:** Apache Tomcat (or similar), MySQL Workbench  

---

## 📂 Project Structure

```

Club-Management-System/
├── src/
│   ├── AdminPanel.jsp
│   ├── UserPanel.jsp
│   └── ...
├── web/
│   ├── css/
│   ├── js/
│   └── images/
├── database/
│   └── club\_management.sql
├── README.md
└── ...

````

---

## 🚀 Getting Started

### Prerequisites

- Java JDK installed
- Apache Tomcat (or compatible server)
- MySQL database setup

### Installation Steps

1. Clone this repository:

   ```bash
   git clone https://github.com/umasai01/Event_magment.git
````

2. Import the `club_management.sql` file into your MySQL database.

3. Configure the database connection in your JSP/Java files to match your database credentials.

4. Deploy the application in Apache Tomcat.

5. Open the application in your browser using `http://localhost:8080/Club-Management-System`.

## 📂 Future Enhancements

* Add authentication with password encryption.
* Implement notifications for events.
* Add mobile responsiveness.
* Integrate with cloud storage for media files.
