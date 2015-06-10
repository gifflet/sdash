package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	public void alterar (Usuario usuario){
		String sql = "UPDATE USUARIO SET nome=?, email=?, senha=? where id=?";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, usuario.getNome());
			preparador.setString(2, usuario.getEmail());
			preparador.setString(3, usuario.getSenha());
			preparador.setInt(4, usuario.getId());
			preparador.execute();
			preparador.close();
			System.out.println("Usuario Alterado com sucesso!");
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	public void excluir (Usuario usuario){
		String sql = "DELETE FROM USUARIO where id=?";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, usuario.getId());
			preparador.execute();
			preparador.close();
			System.out.println("Usuario Excluido com sucesso!");
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	public List<Usuario>BuscarTodos(){
		String sql = "SELECT *FROM USUARIO";
		List<Usuario> lista = new ArrayList<Usuario>();
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			ResultSet resultado = preparador.executeQuery();
			while(resultado.next()){
				Usuario usu = new Usuario();
				usu.setId(resultado.getInt("id"));
				usu.setNome(resultado.getString("nome"));
				usu.setEmail(resultado.getString("email"));
				usu.setSenha(resultado.getString("senha"));
				lista.add(usu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lista;
	}
	
	public Usuario BuscarPorId(Integer id){
		String sql = "SELECT *FROM USUARIO Where id=?";
		Usuario usuario = null;
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, id);
			ResultSet resultado = preparador.executeQuery();
			if (resultado.next()){
				usuario = new Usuario();
				usuario.setId(resultado.getInt("id"));
				usuario.setNome(resultado.getString("nome"));
				usuario.setEmail(resultado.getString("email"));
				usuario.setSenha(resultado.getString("senha"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usuario;
	}
	
	public List<Usuario>BuscarPorNome(String nome){
		String sql = "SELECT *FROM USUARIO WHERE nome like ?";
		List<Usuario>lista = new ArrayList<Usuario>();
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1,"%"+nome+"%");
			ResultSet resultado = preparador.executeQuery();
			while(resultado.next()){
				Usuario usuario = new Usuario();
				usuario.setId(resultado.getInt("id"));
				usuario.setNome(resultado.getString("nome"));
				usuario.setEmail(resultado.getString("email"));
				usuario.setSenha(resultado.getString("senha"));
				lista.add(usuario);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lista;
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