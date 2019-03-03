<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.demo.service.*, com.demo.model.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="service" class="com.demo.service.ProductService" />
<a href="insert.html"><img src="icon/add.png"></a>
<%
    ArrayList<Product> list = service.viewAll();
	if (list != null && list.size() > 0) {
%>
	<table class="table table-striped table-hover">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Seller</th>
        </tr>
        
<%
		for (Product p : list) {
%>		
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getName() %></td>
            <td><%= p.getPrice() %></td>
            <td><%= p.getSeller() %></td>
            <td><a href="delet.jsp"><img src="icon/delete.png"></a></td>
        </tr>
<% 
		}
   	} else {
   		out.println("No product!");
   	}
%>        
	
    </table>
</body>
</html>