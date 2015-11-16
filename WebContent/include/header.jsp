<%@ include file="head.jsp"%>
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
				<a href="#inicio" class="brand">Sistema Sdash</a>
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
						<li><a href="#disciplina">Disciplina</a></li>
						<li><a href="#agenda">Agenda</a></li>
						<li><a href="#avaliacao">Avaliação</a></li>
						<li><a href="#estatistica">Estatística</a></li>
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