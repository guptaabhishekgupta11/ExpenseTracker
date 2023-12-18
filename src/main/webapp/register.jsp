<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Registration Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #45aaf2, #8e44ad);
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        table {
            width: 400px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            border: 2px solid #3498db;
        }

        tr {
            text-align: center;
        }

        input {
            height: 40px;
            width: 90%;
            border: 1px solid #3498db;
            border-radius: 5px;
            margin: 3px;
            padding: 5px;
            box-sizing: border-box;
            color: #555;
            transition: border-color 0.3s;
        }

        input:focus {
            border-color: #e74c3c;
        }

        button {
            background: linear-gradient(to right, #3498db, #55a1d8);
            color: #fff;
            height: 40px;
            width: 94%;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }

        button:hover {
            background: linear-gradient(to right, #2980b9, #4fa3d1);
        }

        td {
            padding: 10px;
        }

        i {
            color: #f39c12;
            margin-left: -30px;
            cursor: pointer;
            margin-top: 10px;
            transition: color 0.3s;
        }

        i:hover {
            color: #e74c3c;
        }

        /* Additional Styling for Background Color */
        body {
            background: linear-gradient(to right, #45aaf2, #8e44ad);
        }

        table {
            background: linear-gradient(to right, #78ffd6, #a8ff78);
            border: 2px solid #78ffd6;
        }

        button {
            background: linear-gradient(to right, #78ffd6, #a8ff78);
        }
    </style>
    <script>
        function showpwd() {
            var pwdInput = document.getElementById("pwd");
            var eyeIcon = document.getElementById("eye");

            if (pwdInput.type === "password") {
                pwdInput.type = "text";
                eyeIcon.classList.remove("fa-eye");
                eyeIcon.classList.add("fa-eye-slash");
            } else {
                pwdInput.type = "password";
                eyeIcon.classList.remove("fa-eye-slash");
                eyeIcon.classList.add("fa-eye");
            }
        }
    </script>
</head>
<body>
    <table>
        <form action="Registration" method="post">
            <tr>
                <td colspan="2" style="font-size: larger; font-weight: 700; color: #f39c12;">Register </td>
            </tr>
            <tr>
                <td><input type="text" name="fullname" placeholder="Your Name"></td>
            </tr>
            <tr>
                <td><input type="text" name="username" placeholder="Your Username"></td>
            </tr>
            <tr>
                <td><input type="text" name="email" placeholder="Your Email"></td>
            </tr>
            <tr>
                <td><input type="text" name="mobile" placeholder="Your Mobile"></td>
            </tr>
            <tr>
                <td>
                    <input type="password" name="password" id="pwd" placeholder="Password">
                    <i class="fa fa-eye" id="eye" onclick="showpwd()"></i>
                </td>
            </tr>
            <tr>
                <td><input type="password" name="cpassword" placeholder="Repeat Password"></td>
            </tr>
            <tr>
                <td><button type="submit">Sign Up</button></td>
            </tr>
            <tr>
                <td align="center" onclick="login()" style="cursor: pointer; color: #f39c12;">Already have an account? <a href="./login.jsp">Login Here</a></td>
            </tr>
        </form>
    </table>
</body>
</html>
