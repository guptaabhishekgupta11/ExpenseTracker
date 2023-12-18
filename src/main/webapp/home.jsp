<%@page import="java.util.Base64"%>
<%@page import="com.jsp.expanseTracker.service.UserServiceImpl"%>
<%@page import="com.jsp.expanseTracker.service.UserService"%>
<%@page import="com.jsp.expanseTracker.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" href="media/logo.png">
    <title>Expenses Tracker</title>
    <style>
        #foo {
            /* position: absolute;
            bottom: 0px; */
            width: 100%;
            height: 80px;
            background-color: black;
            color: white;
            display: flex;
            justify-content: center;
            align-content: center;
            flex-wrap: wrap;
            position: absolute;
            bottom: 0px;
        }

        body {
            width: 100%;
            height: 100vh;
            background-image: linear-gradient(75deg, purple, black, black);

            background-size: 100% 100%;
        }

        #button_Container {
            width: 100%;
            height: 60vh;
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
        }

        .buttondiv {
            width: 40%;
            height: 80px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        button {
            width: 60%;
            height: 50px;
            border: none;
            background-image: linear-gradient();
            background-color: transparent;
            font-size: 40px;
            text-shadow: 2px 2px 2px black;
            color: white;

        }

        button:hover {
            -webkit-animation-name: wobble;
            animation-name: wobble;
            -webkit-animation-duration: 0.8s;
            -webkit-animation-iteration-count: 1;
            -webkit-animation-timing-function: linear;
            -webkit-transform-origin: 50% 100%;
        }

        @-webkit-keyframes wobble {
            0% {
                -webkit-transform: none;
                transform: none;
            }

            15% {
                -webkit-transform: translate3d(-25%, 0, 0) rotate3d(0, 0, 1, -5deg);
                transform: translate3d(-25%, 0, 0) rotate3d(0, 0, 1, -5deg);
            }

            30% {
                -webkit-transform: translate3d(20%, 0, 0) rotate3d(0, 0, 1, 3deg);
                transform: translate3d(20%, 0, 0) rotate3d(0, 0, 1, 3deg);
            }

            45% {
                -webkit-transform: translate3d(-15%, 0, 0) rotate3d(0, 0, 1, -3deg);
                transform: translate3d(-15%, 0, 0) rotate3d(0, 0, 1, -3deg);
            }

            60% {
                -webkit-transform: translate3d(10%, 0, 0) rotate3d(0, 0, 1, 2deg);
                transform: translate3d(10%, 0, 0) rotate3d(0, 0, 1, 2deg);
            }

            75% {
                -webkit-transform: translate3d(-5%, 0, 0) rotate3d(0, 0, 1, -1deg);
                transform: translate3d(-5%, 0, 0) rotate3d(0, 0, 1, -1deg);
            }

            100% {
                -webkit-transform: none;
                transform: none;
            }
        }

        @keyframes wobble {
            0% {
                -webkit-transform: none;
                transform: none;
            }

            15% {
                -webkit-transform: translate3d(-25%, 0, 0) rotate3d(0, 0, 1, -5deg);
                transform: translate3d(-25%, 0, 0) rotate3d(0, 0, 1, -5deg);
            }

            30% {
                -webkit-transform: translate3d(20%, 0, 0) rotate3d(0, 0, 1, 3deg);
                transform: translate3d(20%, 0, 0) rotate3d(0, 0, 1, 3deg);
            }

            45% {
                -webkit-transform: translate3d(-15%, 0, 0) rotate3d(0, 0, 1, -3deg);
                transform: translate3d(-15%, 0, 0) rotate3d(0, 0, 1, -3deg);
            }

            60% {
                -webkit-transform: translate3d(10%, 0, 0) rotate3d(0, 0, 1, 2deg);
                transform: translate3d(10%, 0, 0) rotate3d(0, 0, 1, 2deg);
            }

            75% {
                -webkit-transform: translate3d(-5%, 0, 0) rotate3d(0, 0, 1, -1deg);
                transform: translate3d(-5%, 0, 0) rotate3d(0, 0, 1, -1deg);
            }

            100% {
                -webkit-transform: none;
                transform: none;
            }
        }

        #bgcolor {
            width: 400px;
            height: 400px;
            background-color: white;
            position: absolute;
            z-index: -1;
            left: 35%;
            top: 20%;
            border-radius: 100%;
            animation: animationbgm 3s linear 0s infinite;
            background-image: linear-gradient(75deg, red, blue, orange, purple);
            background-size: 1800px;
            background-position: 1800px;
            filter: blur(100px);
        }

        @keyframes animationbgm {
            10% {
                border-radius: 30% 70% 70% 30% / 30% 30% 70% 70%;
                background-position: 1800px;
            }

            20% {
                border-radius: 54% 46% 70% 30% / 30% 30% 70% 70%;
            }

            40% {
                border-radius: 54% 46% 70% 30% / 30% 66% 34% 70%;
            }

            50% {
                border-radius: 77% 23% 22% 78% / 52% 66% 34% 48%;
            }

            60% {
                border-radius: 37% 63% 22% 78% / 52% 66% 34% 48%;
            }

            70% {
                border-radius: 37% 63% 22% 78% / 78% 23% 77% 22%;
            }

            80% {
                border-radius: 48% 52% 22% 78% / 39% 50% 50% 61%;
            }

            90% {
                border-radius: 54% 46% 70% 30% / 30% 30% 70% 70%;
            }

            100% {
                border-radius: 30% 70% 70% 30% / 30% 30% 70% 70%;
                background-position: 0px;

            }

        }

        #wel {
            position: absolute;
            color: lawngreen;
            top: 48%;
        }

        #list {
            list-style-type: none;
            font-size: 20px;
            text-align: left;
            font-weight: bolder;
        }

        #list li {
            padding-bottom: 3px;
        }

        li a {
            text-decoration: none;
            color: white;
        }

        li a:hover {
            background-color: white;
            color: black;
        }

        #list {
			display : none;
            position: absolute;
            right: 3%;
        }

        #setting:hover #list {
            display: block;
        }
    </style>
</head>

<body style="overflow: hidden;">
	<%
		response.setHeader("Cache-Control", "no-cache");
	    response.setHeader("Cache-Control", "no-store");
	    response.setHeader("Pragma", "no-cache");
	    response.setDateHeader("Expires", 0);
		String message = (String)request.getAttribute("msg");
		//User user = (User)request.getAttribute("userInfo");
		User user = (User)session.getAttribute("userInfo");
		System.out.println(user);
		if(user == null){
	%>
		<!-- to display login page -->
		<jsp:forward page="login.jsp"></jsp:forward>
	<% 
		}
		if(message != null){
	%>
		<script>
			alert("<%= message%>");
		</script>
	<%
		message = null;
		}
	%>
	
	
    <nav class="navbar p-0 mb-0" style="border-bottom: 4px black double;">
        <div class="container-fluid" style="background-color: plum; padding:1%">
            <a class="navbar-brand" href="index.jsp">
                <img src="media/logo.png" alt="Logo" width="60" height="60" class="d-inline-block align-text-top">
                <span class="fs-2 fw-bolder align-text-top"
                    style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif">Spring
                    Expenses Tracker</span>
            </a>
            <div style="position:relative; right:30%;">
            	<%
            	UserService service = new UserServiceImpl();
				byte byteArray[] = service.getUserProfileImage(user.getUserId());
				if(byteArray != null){
					String image = Base64.getEncoder().encodeToString(byteArray);
			%>
				<img id="displayImage" src="data:image/jpg;base64,<%= image%>" width="100" height="100" style="border-radius: 100%">
			<% 
				}
			%>
            </div>
            <div class="text-xxl-end" style="font-size: 40px; margin-right: 20px;" id="setting">
                <i class="fa-solid fa-user-gear fa-flip" style="color:black;"></i>
                <ul id="list">
                    <li><a href="UpdateProfile.jsp?userId=<%=user.getUserId()%>">Update Profile</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="Logout">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div id="bgcolor">

    </div>
    <div id="button_Container">
    
    	<%
    		if(user != null){
    	%>
       		 <h1 id="wel">Welcome <%= user.getFullname()%></h1>
       	<%
    		}
       	%>
        
 
        <div class="buttondiv"><button> <a href="addExpenses.jsp"><i class="fa-solid fa-hand-holding-dollar"
                        style="color:white;">

                    </i><i class="fa-solid fa-plus " style="color:white;"></i></a>
                <br><span>Add Expenses</span>
            </button></div>
        <div class="buttondiv"> <button>
                <a href="viewExpenses.jsp" style="color:white;"> <i class="fa-solid fa-eye"></i></a>
                <br><span>View Expenses</span>
            </button></div>
        <div class="buttondiv"> <button> <a href="TotalExpense.jsp" style="color:white;"> &#8721; </a><br>Total
                Expenses</button></div>
        <div class="buttondiv"> <button><a href="FilterExpense.jsp" style="color:white;"><i
                        class="fa-solid fa-filter-circle-dollar"></i></a> <br> Filter
                Expenses</button> </div>
    </div>
    <div id="foo">
        <p>&copy; 2023 JSpiders. All rights reserved.</p>
    </div>
    
</body>

</html>