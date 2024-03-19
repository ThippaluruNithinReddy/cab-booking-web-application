<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="frm" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>New Vehicle</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <%@ include file="navlinks.jsp" %>
    <hr>
    <h1 class="text-center">New Vehicle</h1>
    <hr>
    <div class="container">
        <frm:form method="post" action="newvehicleinfo" modelAttribute="ve" class="mx-auto">
            <div class="form-group">
                <label for="vehicleName">Vehicle Name:</label>
                <frm:input type="text" path="vehicleName" id="vehicleName" class="form-control" placeholder="Vehicle Name" />
            </div>
            <div class="form-group">
                <label for="vehicleNumber">Vehicle Number:</label>
                <frm:input type="text" path="vehicleNumber" id="vehicleNumber" class="form-control" placeholder="Vehicle Number" />
            </div>
            <div class="form-group">
                <label for="ownerName">Owner Name:</label>
                <frm:input type="text" path="ownerName" id="ownerName" class="form-control" placeholder="Owner Name" />
            </div>
            <div class="form-group">
                <label for="seatingCapacity">Seating Capacity:</label>
                <frm:input type="text" path="seatingCapacity" id="seatingCapacity" class="form-control" placeholder="Seating Capacity" />
            </div>
            <div class="form-group">
                <label for="phone">Phone:</label>
                <frm:input type="text" path="phone" id="phone" class="form-control" placeholder="Phone" />
            </div>
            <button type="submit" class="btn btn-primary btn-block">Add Vehicle</button>
        </frm:form>
        <h3 class="text-center">${info}</h3>
    </div>
</body>
</html>
