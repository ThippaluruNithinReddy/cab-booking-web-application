<%@ page language="java" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Navigation</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            padding: 20px;
        }

        .navbar {
            margin-bottom: 30px;
        }

        .navbar-nav .nav-link {
            color: #007bff;
        }

        .navbar-nav .nav-link:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">Navigation</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="addfares">Add Fares</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addvehicle">Add Vehicle</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="allCabFares">All Cab Fares</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="allVehicles">All Vehicles</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="viewBookings">View Bookings</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/home">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>
