package entidades;

public class Disciplina {
	private Integer id;
	private String nome;
	private String professor;
	private String semestre;
	private String situacao;
	private double nota1;
	private double nota2;
	private double nota3;
	private double nota4;
	private double nota5;
	private double pond1;
	private double pond2;
	private double pond3;
	private double pond4;
	private double pond5;
	private Integer idusuario;
	
	public Integer getIdusuario() {
		return idusuario;
	}
	public void setIdusuario(Integer idusuario) {
		this.idusuario = idusuario;
	}
	public double getPond1() {
		return pond1;
	}
	public void setPond1(double pond1) {
		this.pond1 = pond1;
	}
	public double getPond2() {
		return pond2;
	}
	public void setPond2(double pond2) {
		this.pond2 = pond2;
	}
	public double getPond3() {
		return pond3;
	}
	public void setPond3(double pond3) {
		this.pond3 = pond3;
	}
	public double getPond4() {
		return pond4;
	}
	public void setPond4(double pond4) {
		this.pond4 = pond4;
	}
	public double getPond5() {
		return pond5;
	}
	public void setPond5(double pond5) {
		this.pond5 = pond5;
	}
	private double resultado;
	
	public double getNota1() {
		return nota1;
	}
	public void setNota1(double nota1) {
		this.nota1 = nota1;
	}
	public double getNota2() {
		return nota2;
	}
	public void setNota2(double nota2) {
		this.nota2 = nota2;
	}
	public double getNota3() {
		return nota3;
	}
	public void setNota3(double nota3) {
		this.nota3 = nota3;
	}
	public double getNota4() {
		return nota4;
	}
	public void setNota4(double nota4) {
		this.nota4 = nota4;
	}
	public double getNota5() {
		return nota5;
	}
	public void setNota5(double nota5) {
		this.nota5 = nota5;
	}
	public double getResultado() {
		return resultado;
	}
	public void setResultado(double resultado) {
		this.resultado = resultado;
	}	
	
	public String getSemestre() {
		return semestre;
	}
	public void setSemestre(String semestre) {
		this.semestre = semestre;
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
	public String getProfessor() {
		return professor;
	}
	public void setProfessor(String professor) {
		this.professor = professor;
	}
	public String getSituacao() {
		return situacao;
	}
	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}	
}