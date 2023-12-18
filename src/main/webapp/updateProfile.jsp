<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.jsp.expanseTracker.Dao.*"%>
<%@page import="com.jsp.expanseTracker.entity.*"%>
<%@page import="com.jsp.expanseTracker.service.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Profile</title>
<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

body {
	background: linear-gradient(to right, #3494e6, #ec6ead);
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

#mainContainer {
	max-width: 400px;
	margin: 0 auto;
	padding: 20px;
	display: flex;
	flex-direction: column;
	background: linear-gradient(to right, #3494e6, #ec6ead);
	border-radius: 12px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	color: #fff;
	font-family: 'Arial', sans-serif;
}

form {
	width: 100%;
}

h1 {
	text-align: center;
	margin-bottom: 20px;
	font-size: 24px;
}

label {
	font-weight: bold;
	margin-bottom: 5px;
	color: #fff;
}

input {
	width: 100%;
	padding: 12px;
	margin-top: 8px;
	margin-bottom: 16px;
	border: none;
	border-radius: 6px;
	box-sizing: border-box;
	transition: background-color 0.3s, color 0.3s;
}

input[type="file"] {
	padding: 10px;
}

input:focus {
	background-color: #fff;
	color: #3494e6;
}

input[type="button"] {
	background-color: #57b846;
	color: white;
	cursor: pointer;
	padding: 14px;
	border: none;
	border-radius: 6px;
	font-size: 18px;
	transition: background-color 0.3s;
}

input[type="button"]:hover {
	background-color: #4ca43c;
}

#previewImage {
	max-width: 100%;
	height: auto;
	margin-bottom: 16px;
	border-radius: 6px;
	display: none;
}
</style>
</head>
<body>

	<%
	// Assuming you have set the "user" attribute in your servlet
	int userId = Integer.parseInt(request.getParameter("userId"));
	UserService service = new UserServiceImpl();
	User user = service.findByUserId(userId);
	%>
	
	<div id="mainContainer">
		<form action="UpdateProfile" id="form">
			<div>
				<h1>Update Your Profile</h1>
			</div>
			<div>
				<label for="username">Username</label> <input type="text"
					id="username" value="<%=user.getUsername()%>" required>
				/>
			</div>
			<div>
				<label for="email">Email</label> <input type="email" id="email"
					value="<%=user.getEmail()%>" required />
			</div>
			<div>
				<label for="mobile">Mobile</label> <input type="text" id="mobile"
					value="<%=user.getMobile()%>" required />
			</div>
			<div>
				<label for="password">Password</label> <input type="password"
					id="password" required value="<%=user.getPassword()%>" />
			</div>
			<div>
				<label for="Profile">Profile picture</label> <input type="file"
					id="fileInput" accept="image/*" name="imageFile" />
			</div>
			<div>
				<img id="displayImage" alt="Preview Image"> 
				<input name="id" type="number" hidden value=<%=user.getUserid()%> >
					
			</div>

			<div>
				<input type="button" value="Update Profile" />
			</div>
		</form>
	</div>

	<script>
       
	const fileInput = document.getElementById('fileInput');
	const displayImage = document.getElementById('displayImage');

	fileInput.addEventListener("change", function(){
	    const file = fileInput.files[0];
	    if (file && file.type.startsWith('image/')) {
	        const reader = new FileReader();

	        reader.onload = function (e) {
	            displayImage.src = e.target.result;
	            displayImage.style.display = 'block';
	        };

	        reader.readAsDataURL(file);
	    }
	});

			
           
    </script>
</body>
</html>
