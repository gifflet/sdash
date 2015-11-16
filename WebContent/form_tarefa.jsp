<%@ include file="include/head.jsp"%>
<%@ page import ="java.util.List"%>
<link rel="stylesheet" href="css/style2.css"/>
<body>
<%
Tarefa tarefa = (Tarefa)request.getAttribute("tarefa");
String idusu = request.getParameter("idusu");
List<Disciplina> disclista = (List<Disciplina>)request.getAttribute("disclista");
%>
    <form action="tarefacontroller.do?acao=list&idusu=<%=idusu%>" method="post" class="form-signin">
        	<fieldset>
            <legend>Formulario de Cadastro de Tarefas</legend>
            	<label>Código:</label>
				<input type = "text" readonly="readonly" name="id" size="10" value="<%=tarefa.getId()%>"/>
            	<input type="hidden" name="idusu" value="<%=idusu%>"/>
            	<label for="nome">Nome:</label>
	            <input class="input-block-level" type="text" value="<%=tarefa.getNome()%>" name="nome" required/>
	            <label for="nome">Disciplina:</label>
	            <select name="disciplina">
	            	<%for (Disciplina disciplina: disclista){%>
	            		<option><%=disciplina.getNome()%></option>
	            	<%}%>
	            </select>
            <label for="situacao">Situação:</label>
                <select name="situacao">
                <%
		    		String estado1 = "";
					String estado2 = "";
			   		switch(tarefa.getFinalizado()){
				   		case "Finalizado": estado1 = "selected"; break; 
				   		case "Nao Finalizado": estado2 = "selected"; break;			   
			   		}
		  		%>
                    <option value="Finalizado" <%=estado1 %>>Finalizado </option>
                    <option value="Nao Finalizado" <%=estado2 %>>Nao Finalizado</option>
                </select>
            <label for="finalizacao">Data de Finalização:</label>
            <input type="text" value="<%=tarefa.getDataFinalizacao()%>"name="finalizacao" required/>
            <label for="msg">Mensagem</label>
            <textarea class="input-block-level" rows="8" cols="100" name="mensagem" required></textarea>
            <input class="btn btn-primary" type="submit" name="submit" value="Enviar">
            <button class="btn btn-primary" type="reset" name="reset">Limpar</button>
            <a class="btn btn-primary" href="tarefacontroller.do?acao=list&idusu=<%=idusu%>">Cancelar</a>
            </fieldset>
    </form>
</body>
</html>