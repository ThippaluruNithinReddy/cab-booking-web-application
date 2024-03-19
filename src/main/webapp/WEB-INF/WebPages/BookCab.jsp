<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="frm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cab Booking</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Add the following script in the <head> section -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 20px;
        }

        hr {
            border-top: 2px solid #007bff;
            margin-top: 20px;
            margin-bottom: 30px;
        }

        h1 {
            color: #007bff;
            text-align: center;
            margin-bottom: 30px;
        }

        form {
            max-width: 500px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        form label {
            font-weight: bold;
            color: #495057;
        }

        form input,
        form select {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ced4da;
            border-radius: 4px;
            box-sizing: border-box;
        }

        form input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }

        table {
            width: 80%;
            margin: 30px auto;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #007bff;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        p.info {
            color: #28a745;
            text-align: center;
            margin-top: 20px;
        }
    </style>

    <!-- Add script for AJAX -->
    <script>
        $(document).ready(function() {
            // Function to fetch fare using AJAX
            function fetchFare() {
                var fromLocation = $('#fromLocation').val();
                var toLocation = $('#toLocation').val();

                $.ajax({
                    url: 'fetchFare', // URL to fetch fare
                    type: 'GET',
                    data: {
                        fromLocation: fromLocation,
                        toLocation: toLocation
                    },
                    success: function(data) {
                        $('#fare').val(data); // Set fetched fare to the fare input field
                    },
                    error: function() {
                        alert('Error fetching fare.');
                    }
                });
            }

            // Event listener for change in from or to location
            $('#fromLocation, #toLocation').change(function() {
                fetchFare(); // Fetch fare on change
            });

            // Initially fetch fare on page load
            fetchFare();
        });
    </script>
</head>
<body>
	
	 <div style="text-align: center; margin-bottom: 20px;">
        <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">Logout</a>
    </div>

    <hr />
    <h1 style="text-align: center">New Cab Booking</h1>
    <hr />
    <frm:form method="post" action="newcabbookinginfo" modelAttribute="bookCab"> 
        <p style="text-align: center">
            <label>Date: </label>
            <frm:input type="date" path="date" value="${bookCab.date}" />
            <br /><br />
            <label>From Location: </label>
            <frm:select path="fromLocation" id="fromLocation">
                <frm:option value="" label="Select From" />
                <frm:options items="${cabFares}" itemValue="fromLocation" itemLabel="fromLocation" />
            </frm:select>
            <br /><br />
            <label>To Location: </label>
            <frm:select path="toLocation" id="toLocation">
                <frm:option value="" label="Select To" />
                <frm:options items="${cabFares}" itemValue="toLocation" itemLabel="toLocation" />
            </frm:select>
            <br /><br />
            <label>Fare: </label>
            <frm:input type="text" path="fare" id="fare" placeholder="Fare" readonly="readonly" />

            <br /><br />
            
            <label>Vehicle Number: </label>
            <frm:select path="vehicleNumber">
                <frm:option value="" label="Select Vehicle" />
                <frm:options items="${vehicles}" itemValue="vehicleNumber" itemLabel="vehicleName" />
            </frm:select>
            <br /><br />
            <label>Customer Name: </label>
            <frm:input type="text" path="customerName" placeholder="Customer Name" />
            <br /><br />
            <label>Phone: </label>
            <frm:input type="text" path="phone" placeholder="Phone" />
            <br /><br />
            <input type="submit" value="Book Cab" />
            <br /><br />
        </p>
    </frm:form>

    <h1 style="text-align: center">User Bookings</h1>
    
    <c:if test="${not empty userBookings}">
        <table border="1" align="center">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Date</th>
                    <th>From Location</th>
                    <th>To Location</th>
                    <th>Vehicle Number</th>
                    <th>Fare</th>
                   
                    <!-- Add other columns as needed -->
                </tr>
            </thead>
            <tbody>
                <c:forEach var="booking" items="${userBookings}">
                    <tr>
                        <td>${booking.bookId}</td>
                        <td>${booking.date}</td>
                        <td>${booking.fromLocation}</td>
                        <td>${booking.toLocation}</td>
                        <td>${booking.vehicleNumber}</td>
                        <td>${booking.fare }</td>
                        <!-- Add other columns as needed -->
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    
    <p style="text-align: center">${info}</p>

</body>
</html>
