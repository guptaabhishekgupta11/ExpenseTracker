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
    <link rel="icon" href="logo.png">

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
        }

        #frm {
            width: 80%;
            border: double 5px blueviolet;
            padding: 6%;
            padding-top: 3%;
            padding-bottom: 3%;
            position: absolute;
            top: 8%;
            left: 10%;
            background-image: radial-gradient(skyblue, white);
        }

        .form-group {
            margin-top: 1%;
            margin-bottom: 1%;

        }

        label {
            margin-bottom: 1%;
            font-size: 25px;
        }

        .container {
            position: relative;
            bottom: 2%;
            height: 75vh;

        }

        .form-control {
            text-align: center;
            padding: 1%;
        }

        ul {
            padding-top: 30px;
            list-style-type: none;
            font-size: 20px;
            text-align: center;
            font-weight: bolder;
            /* background-color: red; */
        }

        #list li {
            padding-bottom: 0px;
        }

        li a {
            text-decoration: none;
            color: black;
            position: relative;
            z-index: 1;
        }

        li:hover {
            background-color: skyblue;
        }

        #list {
            display: none;
            position: absolute;
            right: 2%;
            top: 40%;
            /* background-color: red;*/
        }

        #setting:hover #list {
            display: block;
        }

        a {
            height: 100%;
        }

        li {
            height: 40px;
        }
    </style>
</head>

<body style="overflow: hidden;">
	<%
		User user = (User)session.getAttribute("userInfo");
	%>
    <nav class="navbar p-0 mb-0" style="border-bottom: 4px black double;">
        <div class="container-fluid" style="background-color: plum; padding:1%">
            <a class="navbar-brand" href="index.html">
                <img src="logo.png" alt="Logo" width="60" height="60" class="d-inline-block align-text-top">
                <span class="fs-2 fw-bolder align-text-top"
                    style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif">Spring
                    Expenses Tracker</span>
            </a>
            <a href="Home.jsp" style="color: green; position: absolute; right:42%; ">
                <span class="text-xxl-end" style="font-size: 40px;"><i class=" fa-solid fa-house"></i></span>
            </a>
            <div class="text-xxl-end" style="font-size: 40px; margin-right: 20px;" id="setting">
                <i class="fa-solid fa-user-gear fa-flip" style="color:black;"></i>
                <div id="list">
                    <ul>
                        <li><a href="UpdateProfile.jsp?userId=<%=user.getUserId()%>">Update Profile</a></li>   
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="Logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <center>
        <div class="container">
            <form id="frm" action="FilterExpense">
                <h1 style="font-family: fantasy; letter-spacing: 20px; margin-bottom: 2%;">Filter Expense</h1>
                <div class="form-group">
                    <label for="exampleInputEmail1">Select Date</label>
                    <input type="date" class="form-control" name="date">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Select Category</label>
                    <input type="text" class="form-control" list="sub" name="category" value="category">
                    <datalist id="sub">
                        <option>Utilities</option>
                        <option>Transportation</option>
                        <option>Groceries</option>
                        <option>Dining out</option>
                        <option>Entertainment</option>
                        <option>HealthCare</option>
                        <option>Education</option>
                        <option>PersonalCare</option>
                        <option>Clothing</option>
                        <option>HomeMaintainance</option>
                        <option>Gifts&Donations</option>
                        <option>Saving&investments</option>
                        <option>Tax</option>
                        <option>Others</option>
                    </datalist>
                </div>
                <div class="form-group">
                    <label for="exampleInputCategory">Select Amount</label>
                    <select class="form-control"  name="amount">
                    	<option>-Select-</option>
                        <option>100-500</option>
                        <option>500-1500</option>
                        <option>1500-2500</option>
                        <option>2500-4000</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </center>
    <div id="foo">
        <p>&copy; 2023 JSpiders. All rights reserved.</p>
    </div>
</body>

</html>