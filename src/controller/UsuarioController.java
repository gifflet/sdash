package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.UsuarioDAO;
import entidades.Usuario;

@WebServlet("/usucontroller.do")
public class UsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UsuarioController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("index.html");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		Usuario usuario = new Usuario();
		usuario.setEmail(email);
		usuario.setSenha(senha);
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		Usuario Retorno = usuarioDAO.autenticar(usuario);
		if(Retorno==null){
			RequestDispatcher erro = request.getRequestDispatcher("/verificacao.html");
			erro.forward(request,response);
		}
		else{
			RequestDispatcher saida = request.getRequestDispatcher("/tarefacontroller.do?acao=inicio");
			saida.forward(request,response);
		}
	}

}
