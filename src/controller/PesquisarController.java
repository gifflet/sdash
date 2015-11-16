package controller;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import jdbc.TarefaDAO;
import entidades.Tarefa;

@WebServlet("/pesquisarcontroller.do")
public class PesquisarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PesquisarController() {
        super();   
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if(id!=null){
			Tarefa tarefaRetorno=null;
			if(id!=""){
				int cod = Integer.parseInt(id);
				TarefaDAO tarefaDAO = new TarefaDAO();
				tarefaRetorno = tarefaDAO.BuscarPorId(cod);
			}
			if(tarefaRetorno!=null){
				request.setAttribute("tarefaRetorno", tarefaRetorno);
				RequestDispatcher saida = request.getRequestDispatcher("/pesquisarCodigo.jsp");
				saida.forward(request,response);
			}
			else{
				JOptionPane.showMessageDialog(null, "Codigo inválido!");
				response.sendRedirect("tarefacontroller.do?acao=list#dropin");
			}
		}
		else{
			String nome = request.getParameter("nome");
			request.setAttribute("nome", nome);
			TarefaDAO tarefaDAO = new TarefaDAO();
			List<Tarefa> lista = tarefaDAO.BuscarPorNome(nome);
			request.setAttribute("lista", lista);
			RequestDispatcher saida = request.getRequestDispatcher("/pesquisaNome.jsp");
			saida.forward(request,response);
		}
		
	}

}
