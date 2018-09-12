<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form action="InscriptionServlet" method="post">
		<table>
			<tr>
				<td>nom :</td>
				<td><input type="text" name="nom"></td>
			</tr>
			<tr>
				<td>prenom :</td>
				<td><input type="text" name="prenom"></td>
			</tr>
			<tr>
				<td>date de naissance :</td>
				<td><input type="date" name="date_naissance" value="yyyy-mm-dd"></td>
			</tr>
			<tr>
				<td>mot de passe :</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>email :</td>
				<td><input type="email" name="email"></td>
			</tr>
			<tr>
				<td>bio :</td>
				<td><textarea name="bio"></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="register"></td>
			</tr>
			</table>
	</form>

</body>
</html>