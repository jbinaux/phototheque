<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.*"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Phototheque</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

	<center>
		<h1>Bienvenue sur la phototheque !</h1>
	</center>

	<HR>

	<%
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String url = "jdbc:mysql://localhost:3306/phototheque";
			String user = "root";
			String pwd = "N-SkV#InP#$/Tm_p2Ce63ruvF5=G";

			Connection cn = (Connection) DriverManager.getConnection(url, user, pwd);

			Statement st = (Statement) cn.createStatement();

			String sql = "SELECT * FROM photo";

			ResultSet result = (ResultSet) st.executeQuery(sql);

			ArrayList<Photo> listePhotos = new ArrayList<Photo>();

			while (result.next()) {
				Photo p = new Photo();

				p.setNom(result.getString("nom"));
				p.setThematique(result.getString("thematique"));
				p.setId(result.getInt("id"));
				p.setDescription(result.getString("description"));
				p.setId_photographe(result.getInt("id_photographe"));

				listePhotos.add(p);
			}

			out.print("<div><table><tr>");
			for (int i = 0; i < listePhotos.size(); i++) {
				if (i % 2 == 0) {
					out.print("</tr><tr>");
				}
				out.print("<td>");
				out.print("<a href=photographe.jsp?id=" + listePhotos.get(i).getId_photographe() + "><image src=\"images/" + listePhotos.get(i).getNom() + "\"></a>");
				out.print("</td>");
			}
			out.print("</tr></table></div>");

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