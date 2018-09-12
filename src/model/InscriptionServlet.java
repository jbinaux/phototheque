package model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InscriptionServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			java.sql.Date date_de_naissance = (java.sql.Date)sdf.parse(request.getParameter("date_naissance"));
			String email = request.getParameter("email");
			String password = request.getParameter("mot de passe");
			String bio = request.getParameter("bio");

			Class.forName("com.mysql.jdbc.Driver");

			String url = "jdbc:mysql://localhost:3306/bibliotheque_db_2";
			String user = "root";
			String pwd = "N-SkV#InP#$/Tm_p2Ce63ruvF5=G";

			Connection con = DriverManager.getConnection(url, user, pwd);

			PreparedStatement ps = con.prepareStatement("insert into photographe(`nom`,`prenom`,`date_naissance`,`bio`,`mot_de_passe`,`email`) values(?,?,?,?,?,?)");
			ps.setString(1, nom);
			ps.setString(2, prenom);
			ps.setDate(3, date_de_naissance);
			ps.setString(4, bio);
			ps.setString(5, password);
			ps.setString(6, email);

			int s = ps.executeUpdate();
			if (s > 0) {
				RequestDispatcher rd = request.getRequestDispatcher("inscription.jsp");
				rd.forward(request, response);
			} else {
				System.out.print("sorry!please fill correct detail and try again");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("sorry!please fill correct detail and try again");
		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
