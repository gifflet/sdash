<%@page import="entidades.Tarefa"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="sdash"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>

	<title>Tarefa</title>
	<link rel="stylesheet" href="css/bootstrap.css"/>
	<link rel="stylesheet" href="css/bootstrap-responsive.css"/>
	<link rel="stylesheet" href="css/style2.css"/>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-1.7.1.min.js"><\/script>')</script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
</head>
<body>

<%
Tarefa tarefa = (Tarefa)request.getAttribute("tarefa");
%>
    <form action="tarefacontroller.do?acao=list#agenda" method="post" class="form-signin">
        	<fieldset>
            <legend>Formulario de Cadastro de Tarefas</legend>
            	<label>Código:</label>
				<input type = "text" readonly="readonly" name="id" size="10" value="<%=tarefa.getId()%>"/>
            	<label for="nome">Nome:</label>
	            <input class="input-block-level" type="text" value="<%=tarefa.getNome()%>" name="nome" required/>
	            <label for="nome">Disciplina:</label>
	            <input class="input-block-level" type="text" value="<%=tarefa.getDisciplina()%>"name="disciplina" required/>
            <label for="situacao">Situação:</label>
                <select name="situacao">
                    <option>Finalizado </option>
                    <option>Nao Finalizado</option>
                </select>
            <label for="finalizacao">Data de Finalização:</label>
            <input type="text" value="<%=tarefa.getDataFinalizacao()%>"name="finalizacao" required/>
            <label for="msg">Mensagem</label>
            <textarea class="input-block-level" rows="8" cols="100" name="mensagem" required></textarea>
            <input class="btn btn-primary" type="submit" name="submit" value="Enviar">
            <button class="btn btn-primary" type="reset" name="reset">Limpar</button>
            <a class="btn btn-primary" href="tarefacontroller.do?acao=list#agenda">Cancelar</a>
            </fieldset>
    </form>
</body>
</html>