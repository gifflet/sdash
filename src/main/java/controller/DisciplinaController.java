package controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.DisciplinaDAO;
import entidades.Disciplina;

@WebServlet("/disciplinacontroller.do")
public class DisciplinaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DisciplinaController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		String idusu = request.getParameter("idusu");
		DisciplinaDAO disciplinaDAO = new DisciplinaDAO();
		if(acao!=null && acao.equals("exc")){
			String id = request.getParameter("id");
			Disciplina disciplina = new Disciplina();
			disciplina.setId(Integer.parseInt(id));
			disciplinaDAO.excluir(disciplina);
			response.sendRedirect("tarefacontroller.do?acao=list&idusu=".concat(idusu).concat("#disciplina"));
		}
		if(acao!=null && acao.equals("alt")){
			String id = request.getParameter("id");
			Disciplina disciplina = disciplinaDAO.BuscarPorId(Integer.parseInt(id));
			request.setAttribute("disciplina", disciplina);		
			RequestDispatcher saida = request.getRequestDispatcher("/form_disciplina.jsp");
			saida.forward(request,response);
		}
		if(acao!=null && acao.equals("aval")){
			response.sendRedirect("tarefacontroller.do?acao=list&idusu=".concat(idusu).concat("#avaliacao"));
		}
		if(acao!=null && acao.equals("disc")){
			response.sendRedirect("tarefacontroller.do?acao=list&idusu=".concat(idusu).concat("#disciplina"));
		}
		
		if(acao!=null && acao.equals("cad")){
			Disciplina disciplina = new Disciplina();
			disciplina.setId(0);
			disciplina.setNome("");
			disciplina.setProfessor("");
			disciplina.setSemestre("");
			disciplina.setSituacao("");
			disciplina.setResultado(0);
			request.setAttribute("disciplina", disciplina);		
			RequestDispatcher saida = request.getRequestDispatcher("/form_disciplina.jsp");
			saida.forward(request,response);
		}
		
		if(acao!=null && acao.equals("inicio")){
			RequestDispatcher saida = request.getRequestDispatcher("home.jsp");
			saida.forward(request,response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		double valor = 0, media=0, soma=0, mult=1, pond=0, p1=1, p2=1, p3=1, p4=1, p5=1; 
		//Recebe dados da tela
		String id = request.getParameter("id");
		String idusu = request.getParameter("idusu");
		String nome = request.getParameter("nome");
		String professor = request.getParameter("professor");
		String semestre = request.getParameter("semestre");
		String situacao = request.getParameter("situacao");
		String nota1 = request.getParameter("nota1");
		String nota2 = request.getParameter("nota2");
		String nota3 = request.getParameter("nota3");
		String nota4 = request.getParameter("nota4");
		String nota5 = request.getParameter("nota5");
		if(situacao.equals("Media Ponderada")){
			String pond1 = request.getParameter("pond1");
			String pond2 = request.getParameter("pond2");
			String pond3 = request.getParameter("pond3");
			String pond4 = request.getParameter("pond4");
			String pond5 = request.getParameter("pond5");
			if(!pond1.equals("")){
				p1 = (Double.parseDouble(pond1));
				request.setAttribute("p1", p1);	
			}
			if(!pond2.equals("")){
				p2 = (Double.parseDouble(pond2));
			}
			if(!pond3.equals("")){
				p3 = (Double.parseDouble(pond3));
			}
			if(!pond4.equals("")){
				p4 = (Double.parseDouble(pond4));
			}
			if(!pond5.equals("")){
				p5 = (Double.parseDouble(pond5));
			}
		}
				
		//Cria objeto tarefa e seta os valores vindo da tela
		Disciplina disciplina = new Disciplina();
		if(!nota1.equals("")){
			double n1 = (Double.parseDouble(nota1));
			valor++;
			soma = n1;
			mult = n1;
			pond = (p1/10)*n1;
		}
		if(!nota2.equals("")){
			double n2 = (Double.parseDouble(nota2));
			valor++;
			soma = soma+n2;
			mult = mult*n2;
			pond = pond+(p2/10)*n2;
		}
		if(!nota3.equals("")){
			double n3 = (Double.parseDouble(nota3));
			valor++;
			soma = soma+n3;
			mult = mult*n3;
			pond = pond+(p3/10)*n3;
		}
		if(!nota4.equals("")){
			double n4 = (Double.parseDouble(nota4));
			valor++;
			soma = soma+n4;
			mult = mult*n4;
			pond = pond+(p4/10)*n4;
		}
		if(!nota5.equals("")){
			double n5 = (Double.parseDouble(nota5));
			valor++;
			soma = soma+n5;
			mult = mult*n5;
			pond = pond+(p5/10)*n5;
		}
		if(situacao.equals("Media Aritimetica")&&(valor!=0)){
			media=soma/valor;
		}
		if(situacao.equals("Media Geometrica")&&(valor!=0)){
			media=Math.pow(mult, 1/valor);
		}
		if(situacao.equals("Media Ponderada")&&(valor!=0)){
			media=pond;
		}
		
		if(id!=null){
			disciplina.setId(Integer.parseInt(id));
		}
		disciplina.setIdusuario(Integer.parseInt(idusu));
		disciplina.setNome(nome);
		disciplina.setProfessor(professor);
		disciplina.setSemestre(semestre);
		disciplina.setSituacao(situacao);
		if(!nota1.equals("")){
			disciplina.setNota1(Double.parseDouble(nota1));
		}
		else{
			disciplina.setNota1(-1);
		}
		if(!nota2.equals("")){
			disciplina.setNota2(Double.parseDouble(nota2));
		}
		else{
			disciplina.setNota2(-1);
		}
		if(!nota3.equals("")){
			disciplina.setNota3(Double.parseDouble(nota3));
		}
		else{
			disciplina.setNota3(-1);
		}
		if(!nota4.equals("")){
			disciplina.setNota4(Double.parseDouble(nota4));
		}
		else{
			disciplina.setNota4(-1);
		}
		if(!nota5.equals("")){
			disciplina.setNota5(Double.parseDouble(nota5));
		}
		else{
			disciplina.setNota5(-1);
		}
		disciplina.setResultado(media);
		
		//Pede para o tDAO cadastrar no banco de dados
		DisciplinaDAO disciplinaDAO = new DisciplinaDAO();
		disciplinaDAO.salvar(disciplina);
		if (acao.equals("aval"))
			response.sendRedirect("disciplinacontroller.do?acao=aval&idusu=".concat(idusu));
		else
			response.sendRedirect("disciplinacontroller.do?acao=disc&idusu=".concat(idusu));
	}

}
