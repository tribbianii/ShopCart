<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.demo.service.*, com.demo.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="service" class="com.demo.service.ProductService" />
<%
	String name = request.getParameter("name");
	double price = Double.parseDouble(request.getParameter("price"));
	String seller = request.getParameter("seller");
	int num = service.insert(name, price, seller);
	
if (num > 0)
	
	out.println("inserted!");
else 
	out.println("no inserted!");
	
%>
</body>
</html>