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
		response.sendRedirect("index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		Usuario usuario = new Usuario();
		usuario.setEmail(email);
		usuario.setSenha(senha);
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		if(nome.equals("1")){
			Usuario Retorno = usuarioDAO.autenticar(usuario);
			if(Retorno==null){
				RequestDispatcher erro = request.getRequestDispatcher("/verificacao.jsp");
				erro.forward(request,response);
			}
			else{
				String id = Integer.toString(Retorno.getId());
				response.sendRedirect("tarefacontroller.do?acao=list&idusu=".concat(id));
			}
		}
		else{
			usuario.setNome(nome);
			usuarioDAO.cadastrar(usuario);
			response.sendRedirect("index.jsp");
		}
	}

}
