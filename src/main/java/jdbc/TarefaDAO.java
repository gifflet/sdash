package jdbc;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import entidades.Tarefa;
public class TarefaDAO {
	private Connection con = Conexao.getConnection();
	
	public void cadastrar(Tarefa tarefa){
		String sql = "INSERT INTO TAREFA (nome, disciplina, situacao, finalizacao, mensagem, auth, idusuario) values (?,?,?,?,?,?,?)";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, tarefa.getNome());
			preparador.setString(2, tarefa.getDisciplina());
			preparador.setString(3, tarefa.getFinalizado());
			preparador.setString(4, tarefa.getDataFinalizacao());
			preparador.setString(5, tarefa.getDescricao());
			preparador.setString(6, tarefa.getAuth());
			preparador.setInt(7, tarefa.getIdusuario());
			preparador.execute();
			preparador.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	public void alterar (Tarefa tarefa){
		String sql = "UPDATE TAREFA SET nome=?, disciplina=?, situacao=?, finalizacao=?, mensagem=? where id=?";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, tarefa.getNome());
			preparador.setString(2, tarefa.getDisciplina());
			preparador.setString(3, tarefa.getFinalizado());
			preparador.setString(4, tarefa.getDataFinalizacao());
			preparador.setString(5, tarefa.getDescricao());
			preparador.setInt(6, tarefa.getId());
			preparador.execute();
			preparador.close();
			System.out.println("Tarefa Alterado com sucesso!");
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	public void excluir (Tarefa tarefa){
		String sql = "DELETE FROM TAREFA where id=?";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, tarefa.getId());
			preparador.execute();
			preparador.close();
			System.out.println("Tarefa Excluido com sucesso!");
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	public List<Tarefa>BuscarTodos(Integer idusu){
		String sql = "SELECT *FROM TAREFA where idusuario=?";
		List<Tarefa> lista = new ArrayList<Tarefa>();
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, idusu);
			ResultSet resultado = preparador.executeQuery();
			while(resultado.next()){
				Tarefa tarefa = new Tarefa();
				tarefa.setId(resultado.getInt("id"));
				tarefa.setNome(resultado.getString("nome"));
				tarefa.setDisciplina(resultado.getString("disciplina"));
				tarefa.setFinalizado(resultado.getString("situacao"));
				tarefa.setDataFinalizacao(resultado.getString("finalizacao"));
				tarefa.setDescricao(resultado.getString("mensagem"));
				lista.add(tarefa);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lista;
	}
	
	public Tarefa BuscarPorId(Integer id){
		String sql = "SELECT *FROM TAREFA Where id=?";
		Tarefa tarefa = null;
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, id);
			ResultSet resultado = preparador.executeQuery();
			if (resultado.next()){
				tarefa = new Tarefa();
				tarefa.setId(resultado.getInt("id"));
				tarefa.setNome(resultado.getString("nome"));
				tarefa.setDisciplina(resultado.getString("disciplina"));
				tarefa.setFinalizado(resultado.getString("situacao"));
				tarefa.setDataFinalizacao(resultado.getString("finalizacao"));
				tarefa.setDescricao(resultado.getString("mensagem"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tarefa;
	}
	
	public void salvar(Tarefa tarefa){
		if(tarefa.getId()!=null && tarefa.getId()!=0){
			alterar(tarefa);
		}
		else{
			cadastrar(tarefa);
		}
	}

	public List<Tarefa> BuscarPorNome(String nome) {
		String sql = "SELECT * FROM TAREFA where nome LIKE '?'";
		List<Tarefa> lista = new ArrayList<Tarefa>();
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, nome);
			ResultSet resultado = preparador.executeQuery();
			while(resultado.next()){
				Tarefa tarefa = new Tarefa();
				tarefa.setId(resultado.getInt("id"));
				tarefa.setNome(resultado.getString("nome"));
				tarefa.setDisciplina(resultado.getString("disciplina"));
				tarefa.setFinalizado(resultado.getString("situacao"));
				tarefa.setDataFinalizacao(resultado.getString("finalizacao"));
				tarefa.setDescricao(resultado.getString("mensagem"));
				lista.add(tarefa);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lista;
	}
}