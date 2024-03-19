<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>

    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyD8LCMe5FVFJOgt5tVq6aF9lVJsApQ5r" crossorigin="anonymous">
    
    <style>
        /* Add your custom styles here */
        body {
            padding: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            max-width: 300px;
            margin: 0 auto;
        }

        button {
            margin-top: 10px;
        }

        /* Bootstrap styles for buttons */
        .btn-user {
            background-color: #007bff;
            color: #fff;
        }

        .btn-admin {
            background-color: #dc3545;
            color: #fff;
        }
    </style>
</head>
<body>
    <h1>Welcome to the Home Page!</h1>
    
    <form action="${pageContext.request.contextPath}/redirect" method="post">
        <button type="submit" name="loginType" value="user" class="btn btn-user">User Login</button>
        <button type="submit" name="loginType" value="admin" class="btn btn-admin">Admin Login</button>
    </form>

    <!-- Add Bootstrap JS and Popper.js scripts if needed -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-XeRqgv3Yis3p9VS0C5TRiTEWYEw3eDZO/5bJlUKSvYkR5EMG3eR8v4tEAUJyAyP" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyD8LCMe5FVFJOgt5tVq6aF9lVJsApQ5r" crossorigin="anonymous"></script>
</body>
</html>
