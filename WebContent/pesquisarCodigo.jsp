<%@ include file="include/header.jsp"%>
					
<section id="agenda">
<%Tarefa tarefaRetorno = (Tarefa)request.getAttribute("tarefaRetorno");%>			
	<table class="table table-bordered table-hover">
	<caption><h3>Resultado da Pesquisa - Tarefa código "<%=tarefaRetorno.getId()%>"</h3></caption>
	<thead>
	<tr class="label-inverse" style="color: #fff">
		<th>Código</th><th>Nome</th><th>Disciplina</th><th>Situação</th><th>Mensgem</th><th>Data de Finalização</th><th>Ação</th>
	</tr>
	</thead>
	<tbody>
		<%if(tarefaRetorno.getFinalizado().equals("Finalizado")){
			%><tr class="success">
		<%
		}else{
			%><tr class="error">
		<%
		}
		%>
			<td><%=tarefaRetorno.getId()%></td>
			<td><%=tarefaRetorno.getNome()%></td>
			<td><%=tarefaRetorno.getDisciplina()%></td>
			<td><%=tarefaRetorno.getFinalizado()%></td>
			<td><%=tarefaRetorno.getDescricao()%></td>
			<td><%=tarefaRetorno.getDataFinalizacao()%></td>
			<td><a href="tarefacontroller.do?acao=exc&id=<%=tarefaRetorno.getId()%>#agenda">Excluir</a>
				| <a href="tarefacontroller.do?acao=alt&id=<%=tarefaRetorno.getId()%>">Alterar</a>
			</td>
		</tr>
		</tbody>
	</table>
	<a class="btn btn-primary" href="tarefacontroller.do?acao=list">Cancelar Pesquisa</a>
</section>		
		</div>
	</div>
</div>
<%@ include file="include/footer.jsp"%>
</body>
</html>