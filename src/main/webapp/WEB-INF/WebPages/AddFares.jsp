<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="frm" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>New Cab Fare</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <%@ include file="navlinks.jsp" %>
    <hr>
    <h1 class="text-center">New Cab Fare</h1>
    <hr>
    <div class="container">
        <frm:form method="post" action="newcabfareinfo" modelAttribute="cbf" class="mx-auto" id="cabFareForm">
            <div class="form-group">
                <label for="fromLocation">From Location:</label>
                <frm:input type="text" path="fromLocation" id="fromLocation" class="form-control" placeholder="From Location" />
            </div>
            <div class="form-group">
                <label for="toLocation">To Location:</label>
                <frm:input type="text" path="toLocation" id="toLocation" class="form-control" placeholder="To Location" />
            </div>
            <div class="form-group">
                <label for="fare">Fare:</label>
                <frm:input type="text" path="fare" id="fare" class="form-control" placeholder="Fare" />
            </div>
            <button type="submit" class="btn btn-primary btn-block">Add Cab Fare</button>
        </frm:form>
        <h3 class="text-center">${info }</h3>
    </div>

    <script>
        // Function to check if From Location and To Location are different
        function validateLocations() {
            var fromLocation = document.getElementById('fromLocation').value;
            var toLocation = document.getElementById('toLocation').value;

            if (fromLocation === toLocation) {
                alert("From Location and To Location cannot be the same.");
                return false;
            }
            return true;
        }

        // Add event listener to the form submission
        document.getElementById('cabFareForm').addEventListener('submit', function(event) {
            if (!validateLocations()) {
                event.preventDefault(); // Prevent form submission if validation fails
            }
        });
    </script>
</body>
</html>
