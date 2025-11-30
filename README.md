# student-management-system
A complete Student Management System built using Java Servlets, JSP, JDBC, and MySQL.
# Student Management System

A complete web-based Student Management System built using **Java Servlets, JSP, JDBC and MySQL**.  
This project provides functionalities for **Admin and Student** including login, registration, marks & attendance management, and profile updates — all wrapped in a clean & modern UI.

---

## 🚀 Features

- **User Roles**  
  - Admin — to add / update student marks & attendance  
  - Student — to register, login, view marks, view attendance, and update profile  

- **Student Registration & Login**  
- **Secure Session Management** (login/logout)  
- **CRUD Operations** — Add / Update / View marks & attendance  
- **Update Student Profile**  
- **Dynamic Data Fetch & Display** using Servlets + JDBC + MySQL  
- **Modern, Responsive UI** using JSP, HTML & CSS  
- **MVC-style Architecture** (Servlets as Controller, JSP as View, MySQL as Model)  

---

## 🧰 Tech Stack

| Layer       | Technology / Tools         |
|-------------|----------------------------|
| Backend     | Java Servlets              |
| Frontend    | JSP, HTML, CSS             |
| Database    | MySQL                      |
| Deployment  | Apache Tomcat              |
| Build       | Eclipse / IDE of your choice |

---

## 📁 Folder Structure

student-management-system/
├── src/
│ ├── main/
│ │ ├── java/kaif/sms/ ← Servlets & backend logic
│ │ └── webapp/ ← JSP pages + views
│ │ ├── *.jsp
│ │ └── WEB-INF/web.xml
├── README.md ← Project documentation
├── .project, .classpath ← IDE config files

yaml
Copy code

---

## 🔧 Setup Instructions (For Local Deployment)

1. Clone the repository:  
   ```bash
   git clone https://github.com/Md-Kaif-coder/student-management-system.git
Import project in Eclipse (or preferred IDE) as Dynamic Web Project or Maven/Webapp project.

Add MySQL Connector (JAR) to build path if not present.

Configure database:

Create database jdbc_db

Import table schemas (students, marks, attendance, admin, etc.)

Run project on Apache Tomcat (or similar servlet container)

Access in browser:

bash
Copy code
http://localhost:8080/YourProjectName/login.jsp
