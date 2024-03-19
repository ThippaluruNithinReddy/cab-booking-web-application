<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Bookings</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            margin-top: 20px;
            margin-bottom: 30px;
            font-weight: bold;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }
        th, td {
            border: 1px solid #dee2e6;
            padding: 10px;
        }
        thead {
            background-color: #f8f9fa;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<%@ include file="navlinks.jsp" %>
    <div class="container">
        
        <h1>View All Bookings</h1>
        <table class="table table-striped table-bordered">
            <thead class="thead-light">
                <tr>
                    <th>Booking ID</th>
                    <th>Date</th>
                    <th>From Location</th>
                    <th>To Location</th>
                    <th>Fare</th>
                    <th>Vehicle</th>
                    <th>Customer Name</th>
                    <th>Phone</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${bookingList}" var="booking">
                    <tr>
                        <td>${booking.bookId}</td>
                        <td>${booking.date}</td>
                        <td>${booking.fromLocation}</td>
                        <td>${booking.toLocation}</td>
                        <td>${booking.fare}</td>
                        <td>${booking.vehicleNumber}</td>
                        <td>${booking.customerName}</td>
                        <td>${booking.phone}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
