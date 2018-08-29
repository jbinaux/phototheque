<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		try {
			String id = request.getParameter("id");
			Class.forName("com.mysql.jdbc.Driver");

			String url = "jdbc:mysql://localhost:3306/phototheque";
			String user = "root";
			String pwd = "N-SkV#InP#$/Tm_p2Ce63ruvF5=G";

			Connection cn = (Connection) DriverManager.getConnection(url, user, pwd);

			Statement st = (Statement) cn.createStatement();

			String sql = "SELECT * FROM photographe WHERE id = " + id;

			ResultSet result = (ResultSet) st.executeQuery(sql);

			Photographe p = new Photographe();

			result.next();
			p.setNom(result.getString("nom"));
			p.setPrenom(result.getString("prenom"));
			p.setDateNaissance(result.getDate("date_naissance"));
			p.setBio(result.getString("bio"));
			
			out.print("<center><h1>" + p.getPrenom() + " " + p.getNom() + "</h1></center>");

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

		}
	%>

</body>
</html>