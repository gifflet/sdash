package entidades;

public class Tarefa {
	private Integer id;
	private Integer idusuario;
	private String nome;
	private String disciplina;
	private String descricao;
	private String finalizado;
	private String dataFinalizacao;
	private String auth;
	
	public Integer getIdusuario() {
		return idusuario;
	}
	public void setIdusuario(Integer idusuario) {
		this.idusuario = idusuario;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getDisciplina() {
		return disciplina;
	}
	public void setDisciplina(String disciplina) {
		this.disciplina = disciplina;
	}	
	
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getFinalizado() {
		return finalizado;
	}
	public void setFinalizado(String finalizado) {
		this.finalizado = finalizado;
	}
	public String getDataFinalizacao() {
		return dataFinalizacao;
	}
	public void setDataFinalizacao(String dataFinalizacao) {
		this.dataFinalizacao = dataFinalizacao;
	}
	
}