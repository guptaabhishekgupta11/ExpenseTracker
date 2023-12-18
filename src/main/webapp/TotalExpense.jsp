<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.jsp.expanseTracker.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>home page</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- <link rel="stylesheet" href="https://fontawesome.com/icons/hand-holding-dollar?f=classic&s=solid"> -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <style>
        body {
        
            margin: 0;
            padding: 0;
        }

        #nav-bar {
            position: absolute;
            width: 100vw;
            height: 10vh;
            background-color: rgb(223, 130, 186);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        b {
            font-size: larger;
        }

        #display {
            background: linear-gradient(down, lightgreen, white, purple);
            width: 100vw;
            height: 100vh;
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
        }

        #container {
            position: absolute;
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
        }

        td {
            height: 5vh;
            width: 30vw;
            background-color: aquamarine;
        }

        #icon {
            background-color: rgba(225, 225, 225, 0.1);
            cursor: pointer;
            width: 5vw;
            height: 10vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .tab{
            height: 10vh;
            width: 10vw;
            background-color:rgba(225, 225, 225, 0.1);
        }
        section{
            display: grid;
            grid-template-rows:min-content;
            grid-row: span;
        }
        .expense{
            background-color: rgba(255, 255, 255, 0);
            font-size:25px;
            color: white;
        }
        .end{
             display:flex;
             justify-content:center;
             align-items:center;
        }
    </style>
    <script src="https://kit.fontawesome.com/745fad844e.js" crossorigin="anonymous"></script>
    <script src="js/home.js"></script>

</head>

<body>
    <%
      String message =(String) request.getAttribute("msg");
      User user = (User)session.getAttribute("userInfo");
      if(message!=null){
      %>
          <script type="text/javascript">
          window.alert("<%= message%>")
          </script>
            
      <%
      }
      message=null;
      %>
    <div id="container">
        <div id="nav-bar">
            <div><b>spring Expense Tracker</b></div>
            <div id="icon" onmouseover="showMenu()" onmouseout="hideMenu()">
                <i>
                    <span class="material-symbols-outlined">
                        manage_accounts
                    </span>
                </i>
            </div>
        </div>
        <div id="display">
            
    </div>
    <div id="menu" onmouseover="showMenu()" onmouseout="hideMenu()">
        <table border="2px" cellspacing="0px" style="margin-top: 5vh;">
            <tr class=".btn">
                <td onclick="location.href='home.html'">home</td>
            </tr>
            <tr class=".btn">
                <td onclick="location.href='login.html'">login</td>
            </tr><br>
            <tr class=".btn">
                <td onclick="location.href='signup.html'">sign up</td>
            </tr>
        </table>
    </div>
</body>

</html>