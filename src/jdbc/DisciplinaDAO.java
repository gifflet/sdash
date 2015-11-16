package jdbc;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entidades.Disciplina;
public class DisciplinaDAO {
	private Connection con = Conexao.getConnection();
	
	public void cadastrar(Disciplina disciplina){
		String sql = "INSERT INTO DISCIPLINA (nome, professor, semestre, situacao, nota1, nota2, nota3, nota4, nota5, resultado, idusuario) values (?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, disciplina.getNome());
			preparador.setString(2, disciplina.getProfessor());
			preparador.setString(3, disciplina.getSemestre());
			preparador.setString(4, disciplina.getSituacao());
			preparador.setDouble(5, disciplina.getNota1());
			preparador.setDouble(6, disciplina.getNota2());
			preparador.setDouble(7, disciplina.getNota3());
			preparador.setDouble(8, disciplina.getNota4());
			preparador.setDouble(9, disciplina.getNota5());
			preparador.setDouble(10, disciplina.getResultado());
			preparador.setInt(11, disciplina.getIdusuario());
			preparador.execute();
			preparador.close();
			System.out.println("Disciplina Cadastrado com sucesso!");
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	public void alterar (Disciplina disciplina){
		String sql = "UPDATE DISCIPLINA SET nome=?, professor=?, semestre=?, situacao=?, nota1=?, nota2=?, nota3=?, nota4=?, nota5=?, resultado=? where id=?";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, disciplina.getNome());
			preparador.setString(2, disciplina.getProfessor());
			preparador.setString(3, disciplina.getSemestre());
			preparador.setString(4, disciplina.getSituacao());
			preparador.setDouble(5, disciplina.getNota1());
			preparador.setDouble(6, disciplina.getNota2());
			preparador.setDouble(7, disciplina.getNota3());
			preparador.setDouble(8, disciplina.getNota4());
			preparador.setDouble(9, disciplina.getNota5());
			preparador.setDouble(10, disciplina.getResultado());
			preparador.setInt(11, disciplina.getId());
			preparador.execute();
			preparador.close();
			System.out.println("Disciplina Alterado com sucesso!");
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	public void excluir (Disciplina disciplina){
		String sql = "DELETE FROM DISCIPLINA where id=?";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, disciplina.getId());
			preparador.execute();
			preparador.close();
			System.out.println("Disciplina Excluido com sucesso!");
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	public List<Disciplina>BuscarTodos(Integer idusu){
		String sql = "SELECT *FROM DISCIPLINA where idusuario=? order by NOME";
		List<Disciplina> lista = new ArrayList<Disciplina>();
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, idusu);
			ResultSet resultado = preparador.executeQuery();
			while(resultado.next()){
				Disciplina disciplina = new Disciplina();
				disciplina.setId(resultado.getInt("id"));
				disciplina.setNome(resultado.getString("nome"));
				disciplina.setProfessor(resultado.getString("professor"));
				disciplina.setSemestre(resultado.getString("semestre"));
				disciplina.setSituacao(resultado.getString("situacao"));
				disciplina.setNota1(resultado.getDouble("nota1"));
				disciplina.setNota2(resultado.getDouble("nota2"));
				disciplina.setNota3(resultado.getDouble("nota3"));
				disciplina.setNota4(resultado.getDouble("nota4"));
				disciplina.setNota5(resultado.getDouble("nota5"));
				disciplina.setResultado(resultado.getDouble("resultado"));
				lista.add(disciplina);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lista;
	}
	
	public Disciplina BuscarPorId(Integer id){
		String sql = "SELECT *FROM DISCIPLINA Where id=?";
		Disciplina disciplina = null;
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, id);
			ResultSet resultado = preparador.executeQuery();
			if (resultado.next()){
				disciplina = new Disciplina();
				disciplina.setId(resultado.getInt("id"));
				disciplina.setNome(resultado.getString("nome"));
				disciplina.setProfessor(resultado.getString("professor"));
				disciplina.setSemestre(resultado.getString("semestre"));
				disciplina.setSituacao(resultado.getString("situacao"));
				disciplina.setNota1(resultado.getDouble("nota1"));
				disciplina.setNota2(resultado.getDouble("nota2"));
				disciplina.setNota3(resultado.getDouble("nota3"));
				disciplina.setNota4(resultado.getDouble("nota4"));
				disciplina.setNota5(resultado.getDouble("nota5"));
				disciplina.setResultado(resultado.getDouble("resultado"));				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return disciplina;
	}
	
	public void salvar(Disciplina disciplina){
		if(disciplina.getId()!=null && disciplina.getId()!=0){
			alterar(disciplina);
		}
		else{
			cadastrar(disciplina);
		}
	}
}