<%@page import="java.util.Iterator"%>
<%@page import="common.User_Bean"%>
<%@page import="java.util.List"%>
<%@page import="CRUD.Read_Values"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 .user_data{
	display:flex;
	flex-direction: column;
	font-size:25px;
	justify-content: center;
	align-items:center;
	gap:10px;
 }
 .insertHeading{
 	font-size: 30px;
 	font-weight: bold;
 }
 .displayTable{
 display:flex;
	flex-direction: column;
	font-size:25px;
	justify-content: center;
	align-items:center;
	gap:10px;
 }
</style>
</head>
<body>
	<form action="controller/insert_controller.jsp">
	<div class="user_data">
		<h1 class="insertHeading"> Insert Values</h1>
		<div> SL-Num: <input type="text" name="sl_no"> </div>
		<div> User Name: <input type="text" name="user_name"> </div>
		<div> Mobile: <input type="text" name="mobile"> </div>
		<div> Email: <input type="text"name="email"> </div>
		<input type="submit" value="Insert">
	</div>
	</form>
	<hr>
	<div class="displayTable">
	
<%
Read_Values obj_Read_Values=new Read_Values();
List<User_Bean> list=obj_Read_Values.get_values();
Iterator<User_Bean> it_list=list.iterator();
%>
<table border="1">
<%
while(it_list.hasNext()){
User_Bean obj_User_Bean=new User_Bean();
obj_User_Bean=it_list.next();
%>
<tr>
<td><%=obj_User_Bean.getSl_no() %></td>
<td><%=obj_User_Bean.getUser_name() %></td>
<td><%=obj_User_Bean.getEmail() %></td>
<td><%=obj_User_Bean.getMobile() %></td>
<td>
<a href="edit.jsp?sl_no=<%=obj_User_Bean.getSl_no()%>">Edit</a>
</td>
<td>
<a href="controller/delete_controller.jsp?sl_no=<%=obj_User_Bean.getSl_no()%>">Delete</a>
</td>
</tr>
<%
}
%>
</table>
</div>
</body>
</html>