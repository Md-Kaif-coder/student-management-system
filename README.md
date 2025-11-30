# Student Management System

This is a web-based Student Management System built using Java Servlets, JSP, JDBC, and MySQL.  
The application contains separate modules for students and administrators, allowing them to manage academic information such as attendance, marks, and profile details.

---

## Features

### Student Module
- Registration and Login  
- View Marks  
- View Attendance  
- Update Profile  
- Session-based authentication  

### Admin Module
- Admin Login  
- Add or Update Marks  
- Add or Update Attendance  
- Controlled access to student records  

---

## Technologies Used

- Java (JDK 8 or above)  
- JSP (Java Server Pages)  
- Servlets  
- JDBC  
- MySQL  
- Apache Tomcat (recommended: Tomcat 9)  
- HTML and CSS  
- MVC Architecture  

---

## Project Structure

```
student-management-system/
│
├── src/
│   └── main/
│       ├── java/
│       │   └── kaif/sms/                   -> Servlet classes
│       │
│       └── webapp/
│           ├── WEB-INF/
│           │   └── web.xml                 -> Deployment descriptor
│           │
│           ├── login.jsp
│           ├── register.jsp
│           ├── profile.jsp
│           ├── adminLogin.jsp
│           ├── adminDashboard.jsp
│           ├── viewMarks.jsp
│           ├── viewAttendance.jsp
│           ├── updateProfile.jsp
│           │
│           └── assets (images, CSS, etc. if present)
│
├── .classpath
├── .project
└── README.md
```

---

## Database Schema

Create a MySQL database with the following tables:

### Table: student
- id (Primary Key)  
- name  
- email  
- password  
- gender  
- course  
- city  

### Table: marks
- id (Primary Key)  
- student_id (Foreign Key)  
- math  
- java  
- dbms  
- dsa  

### Table: attendance
- id (Primary Key)  
- student_id (Foreign Key)  
- attendance_percent  

### Table: admin
- id (Primary Key)  
- username  
- password  

---

## Steps to Run the Project Locally

1. Install JDK and configure environment variables.  
2. Install Apache Tomcat (version 9 recommended).  
3. Install MySQL and create the necessary database and tables.  
4. Clone or download the repository.  
5. Import the project into Eclipse as an existing dynamic web project.  
6. Update database credentials in the JDBC connection section.  
7. Deploy the project on Tomcat using the "Run on Server" option.  
8. Open a web browser and navigate to:  
   - `http://localhost:8080/student-management-system/login.jsp` (Student Login)  
   - `http://localhost:8080/student-management-system/adminLogin.jsp` (Admin Login)

---

## Learning Outcomes

- Implementation of Servlets and JSP  
- Handling CRUD operations using JDBC  
- Managing authentication and sessions  
- Structuring applications using MVC  
- Designing and integrating frontend with backend  
- Developing complete web applications in Java  

---

## Future Enhancements

- Form validation and improved error handling  
- Password encryption  
- Admin dashboard with analytics  
- Responsive UI using Bootstrap  
- Adding email notifications  
- Adding student search and filtering options  

---

## Author

Developed as a Java Web Application project focusing on Servlets, JSP, JDBC, and MySQL.
