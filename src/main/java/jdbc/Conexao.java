package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
	public static Connection getConnection(){
		Connection con=null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/TrabLabWeb","postgres","postgres");
			System.out.println("conectado com sucesso");
		} catch (SQLException e) {
			System.out.println("Não pode conectar:"+ e.getMessage());
		} catch (ClassNotFoundException e) {
			System.out.println("Drive não encontrado!");
			e.printStackTrace();
		}
		return con;
	}
}
