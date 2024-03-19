<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="coms.CabBooking.CabBooking.entities.Vehicle" %>
<%@ page import="java.util.List" %>
<%@ page import="coms.CabBooking.CabBooking.service.VehicleDetailsService" %>
<%@ page import="coms.CabBooking.CabBooking.service.VehicleDetailsServiceImpl" %>

<%
    VehicleDetailsService vehicleService = new VehicleDetailsServiceImpl();
    List<Vehicle> vehicleList = null;

    try {
        vehicleList = vehicleService.getAllVehicles();
        pageContext.setAttribute("vehicleList", vehicleList);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>All Vehicles</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
</head>
<body>
    <%@ include file="navlinks.jsp" %>
    <div class="container">
        <h2 class="text-center">Cab Booking System: All Vehicles</h2>
    </div>

    <div class="container">
        <h2>All Vehicles</h2>

        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Vehicle ID</th>
                    <th>Vehicle Name</th>
                    <th>Vehicle Number</th>
                    <th>Owner Name</th>
                    <th>Seating Capacity</th>
                    <th>Phone</th>
                    <th>Action</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="vehicle" items="${vehicleList}">
                    <tr>
                        <td><c:out value="${vehicle.vid}" /></td>
                        <td><c:out value="${vehicle.vehicleName}" /></td>
                        <td><c:out value="${vehicle.vehicleNumber}" /></td>
                        <td><c:out value="${vehicle.ownerName}" /></td>
                        <td><c:out value="${vehicle.seatingCapacity}" /></td>
                        <td><c:out value="${vehicle.phone}" /></td>
                        <td>
                            <a href="#" class="btn btn-primary" onclick="showUpdateForm('${vehicle.vid}', '${vehicle.vehicleName}', '${vehicle.vehicleNumber}', '${vehicle.ownerName}', '${vehicle.seatingCapacity}', '${vehicle.phone}')">Update</a>
                        </td>
                        <td>
                            <a href="<c:url value='/deleteVehicle/'/>${vehicle.vid}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this Vehicle?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Update form -->
    <div id="updateForm" class="update-form container" style="display: none;">
        <form action="updateVehicle" method="post">
            <input type="hidden" id="updateId" name="vid" value="">
            <div class="form-group">
                <label for="updateVehicleName">Vehicle Name:</label>
                <input type="text" id="updateVehicleName" name="vehicleName" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="updateVehicleNumber">Vehicle Number:</label>
                <input type="text" id="updateVehicleNumber" name="vehicleNumber" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="updateOwnerName">Owner Name:</label>
                <input type="text" id="updateOwnerName" name="ownerName" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="updateSeatingCapacity">Seating Capacity:</label>
                <input type="text" id="updateSeatingCapacity" name="seatingCapacity" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="updatePhone">Phone:</label>
                <input type="text" id="updatePhone" name="phone" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success">Update Vehicle</button>
        </form>
    </div>

    <script>
        function showUpdateForm(vid, vehicleName, vehicleNumber, ownerName, seatingCapacity, phone) {
            // Set values in the update form based on the Vehicle ID
            document.getElementById("updateId").value = vid;
            document.getElementById("updateVehicleName").value = vehicleName;
            document.getElementById("updateVehicleNumber").value = vehicleNumber;
            document.getElementById("updateOwnerName").value = ownerName;
            document.getElementById("updateSeatingCapacity").value = seatingCapacity;
            document.getElementById("updatePhone").value = phone;

            // Display the update form
            document.getElementById("updateForm").style.display = "block";
        }
    </script>

</body>
</html>
