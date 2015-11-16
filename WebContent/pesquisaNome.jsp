<%@ include file="include/header.jsp"%>
<%@ page import ="java.util.List"%>					
<section id="agenda">
<%String nome = (String)request.getAttribute("nome");%>			
	<table class="table table-bordered table-hover">
	<caption><h3>Resultado da Pesquisa - Tarefa Nome "<%=nome%>"</h3></caption>
	<thead>
	<tr class="label-inverse" style="color: #fff">
		<th>Código</th><th>Nome</th><th>Disciplina</th><th>Situação</th><th>Mensgem</th><th>Data de Finalização</th><th>Ação</th>
	</tr>
	</thead>
	<tbody>
		<%
		List<Tarefa> lista = (List<Tarefa>)request.getAttribute("lista");
		for (Tarefa tarefa: lista){
			if(tarefa.getFinalizado().equals("Finalizado")){
					%><tr class="success">
				<%
				}else{
					%><tr class="error">
				<%
				}
				%>
		<td><%=tarefa.getId()%></td>
		<td><%=tarefa.getNome()%></td>
		<td><%=tarefa.getDisciplina()%></td>
		<td><%=tarefa.getFinalizado()%></td>
		<td><%=tarefa.getDescricao()%></td>
		<td><%=tarefa.getDataFinalizacao()%></td>
		<td><a href="tarefacontroller.do?acao=exc&id=<%=tarefa.getId()%>#agenda">Excluir</a>
			| <a href="tarefacontroller.do?acao=alt&id=<%=tarefa.getId()%>">Alterar</a>
		</td>
	</tr>
	</tbody>
	<%
	}
	%>
	</table>
	<a class="btn btn-primary" href="tarefacontroller.do?acao=list">Cancelar Pesquisa</a>
</section>		
		</div>
	</div>
</div>
<%@ include file="include/footer.jsp"%>
</body>
</html>