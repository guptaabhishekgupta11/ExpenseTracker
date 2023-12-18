<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense Tracker</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@40,600,0,0" />
<style type="text/css">
body {
	color: blue;
	width: "300px";
}

.head {
	background-color: rgb(190, 98, 163);
	background-attachment: fixed;
}

@charset "ISO-8859-1";

img {
	width: 60vw;
	height: 60vh;
	margin-left: 10vw;
	margin-top: 20vh;
	position: absolute;
}

h1 {
	color: red;
	font-size: large;
}

#profile {
	position: relative;
	top: 0px;
	left: 800px;
	animation-name: profil;
	animation-duration: 2s;
	animation-timing-function: linear;
	animation-iteration-count: infinite;
}

.ab {
	position: relative;
	top: 100px;
	left: 100px;
	width: 550px;
	height: 450px;
}

.con {
	position: relative;
	bottom: 250px;
	left: 750px;
	width: 500px;
	height: 300px;
	font-size: x-large;
	font-family: sans-serif;
}
</style>
</head>
<body>
	<div class="head">
		<table>
			<tr>
				<td><img src="media/icon.png" alt="SpringExpencesTracker"
					height="60px" width="100px"
					style="padding-top: 10px; padding-left: 10px;"></td>
				<td><h1>Spring Expences Tracker</h1></td>
				<td id="profile"><a href="login.jsp"><span class="material-symbols-outlined"> manage_accounts </span></a></td>
			</tr>
		</table>
	</div>
	<img alt="" src="./expense.png" class="ab">

	<div class="con">
		<p id="paragraph">Expenses Tracker Simplify your personal
			reimbursement management</p>
		<br>
		<p id="paragraph">Expense Tracker is used by user's to record
			their daily routine expenses in a digital and hassle free way as
			opposed to the conventional manual documentation of expenses</p>
	</div>
</body>
</html>