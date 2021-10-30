<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("message");
%>
<%@ include file="/views/common/header.jsp" %>
	<div id="imageArea2">
		<img id="errorImage" src="<%= request.getContextPath() %>/resources/images/error2.png">
		<h1 id="msgArea"><%= msg %></h1>
	</div>
<%@include file="/views/common/footer.jsp" %>