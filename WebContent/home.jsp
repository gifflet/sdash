<%@ include file="include/header.jsp"%>
<%@ page import ="java.util.List"%>
<section id="inicio">
	<header class="page-header">
		<h1>Sistema Sdash</h1>
	</header>
	<aside class="hero-unit">
		<h2>Objetivo</h2>
		<p>O sdash é uma ferramenta desenvolvida para gerenciamento de tarefas acadêmica. O Sdash é um sistema que permite a criação, armazenamento e administração de conteúdo
		de forma dinâmica, consistentemente organizada, permitindo que o mesmo seja modificado, removido e adicionado com facilidade. Essa ferramenta tem como objetivo gerenciar as tarefas e
		acompanhar a cadeia de atividades do estudantes, assim como gerar relatórios de desempenho<p>
		<p><a href="" class="btn btn-primary btn-large pull-right">Saiba Mais</a></p>
	</aside>
</section>
<section id="agenda">
	<header class="page-header">
		<h1>Agenda</h1>
	</header>				
	<table class="table table-bordered table-hover">
	<caption><h3>Tarefas Agendadas</h3></caption>
	<thead>
	<tr class="label-inverse" style="color: #fff">
		<th>Código</th><th>Nome</th><th>Disciplina</th><th>Situação</th><th>Mensgem</th><th>Data de Finalização</th><th>Ação</th>
	</tr>
	</thead>
	<tbody>
	<%
	int cont=0, cont1=0;
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
	<td ><%=tarefa.getFinalizado()%></td>
	<td><%=tarefa.getDescricao()%></td>
	<td><%=tarefa.getDataFinalizacao()%></td>
	<td><a href="tarefacontroller.do?acao=exc&id=<%=tarefa.getId()%>#agenda">Excluir</a>
		| <a href="tarefacontroller.do?acao=alt&id=<%=tarefa.getId()%>">Alterar</a>
	</td>
	</tr>
	</tbody>
		<%
			if(tarefa.getFinalizado().equals("Finalizado"))
				cont++;
			else
				cont1++;
		}
		%>
	</table>
</section>
<section id="estatistica">
	<header class="page-header">
		<h1>Estatística</h1>
	</header>
	<h3>Tarefas</h3>
	<%=(100*cont/(cont1+cont))%>% Concluido<div class="progress progress-success progress-striped">
  			<div class="bar" style="width: <%=(100*cont/(cont1+cont))%>%;"></div>
  		</div>
  	<%=(100*cont1/(cont1+cont))%>% Pendente<div class="progress progress-danger progress-striped">
  			<div class="bar" style="width: <%=(100*cont1/(cont1+cont))%>%;"></div>
  		</div>
  		Total de Tarefas: <%=cont1+cont%>
</section>	
		</div>
	</div>
</div>
<%@ include file="include/footer.jsp"%>
</body>
</html>