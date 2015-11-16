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
	</aside>
</section>
<br>
<section id="disciplina">
	<header class="page-header">
		<h1>Disciplina</h1>
	</header>				
	<table class="table table-bordered table-hover">
	<caption><h3>Disciplinas Matriculadas</h3></caption>
	<thead>
	<tr class="label-inverse" style="color: #fff">
		<th>Código</th><th>Nome</th><th>Professor</th><th>Semestre</th><th>Método de Avaliação</th><th><a href="disciplinacontroller.do?acao=cad&idusu=<%=idusu%>">Novo Registro</a></th>
	</tr>
	</thead>
	<tbody>
	<%
	int media;
	List<Disciplina> disclista = (List<Disciplina>)request.getAttribute("disclista");
	for (Disciplina disciplina: disclista){
	%>
	<tr>
	<td><%=disciplina.getId()%></td>
	<td><%=disciplina.getNome()%></td>
	<td><%=disciplina.getProfessor()%></td>
	<td ><%=disciplina.getSemestre()%></td>
	<td><%=disciplina.getSituacao()%></td>
	<td><a href="disciplinacontroller.do?acao=exc&id=<%=disciplina.getId()%>&idusu=<%=idusu%>">Excluir</a>
		| <a href="disciplinacontroller.do?acao=alt&id=<%=disciplina.getId()%>&idusu=<%=idusu%>">Alterar</a>
	</td>
	</tr>
	</tbody>
	<%
		}
	%>
	</table>
</section>
<br>
<section id="agenda">
	<header class="page-header">
		<h1>Agenda</h1>
	</header>				
	<table class="table table-bordered table-hover">
	<caption><h3>Tarefas Agendadas</h3></caption>
	<thead>
	<tr class="label-inverse" style="color: #fff">
		<th>Código</th><th>Nome</th><th>Disciplina</th><th>Situação</th><th>Mensgem</th><th>Data de Finalização</th><th><a href="tarefacontroller.do?acao=cad&idusu=<%=idusu%>">Novo Registro</a></th>
	</tr>
	</thead>
	<tbody>
	<%
	double cont=0, cont1=0, cont2=0, cont3=0, cont4=0;
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
	<td><a href="tarefacontroller.do?acao=exc&id=<%=tarefa.getId()%>&idusu=<%=idusu%>">Excluir</a>
		| <a href="tarefacontroller.do?acao=alt&id=<%=tarefa.getId()%>&idusu=<%=idusu%>">Alterar</a>
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
<br>
<section id="avaliacao">
	<header class="page-header">
		<h1>Avaliação</h1>
	</header>
	<table class="table table-bordered">
	<caption><h3>Notas das Disciplinas</h3></caption>
	<thead>
	<tbody>
	<tr class="label-inverse" style="color: #fff">
		<th>Disciplina</th><th>Método de Avaliação</th><th>Nota1</th><th>Nota2</th><th>Nota3</th><th>Nota4</th><th>Nota5</th><th colspan="2">Média</th>
	</tr>

	<%
	for (Disciplina disciplina: disclista){
		cont2++;
	%>
	<tr>
	<form action="disciplinacontroller.do?acao=aval&idusu=<%=idusu%>" method="post" class="form-signin">           	
		<input type="hidden" readonly="readonly" name="id" size="10" value="<%=disciplina.getId()%>"/>
	    <td><input class="input-small span2" type="text" value="<%=disciplina.getNome()%>" name="nome" readonly="readonly"/></td>
	    <input type="hidden" class="input-block-level" value="<%=disciplina.getProfessor()%>"name="professor" required/>
	    <input type="hidden" class="input-block-level" value="<%=disciplina.getSemestre()%>"name="semestre" required/></td>
        <td>
          <%
		    String estado1 = "";
			String estado2 = "";
			String estado3 = "";
			   switch(disciplina.getSituacao())
			   {
				   case "Media Geometrica": estado1 = "selected"; break; 
				   case "Media Aritimetica": estado2 = "selected"; break;
				   case "Media Ponderada": estado3 = "selected"; break; 			   
			   }
		  	if(estado1.equals("selected")){%>
		  		<input readonly="readonly" name="situacao" class="span2" type="text" value="Media Geometrica">
            <%}
		  	if(estado2.equals("selected")){%>
		  		<input readonly="readonly" name="situacao" class="span2" type="text" value="Media Aritimetica">
            <%}
		  	if(estado3.equals("selected")){%>
		  		<input readonly="readonly" name="situacao" class="span2" type="text" value="Media Ponderada">
		  	<%}%>
		</td>
		<%
		if(disciplina.getSituacao().equals("Media Ponderada")){%>
	        <td><input class="span1" type="text" name="pond1" placeholder="Peso"><input class="span1" type="text" name="nota1" <%if(disciplina.getNota1()!=-1){%>
																																			value="<%=disciplina.getNota1()%>"
																																		  <%}
																																			else{%>
																																				value=""
																																		  <%}%>></td>
			<td><input class="span1" type="text" name="pond2" placeholder="Peso"><input class="span1" type="text" name="nota2" <%if(disciplina.getNota2()!=-1){%>
																																			value="<%=disciplina.getNota2()%>"
																																		  <%}
																																			else{%>
																																				value=""
																																		  <%}%>></td>
			<td><input class="span1" type="text" name="pond3" placeholder="Peso"><input class="span1" type="text" name="nota3" <%if(disciplina.getNota3()!=-1){%>
																																			value="<%=disciplina.getNota3()%>"
																																		  <%}
																																			else{%>
																																				value=""
																																		  <%}%>></td>
			<td><input class="span1" type="text" name="pond4" placeholder="Peso"><input class="span1" type="text" name="nota4" <%if(disciplina.getNota4()!=-1){%>
																																			value="<%=disciplina.getNota4()%>"
																																		  <%}
																																			else{%>
																																				value=""
																																		  <%}%>></td>
			<td><input class="span1" type="text" name="pond5" placeholder="Peso"><input class="span1" type="text" name="nota5" <%if(disciplina.getNota5()!=-1){%>
																																			value="<%=disciplina.getNota5()%>"
																																		  <%}
																																			else{%>
																																				value=""
																																		  <%}%>></td>
	<% }
		else{%>
			<td><input class="span1" type="text" name="nota1" <%if(disciplina.getNota1()!=-1){%>
																	value="<%=disciplina.getNota1()%>"
															  <%}
																else{%>
																	value=""
															  <%}%>></td>
															  
			<td><input class="span1" type="text" name="nota2" <%if(disciplina.getNota2()!=-1){%>
																	value="<%=disciplina.getNota2()%>"
															  <%}
																else{%>
																	value=""
															  <%}%>></td>
			<td><input class="span1" type="text" name="nota3" <%if(disciplina.getNota3()!=-1){%>
																	value="<%=disciplina.getNota3()%>"
															  <%}
																else{%>
																	value=""
															  <%}%>></td>
			<td><input class="span1" type="text" name="nota4" <%if(disciplina.getNota4()!=-1){%>
																	value="<%=disciplina.getNota4()%>"
															  <%}
																else{%>
																	value=""
															  <%}%>></td>
			<td><input class="span1" type="text" name="nota5" <%if(disciplina.getNota5()!=-1){%>
																	value="<%=disciplina.getNota5()%>"
															  <%}
																else{%>
																	value=""
															  <%}%>></td>
	<%
		}
		%>
		<td><input class="span1" type="text" name="resultado" readonly value="<%=disciplina.getResultado()%>"></td>
        <td><input class="btn btn-primary" type="submit" name="submit" value="Calcular"></td>
        <%
        	if(disciplina.getResultado()>=5){
        		cont3++;
        	}
        	else
        		cont4++;
        %>
    </form>
	</td>
	</tr>
	</tbody>
	<%
	}
	%>
	</thead>
	</table>
</section>
<br>
<section id="estatistica">
	<header class="page-header">
		<h1>Estatística</h1>
	</header>
	<h3>Tarefas</h3>
	<%=String.format("%.2f", 100*cont/(cont1+cont))%>% Concluido<div class="progress progress-success progress-striped">
  			<div class="bar" style="width: <%=(100*cont/(cont1+cont))%>%;"></div>
  		</div>
  	<%=String.format("%.2f", 100*cont1/(cont1+cont))%>% Pendente<div class="progress progress-danger progress-striped">
  		<div class="bar" style="width: <%=(100*cont1/(cont1+cont))%>%;"></div>	
  		</div>
  		Total de Tarefas: <%=cont1+cont%><br><br>
  	<h3>Desempenho</h3>
  	Disciplina Matriculada: <%=cont2%><br>
  	Disciplina Aprovada: <%=cont3%><br>
  	Disciplina Reprovada: <%=cont4%><br>
  	Aproveitamente: <%=String.format("%.2f", 100*cont3/(cont3+cont4))%>% <br><br>	
</section>
<br>
		</div>
	</div>
</div>
<%@ include file="include/footer.jsp"%>
</body>
</html>