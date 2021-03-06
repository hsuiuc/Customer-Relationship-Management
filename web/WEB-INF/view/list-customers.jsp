<%--
  Created by IntelliJ IDEA.
  User: haosun
  Date: 6/24/18
  Time: 11:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
List Customers - coming soon ...

    <div id="wrapper">
        <div id="header">
            <h2>CRM - Customer Relationship Management</h2>
        </div>
    </div>

    <div id="container">
        <div id="content">
            <input type="button" value="Add Customer" onclick="window.location.href='showFormForAdd'; return false;" class="add-button">

            <!-- add html form here -->
            <table>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Update</th>
                </tr>

                <!-- loop over and print each customer -->
                <c:forEach var="tempCustomer" items="${customers}">
                    <%--construct an update link with customer id--%>
                    <c:url var="updateLink" value="/customer/showFormForUpdate">
                        <c:param name="customerId" value="${tempCustomer.id}"></c:param>
                    </c:url>
                    <%--construct an update link with customer id--%>
                    <c:url var="deleteLink" value="/customer/delete">
                        <c:param name="customerId" value="${tempCustomer.id}"></c:param>
                    </c:url>
                    <tr>
                        <td>${tempCustomer.firstName}</td>
                        <td>${tempCustomer.lastName}</td>
                        <td>${tempCustomer.email}</td>
                        <td>
                            <a href="${updateLink}">Update</a>
                            |
                            <a href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

</body>
</html>
