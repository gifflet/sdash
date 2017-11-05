package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entidades.Usuario;

public class UsuarioDAO {
	private Connection con = Conexao.getConnection();
	
	public void cadastrar(Usuario usuario){
		String sql = "INSERT INTO USUARIO (nome, email, senha) values (?,?,?)";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, usuario.getNome());
			preparador.setString(2, usuario.getEmail());
			preparador.setString(3, usuario.getSenha());
			preparador.execute();
			preparador.close();
			System.out.println("Usuario Cadastrado com sucesso!");
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	public Usuario autenticar(Usuario usuario){
		String sql = "SELECT *FROM USUARIO WHERE email = ? and senha = ?";
		Usuario usuarioRetorno = null;
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, usuario.getEmail());
			preparador.setString(2, usuario.getSenha());
			ResultSet resultado = preparador.executeQuery();
			if (resultado.next()){
				usuarioRetorno = new Usuario();
				usuarioRetorno.setId(resultado.getInt("id"));
				usuarioRetorno.setNome(resultado.getString("nome"));
				usuarioRetorno.setEmail(resultado.getString("email"));
				usuarioRetorno.setSenha(resultado.getString("senha"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usuarioRetorno;
	}
}