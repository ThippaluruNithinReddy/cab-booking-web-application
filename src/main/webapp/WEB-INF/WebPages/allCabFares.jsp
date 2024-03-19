<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="coms.CabBooking.CabBooking.entities.CabFare" %>
<%@ page import="java.util.List" %>
<%@ page import="coms.CabBooking.CabBooking.service.CabFareService" %>
<%@ page import="coms.CabBooking.CabBooking.service.CabFareServiceImpl" %>

<%
    CabFareService cabFareService = new CabFareServiceImpl();
    List<CabFare> cbflist = null;

    try {
        cbflist = cabFareService.getAllCabFares();
        pageContext.setAttribute("cbflist", cbflist);
    } catch (Exception e) {
        e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>All Cab Fares</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <%@ include file="navlinks.jsp" %>
    <div class="container">
        <h2 class="text-center">Cab Booking System: All Cab Fares</h2>
    </div>

    <div class="container">
        <h2>All Cab Fares</h2>

        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Cab Id</th>
                    <th>From Location</th>
                    <th>To Location</th>
                    <th>Fare</th>
                    <th>Action</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cbf" items="${cbflist}">
                    <tr>
                        <td><c:out value="${cbf.id}" /></td>
                        <td><c:out value="${cbf.fromLocation}" /></td>
                        <td><c:out value="${cbf.toLocation}" /></td>
                        <td><c:out value="${cbf.fare}" /></td>
                        <td>
                            <a href="#" class="btn btn-primary" onclick="showUpdateForm('${cbf.id}', '${cbf.fromLocation}', '${cbf.toLocation}', '${cbf.fare}')">Update</a>
                        </td>
                        <td>
                            <a href="#" class="btn btn-danger" onclick="deleteCabFare('${cbf.id}')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Update form -->
    <div id="updateForm" class="update-form container" style="display: none;">
        <form action="updateCabFare" method="post">
            <input type="hidden" id="updateId" name="id" value="">
            <div class="form-group">
                <label for="updateFromLocation">From Location:</label>
                <input type="text" id="updateFromLocation" name="fromLocation" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="updateToLocation">To Location:</label>
                <input type="text" id="updateToLocation" name="toLocation" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="updateFare">Fare:</label>
                <input type="text" id="updateFare" name="fare" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success">Update Cab Fare</button>
        </form>
    </div>

    <script>
        function showUpdateForm(id, fromLocation, toLocation, fare) {
            // Set values in the update form based on the Cab Fare ID
            document.getElementById("updateId").value = id;
            document.getElementById("updateFromLocation").value = fromLocation;
            document.getElementById("updateToLocation").value = toLocation;
            document.getElementById("updateFare").value = fare;

            // Display the update form
            document.getElementById("updateForm").style.display = "block";
        }

        function deleteCabFare(id) {
            if (confirm("Are you sure you want to delete this Cab Fare?")) {
                // Redirect to the delete-CabFare endpoint with the Cab Fare ID as part of the path
                window.location.href = "delcbf/" + id;
            }
        }
    </script>
</body>
</html>
