<%@ include file="head.jsp"%>
<<<<<<< HEAD
<%String idusu = request.getParameter("idusu");%>
=======
>>>>>>> master
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
<<<<<<< HEAD
						<li class="dropdown">							
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Tarefas<b class="caret"></b></a>
								<ul class="dropdown-menu">
									<li><a href="tarefacontroller.do?acao=final&idusu=<%=idusu%>">Buscar por Finalizado</a></li>
									<li><a href="tarefacontroller.do?acao=pend&idusu=<%=idusu%>">Buscar por Pendente</a></li>
								</ul>
						</li>
						<li><a href="#disciplina">Disciplina</a></li>
						<li><a href="#agenda">Agenda</a></li>
						<li><a href="#avaliacao">Avaliação</a></li>
						<li><a href="#estatistica">Estatística</a></li>
						<li><a href="usucontroller.do">Sair</a></li>
					</ul>
=======
						<li class="dropdown">
							<div id="dropin" style="position:absolute;visibility:hidden;z-index:2;">
								<form action="pesquisarcontroller.do?acao=list" method="post" class="form-signin">
									<div align="right"><a style="color: black; text-decoration: none" href="javascript:dismissbox()"><b>x</b></a>&nbsp;</div>
							    		<legend>Codigo da Tarefa</legend>
										<label>Codigo: </label> <input type = "text" name="id" size="10" value=""/>
										<input class="btn btn-primary" type="submit" name="submit" value="Pesquisar">
								</form>
							</div>
							<div id="dropin1" style="position:absolute;visibility:hidden;z-index:2;">
								<form action="pesquisarcontroller.do?acao=list" method="post" class="form-signin">
									<div align="right"><a style="color: black; text-decoration: none" href="javascript:dismissbox()"><b>x</b></a>&nbsp;</div>
							    		<legend>Nome da Tarefa</legend>
										<label>Nome: </label> <input type = "text" name="nome" size="10" value=""/>
										<input class="btn btn-primary" type="submit" name="submit" value="Pesquisar">
								</form>
							</div>
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								Tarefas
								<b class="caret"></b>
							</a>
								<ul class="dropdown-menu">
									<li><a href="tarefacontroller.do?acao=cad">Cadastrar</a></li>
									<li><a href="javascript:redo()">Buscar por Código</a></li>
									<li><a href="javascript:redo1()">Buscar por Nome</a></li>
									<li><a href="tarefacontroller.do?acao=final">Buscar por Finalizado</a></li>
									<li><a href="tarefacontroller.do?acao=pend">Buscar por Pendente</a></li>
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
>>>>>>> master
				</div>
			</div>
		</div>
	</nav>
	<header class="jumbotron subhead">
		<div class="container" style="z-index:1;">
			<h1>Student Dashboard - Sdash</h1>
<<<<<<< HEAD
			<p>Alunos: Jailton Pereira, Luiz Simões e Michelle Mendes</p>
		</div>
	</header>
		<div class="container">
			<div class="row">				
				<div class="span12">
=======
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
						<li><a href="#estatistica"><i class="icon-chevron-right"></i>Estatística</a></li>
						<li><a href="#"><i class="icon-chevron-right"></i>Desempenho</a></li>
					</ul>
				</aside>
		<div class="span9">
>>>>>>> master
