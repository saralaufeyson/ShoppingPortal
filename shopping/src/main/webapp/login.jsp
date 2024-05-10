<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f2f2f2;
             background-image: url('https://ilarge.lisimg.com/image/2832867/740full-clara-alonso.jpg');
            background-size: cover;
            background-position: center;
            
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center
        }
        form {
            width: 25%;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 2rem;
            border: 1px solid #ccc;
            border-radius: 5px;
           
             box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1), 0 0 10px 5px rgba(255, 255, 255, 0.5);
            transition: box-shadow 0.3s ease;
        }
        h1 {
            background-color: #333;
            color: #fff;
            margin: 0;
            padding: 1rem;
            text-align: center;
        }
        label {
            display: block;
            margin-bottom: 0.5rem;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 0.5rem;
            margin-bottom: 0.5rem;
        }
        input[type="submit"] {
            padding: 0.5rem;
            background-color: #333;
            color: #fff;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="loginForm" action="login" method="post">
        <h1>Login</h1>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        <input type="submit" value="login">
    </form>
    <script>
        document.getElementById("loginForm").addEventListener("submit", function(event) {
            event.preventDefault();
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;

            // Authenticate the user
            if (username === "laya" && password === "123") {
                // Redirect the user to the index.jsp page
                window.location.href = "index.jsp";
            } else {
                // Display an error message
                alert("Invalid username or password");
            }
        });
    </script>
</body>
</html>