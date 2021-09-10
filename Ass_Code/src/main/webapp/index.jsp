<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<table border="1">
		<tr style="background-color:blueviolet; font-weight:bold">
			<th>Book Id</th>
			<th>Book Name</th>
			<th>Author Name</th>
		</tr>
	<%
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/indicus","root","root");
			st=con.createStatement();
			String query="select b.bookId,b.title,a.name ,a.authorid from book as b ,author as a ,bookauthor as i where i.bookid=b.bookid and i.authorid=a.authorid ";
			rs=st.executeQuery(query);
			while(rs.next())
			{
	%>
		<tr bgcolor="#DEB887">

			<td><%=rs.getInt(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
		</tr>
	<% 
				
			}
		}
		catch(Exception e)
		{
			
		}
	%>
	</table>	

</body>
</html>