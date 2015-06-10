package controller;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.TarefaDAO;
import entidades.Tarefa;

@WebServlet("/tarefacontroller.do")
public class TarefaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TarefaController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		TarefaDAO tarefaDAO = new TarefaDAO();
		if(acao!=null && acao.equals("exc")){
			String id = request.getParameter("id");
			Tarefa tarefa = new Tarefa();
			tarefa.setId(Integer.parseInt(id));
			tarefaDAO.excluir(tarefa);
			response.sendRedirect("tarefacontroller.do?acao=list");
		}
		if(acao!=null && acao.equals("alt")){
			String id = request.getParameter("id");
			Tarefa tarefa = tarefaDAO.BuscarPorId(Integer.parseInt(id));
			request.setAttribute("tarefa", tarefa);		
			RequestDispatcher saida = request.getRequestDispatcher("/form_tarefa.jsp");
			saida.forward(request,response);
		}
		if(acao!=null && acao.equals("list")){
			List<Tarefa> lista = tarefaDAO.BuscarTodos();
			request.setAttribute("lista", lista);
			RequestDispatcher saida = request.getRequestDispatcher("home.jsp");
			saida.forward(request,response);
		}
		
		if(acao!=null && acao.equals("cad")){
			Tarefa tarefa = new Tarefa();
			tarefa.setId(0);
			tarefa.setNome("");
			tarefa.setFinalizado("");
			tarefa.setDataFinalizacao("");
			tarefa.setDescricao("");
			tarefa.setDisciplina("");
			request.setAttribute("tarefa", tarefa);		
			RequestDispatcher saida = request.getRequestDispatcher("/form_tarefa.jsp");
			saida.forward(request,response);
		}
		
		if(acao!=null && acao.equals("inicio")){
			RequestDispatcher saida = request.getRequestDispatcher("home.jsp");
			saida.forward(request,response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Recebe dados da tela
		String id = request.getParameter("id");
		String nome = request.getParameter("nome");
		String disciplina = request.getParameter("disciplina");
		String situacao = request.getParameter("situacao");
		String finalizacao = request.getParameter("finalizacao");
		String mensagem = request.getParameter("mensagem");
		
		//Cria objeto tarefa e seta os valores vindo da tela
		Tarefa tarefa = new Tarefa();
		if(id!=null){
			tarefa.setId(Integer.parseInt(id));
		}
		tarefa.setNome(nome);
		tarefa.setDisciplina(disciplina);
		tarefa.setFinalizado(situacao);
		tarefa.setDataFinalizacao(finalizacao);
		tarefa.setDescricao(mensagem);
		
		//Pede para o tDAO cadastrar no banco de dados
		TarefaDAO tarefaDAO = new TarefaDAO();
		tarefaDAO.salvar(tarefa);
		List<Tarefa> lista = tarefaDAO.BuscarTodos();
		request.setAttribute("lista", lista);
		RequestDispatcher saida = request.getRequestDispatcher("/home.jsp");
		saida.forward(request,response);
	}

}
