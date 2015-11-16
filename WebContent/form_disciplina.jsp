<%@ include file="include/head.jsp"%>
<link rel="stylesheet" href="css/style2.css"/>
<body>
<%
Disciplina disciplina = (Disciplina)request.getAttribute("disciplina");
String idusu = request.getParameter("idusu");
%>
    <form action="disciplinacontroller.do?acao=disc&idusu=<%=idusu%>" method="post" class="form-signin">
        	<fieldset>
            <legend>Formulario de Cadastro de Disciplina</legend>
            	<label>Código:</label>
				<input type = "text" readonly="readonly" name="id" size="10" value="<%=disciplina.getId()%>"/>
            	<input type="hidden" name="idusu" value="<%=idusu%>"/>
            	<label for="nome">Nome da Disciplina:</label>
	            <input class="input-block-level" type="text" value="<%=disciplina.getNome()%>" name="nome" required/>
	            <label for="nome">Professor:</label>
	            <input class="input-block-level" type="text" value="<%=disciplina.getProfessor()%>"name="professor" required/>
	            <label for="nome">Semestre:</label>
	            <input class="input-block-level" type="text" value="<%=disciplina.getSemestre()%>"name="semestre" required/>
            <label for="situacao">Método de Avaliação:</label>                
                <select name="situacao">
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
		  %>
            <option value="Media Geometrica" <%=estado1 %>>Media Geometrica</option>
            <option value="Media Aritimetica"<%=estado2 %>>Media Aritimetica</option>
            <option value="Media Ponderada" <%=estado3 %>>Media Ponderada</option>
          </select><br><br>
                <input class="span1" type="hidden" name="nota1" value="">
				<input class="span1" type="hidden" name="nota2" value="">
				<input class="span1" type="hidden" name="nota3" value="">
				<input class="span1" type="hidden" name="nota4" value="">
				<input class="span1" type="hidden" name="nota5" value="">
				<input class="span1" type="hidden" name="pond1" value="">
				<input class="span1" type="hidden" name="pond2" value="">
				<input class="span1" type="hidden" name="pond3" value="">
				<input class="span1" type="hidden" name="pond4" value="">
				<input class="span1" type="hidden" name="pond5" value="">
				<input class="span1" type="hidden" name="resultado" readonly value="<%=disciplina.getResultado()%>"/>
            	<input class="btn btn-primary" type="submit" name="submit" value="Enviar">
            <button class="btn btn-primary" type="reset" name="reset">Limpar</button>
            <a class="btn btn-primary" href="disciplinacontroller.do?acao=disc&idusu=<%=idusu%>">Cancelar</a>
            </fieldset>
    </form>
</body>
</html>