<%@ include file="include/head.jsp"%>
<%String idusu = request.getParameter("idusu");%>
<body>
	<nav class="navbar navbar-fixed-top navbar-inverse">
		<div class="navbar-inner">
			<div class="container">
				<!--btn-navbar esta classe é usada como alternador pra o conteudo colaps¡vel-->
				<button class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="javascript:void(0)" onclick="campoInvalido();" class="brand">Sistema Sdash</a>
				<!--Tudo que for escondido a menos de 940px-->
				<div class="nav-collapse collapse">
					<ul class="nav">
						<li class="dropdown">							
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Tarefas<b class="caret"></b></a>
								<ul class="dropdown-menu">
									<li><a href="tarefacontroller.do?acao=final&idusu=<%=idusu%>">Buscar por Finalizado</a></li>
									<li><a href="tarefacontroller.do?acao=pend&idusu=<%=idusu%>">Buscar por Pendente</a></li>
								</ul>
						</li>
						<li><a href="javascript:void(0)" onclick="campoInvalido();">Disciplina</a></li>
						<li><a href="javascript:void(0)" onclick="campoInvalido();">Agenda</a></li>
						<li><a href="javascript:void(0)" onclick="campoInvalido();">Avaliação</a></li>
						<li><a href="javascript:void(0)" onclick="campoInvalido();">Estatística</a></li>
						<li><a href="usucontroller.do">Sair</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<header class="jumbotron subhead">
		<div class="container" style="z-index:1;">
			<h1>Student Dashboard - Sdash</h1>
			<p>Alunos: Jailton Pereira e Michelle Mendes</p>
		</div>
	</header>
		<div class="container">
			<div class="row">				
				<div class="span12">
<%@ page import ="java.util.List"%>			
<section id="agenda">	
	<table class="table table-bordered table-hover">
	<caption><h3>Resultado da Pesquisa - Tarefas Pendentes</h3></caption>
	<thead>
	<tr class="label-inverse" style="color: #fff">
		<th>Código</th><th>Nome</th><th>Disciplina</th><th>Situação</th><th>Mensgem</th><th>Data de Finalização</th><th>Ação</th>
	</tr>
	</thead>
	<tbody>
		<%
		List<Tarefa> lista = (List<Tarefa>)request.getAttribute("lista");
		for (Tarefa tarefa: lista){
			if(tarefa.getFinalizado().equals("Nao Finalizado")){
				%><tr class="error">
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
		<a class="btn btn-primary" href="tarefacontroller.do?acao=list&idusu=<%=idusu%>">Concluir Pesquisa</a>
		</section>		
		</div>
	</div>
</div>
<%@ include file="include/footer.jsp"%>	
</body>
</html>