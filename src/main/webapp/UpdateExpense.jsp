<%@page import="com.jsp.expanseTracker.entity.Expense"%>
<%@page import="com.jsp.expanseTracker.service.ExpenseServiceImpl"%>
<%@page import="com.jsp.expanseTracker.service.ExpenseService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <link rel="stylesheet" href="https://fontawesome.com/icons/hand-holding-dollar?f=classic&s=solid"> -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
	background: radial-gradient(circle at center, red, maroon);
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
	width: 10vw;
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

#section1 {
	width: 50%;
	height: 90%;
	display: flex;
	justify-content: center;
	align-items: center;
}

#section2 {
	width: 50%;
	height: 90%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: space-evenly;
}

.expense {
	background-color: rgba(255, 255, 255, 0);
	font-size: 25px;
	color: white;
}

#innerDiv {
	margin-top: 10vh;
	background: radial-gradient(circle at center, rgb(241, 183, 223),
		rgb(184, 24, 134));
	width: 70vw;
	height: 80vh;
	border-radius: 15px;
	display: flex;
}

input {
	text-align: center;
	border-radius: 10px;
}
</style>
<script src="https://kit.fontawesome.com/745fad844e.js"
	crossorigin="anonymous"></script>

</head>

<body>
	<%
	int eId = Integer.parseInt(request.getParameter("expenseId"));
	ExpenseService expenseService = new ExpenseServiceImpl();
	Expense expense = expenseService.findExpenseById(eId);
	%>
	<div id="container">
		<div id="nav-bar">
			<div>
				<b>spring Expense Tracker</b>
			</div>
			<a href="home.jsp"><i class="fa-solid fa-house"></i></a>
			<div id="icon" onmouseover="showMenu()" onmouseout="hideMenu()">
				<i> <span class="material-symbols-outlined">
						manage_accounts </span>
				</i>
			</div>
		</div>
		<form action="UpdateExpense?expenseId=<%=eId%>">
			<div id="display">
				<div id="innerDiv">
					<section id="section1">
						<img src="media/Untitled.png" alt="">
					</section>

					<section id="section2">
						<aside>
							<b>Update Expense</b>
						</aside>
						<aside>
							<input value="<%=expense.getExpenseId()%>" hidden name="eId">
						</aside>
						<aside>
							<input type="text" placeholder="Amount" style="width: 21.5vw;"
								name="amount" value="<%=expense.getAmount()%>">
						</aside>
						<aside>
							<input type="date" placeholder=""
								style="width: 21.5vw; height: 2.5vh;" name="date"
								value="<%=expense.getDate()%>">
						</aside>
						<aside>
							<select id=""
								style="width: 21.5vw; height: 3vh; border-radius: 10px; text-align: center;"
								name="category" value="<%=expense.getCategory()%>">
								<option value="">category</option>
								<option value="Utilities">Utilities</option>
								<option value="Transportation">Transportation</option>
								<option value="Groceries">Groceries</option>
								<option value="DiningOut">DiningOut</option>
								<option value="Entertainment">Entertainment</option>
								<option value="HealthCare">HealthCare</option>
								<option value="Education">Education</option>
								<option value="PersonalCare">PersonalCare</option>
								<option value="Clothing">Clothing</option>
								<option value="Hom Maintainance">Home Maintenance</option>
								<option value="Gifts&Donations">Gifts & Donations</option>
								<option value="Saving&investments">Saving & investments</option>
								<option value="Tax">Tax</option>
								<option value="Others">Others</option>
							</select>
						</aside>
						<aside>
							<textarea id="" cols="19.5" rows="8"
								style="border-radius: 10px; width: 21.5vw;" name="description"><%=expense.getDescription()%></textarea>
						</aside>
						<button
							style="width: 12vw; height: 3vh; background-color: rgb(89, 232, 103); border-radius: 10px;">
							<aside>
								Add <i class="fa-solid fa-plus"></i>
							</aside>
						</button>
					</section>

				</div>
			</div>
	</div>
	</form>
	<div id="menu" onmouseover="showMenu()" onmouseout="hideMenu()">
		<table border="2px" cellspacing="0px"
			style="margin-top: 5vh; border-radius: 10px">
			<tr class=".btn">
				<td onclick="location.href='UpdateExpense.jsp'"
					style="border-radius: 10px;">update profile</td>
			</tr>
			<tr class=".btn">
				<td onclick="location.href='#'">About Us</td>
			</tr>
			<br>
			<tr class=".btn">
				<td onclick="location.href='contact.jsp'">Contact Us</td>
			</tr>
			<br>
			<tr class=".btn">
				<td onclick="location.href='login.jsp'">logout</td>
			</tr>
		</table>
	</div>

</body>
<script>
	function showMenu() {
		document.getElementById("menu").style.zIndex = 1;
	}

	function hideMenu() {
		document.getElementById("menu").style.zIndex = -1;
	}
</script>
</html>