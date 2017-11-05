package jdbc;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
	public static Connection getConnection(){
		Connection con=null;
		try {
			Class.forName("org.postgresql.Driver");
			URI dbUri = new URI(System.getenv("DATABASE_URL"));
			String username = dbUri.getUserInfo().split(":")[0];
		    String password = dbUri.getUserInfo().split(":")[1];
		    String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
			con = DriverManager.getConnection(dbUrl, username, password);
			System.out.println("conectado com sucesso");
		} catch (URISyntaxException e) {
			System.out.println("Error URI: "+ e.getMessage());
		} catch (SQLException e) {
			System.out.println("Não pode conectar: "+ e.getMessage());
		} catch (ClassNotFoundException e) {
			System.out.println("Drive não encontrado!");
			e.printStackTrace();
		}
		return con;
	}
}
