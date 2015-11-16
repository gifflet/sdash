<%@ include file="include/header.jsp"%>
<%@ page import ="java.util.List"%>		
<section id="agenda">			
	<table class="table table-bordered table-hover">
	<caption><h3>Resultado da Pesquisa - Tarefas Finalizadas</h3></caption>
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
				<td><%=tarefa.getId()%></td>
				<td><%=tarefa.getNome()%></td>
				<td><%=tarefa.getDisciplina()%></td>
				<td ><%=tarefa.getFinalizado()%></td>
				<td><%=tarefa.getDescricao()%></td>
				<td><%=tarefa.getDataFinalizacao()%></td>
				<td><a href="tarefacontroller.do?acao=exc&id=<%=tarefa.getId()%>&idusu=<%=idusu%>#agenda">Excluir</a>
					| <a href="tarefacontroller.do?acao=alt&id=<%=tarefa.getId()%>&idusu=<%=idusu%>">Alterar</a>
				</td>
				</tr>
			<%
			}
			%>
	</tbody>
		<%
		}
		%>
	</table>
	<a class="btn btn-primary" href="tarefacontroller.do?acao=list&idusu=<%=idusu%>">Cancelar Pesquisa</a>
</section>		
		</div>
	</div>
</div>
<%@ include file="include/footer.jsp"%>	
</body>
</html>