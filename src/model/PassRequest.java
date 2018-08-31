package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PassRequest {

	public String recupererMdp(String email) {
		String url = "jdbc:mysql://localhost/phototheque";
		String user = "root";
		String pwd = "N-SkV#InP#$/Tm_p2Ce63ruvF5=G";

		Connection cn = null;
		Statement st = null;
		String password = null;

		// connexion avec le driver
		try {
			// chargement du Driver
			Class.forName("com.mysql.jdbc.Driver");
			// recuperation de la connexion
			cn = DriverManager.getConnection(url, user, pwd);
			// creation d un statement
			st = cn.createStatement();
			String sql = "SELECT * FROM phototheque.photographe WHERE email = '" + email + "'";
			// execution requete
			ResultSet result = st.executeQuery(sql);

			while (result.next()) {
				password = result.getString("mot_de_passe");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				cn.close();
				st.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return password;
	}
}
