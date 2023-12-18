<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.jsp.expanseTracker.entity.Expense"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Expense Tracker</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Icons+Outlined" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to bottom, #FFD700, #FF6347);
            color: #FFF;
        }

        #nav-bar {
            position: absolute;
            width: 100vw;
            height: 10vh;
            background-color: #3498db;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            color: #FFF;
        }

        b {
            font-size: larger;
        }

        #icon {
            background-color: #3498db;
            cursor: pointer;
            width: 5vw;
            height: 10vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #FFF;
        }

        #menu {
            width: 100vw;
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            position: fixed;
            z-index: -1;
            transition: z-index 0.3s ease-in;
            background-color: #FFF;
            padding: 20px;
        }

        td {
            height: 5vh;
            width: 10vw;
            background-color: #3498db;
            text-align: center;
            padding: 10px;
            color: #FFF;
        }

        #display {
            background: linear-gradient(to right, #FF6347, #FFD700);
            width: 100vw;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        #innerDiv {
            margin-top: 10vh;
            background: linear-gradient(to right, #FF6347, #FFD700);
            width: 70vw;
            height: 80vh;
            border-radius: 15px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-evenly;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        input {
            text-align: center;
            border-radius: 10px;
            padding: 15px;
            margin: 15px;
            width: 80%;
            border: none;
            background-color: rgba(255, 255, 255, 0.8);
            font-size: 18px;
            color: #333;
            outline: none;
        }

        input:focus {
            border: 2px solid #3498db;
        }

        button {
            background-color: #3498db;
            color: #FFF;
            border: none;
            border-radius: 10px;
            padding: 15px;
            margin: 15px;
            width: 80%;
            cursor: pointer;
            font-size: 20px;
            transition: background 0.3s;
        }

        button:hover {
            background-color: #1E6FA8;
        }

        i {
            font-size: 24px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #FFF;
            padding: 15px;
            text-align: center;
        }

        th {
            background-color: #1E6FA8;
            color: #FFF;
        }

        tr:nth-child(even) {
            background-color: #3498db;
        }

        tr:nth-child(odd) {
            background-color: #1E6FA8;
        }

        a {
            text-decoration: none;
            color: #FFF;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
    <script src="https://kit.fontawesome.com/745fad844e.js" crossorigin="anonymous"></script>
</head>

<body>
    <script>
        function showMenu() {
            document.getElementById("menu").style.zIndex = 1;
        }

        function hideMenu() {
            document.getElementById("menu").style.zIndex = -1;
        }
    </script>

    <div id="container">
        <div id="nav-bar">
            <div><b>Expense Tracker</b></div>
            <div id="icon" onmouseover="showMenu()" onmouseout="hideMenu()">
                <i class="material-icons-outlined">menu</i>
            </div>
        </div>

        <div id="display">
            <div id="innerDiv">
                <table border="2">
                    <tr>
                        <th>s.no</th>
                        <th>date</th>
                        <th>amount</th>
                        <th>category</th>
                        <th>description</th>
                        <th>action</th>
                    </tr>
                    <%
                        List<Expense> listOfExpenses = (List)request.getAttribute("list");
                        if (listOfExpenses != null) {
                            int count = 0;
                            for (Expense e : listOfExpenses) {
                    %>
                    <tr>
                        <td><%= count++%></td>
                        <td><%= e.getDate()%></td>
                        <td><%= e.getAmount()%></td>
                        <td><%= e.getCategory()%></td>
                        <td><%= e.getDescription()%></td>
                        <td>
                            <a href="UpdateExpense.jsp?expenseId=<%= e.getExpenseId()%>">
                                <button>Update</button>
                            </a>
                            <a href="DeleteExpense?expenseId=<%= e.getExpenseId()%>">
                                <button>Delete</button>
                            </a>
                        </td>
                    </tr>
                    <%
                        }//close forEach
                    }//close if
                    %>
                </table>
            </div>
        </div>

        <div id="menu" onmouseover="showMenu()" onmouseout="hideMenu()">
            <table border="2px" cellspacing="0px" style="margin-top: 5vh;">
                <tr>
                    <td onclick="location.href='home.html'">Home</td>
                </tr>
                <tr>
                    <td onclick="location.href='login.html'">Login</td>
                </tr>
                <tr>
                    <td onclick="location.href='signup.html'">Sign Up</td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
