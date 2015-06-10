<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import ="java.util.List"%>
<%@ page import ="entidades.Tarefa"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
	<meta charset="UTF-8">
	<meta name="description" content="sdash"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>

	<title>sdash</title>
	<link rel="stylesheet" href="css/bootstrap.css"/>
	<link rel="stylesheet" href="css/bootstrap-responsive.css"/>
	<link rel="stylesheet" href="css/style.css"/>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-1.7.1.min.js"><\/script>')</script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
</head>
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
				<a href="#inicio" class="brand">Sistema Sdash</a>
				<!--Tudo que for escondido a menos de 940px-->
				<div class="nav-collapse collapse">
					<ul class="nav">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								Tarefas
								<b class="caret"></b>
							</a>
								<ul class="dropdown-menu">
									<li><a href="tarefacontroller.do?acao=cad">Cadastrar</a></li>
									<li><a href="#">Buscar por Código</a></li>
									<li><a href="#">Buscar por Nome</a></li>
								</ul>
						</li>
						<li><a href="#">Link 2</a></li>
						<li><a href="#">Link 3</a></li>
						<li><a href="#">Link 4</a></li>
						<li><a href="usucontroller.do">Sair</a></li>
					</ul>
					<form action="" class="navbar-form pull-right">
						<input type="text" class="span2">
						<button class="btn btn-inverse">Buscar</button>
					</form>
				</div>
			</div>
		</div>
	</nav>
	<header class="jumbotron subhead">
		<div class="container">
			<h1>Student Dashboard - Sdash</h1>
			<p>Alunos: Carlos Marx, Jailton Pereira, Luiz Simões e Michelle Mendes</p>
		</div>
	</header>
		<div class="container">
			<div class="row">
				<aside class="span3 bs-docs-sidebar">
					<ul class="nav nav-list bs-docs-sidenav">
						<li><a href="#agenda"><i class="icon-chevron-right"></i>Agenda</a></li>
						<li><a href="#heroi"><i class="icon-chevron-right"></i>Projetos</a></li>
						<li><a href="#"><i class="icon-chevron-right"></i>Avaliação</a></li>
						<li><a href="#"><i class="icon-chevron-right"></i>Estatística</a></li>
						<li><a href="#"><i class="icon-chevron-right"></i>Desempenho</a></li>
					</ul>
				</aside>
				<div class="span9">
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
			<tr>
				<th>Código</th><th>Nome</th><th>Disciplina</th><th>Situação</th><th>Mensgem</th><th>Data de Finalização</th><th>Ação</th>
			</tr>
			</thead>
			<tbody>
		<%
		List<Tarefa> lista = (List<Tarefa>)request.getAttribute("lista");
		for (Tarefa tarefa: lista){
		%>
		<tr>
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
		</section>		
		</div>
	</div>
</div>

	 <!-- Footer
    ================================================== -->
    <footer class="footer">
      <div class="container">
        <p class="pull-right"><a href="#">Voltar ao topo</a></p>
        <p>Instituto de Matemática - <a href="https://www.ufba.br/" target="_blank">Universidade Federal da Bahia-(UFBA)</a> Salvador -Ba</p>
        <p>Este projeto foi desenvolvido utilizando o Bootstrap</p>
        <p>Trabalho da Disciplina Laboratório de Programação Web</p>
        <p>Alunos: Jailton Pereira, Michelle Mendes, Luiz Simões, Carlos Marx</p>
      </div>
    </footer>
</body>
</html>