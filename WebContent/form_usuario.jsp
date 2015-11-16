<%@ include file="include/head.jsp"%>
<link rel="stylesheet" href="css/style2.css"/>
<body>
    <form action="usucontroller.do" method="post" class="form-signin">
        	<fieldset>
            <legend>Formulario de Cadastro de Usuario</legend>
            	<label>Código:</label>
				<input type = "hidden" name="id" size="10"/>
            	<label for="nome">Nome:</label>
	            <input class="input-block-level" type="text" name="nome" required/>
	            <label for="email">Email:</label>
	            <input class="input-block-level" type="text" name="email" required/>
            	<label for="senha">Senha:</label>
            	<input type="password" name="senha" required/><br><br>
            	<input class="btn btn-primary" type="submit" name="submit" value="Cadastrar">
            	<button class="btn btn-primary" type="reset" name="reset">Limpar</button>
            	<a class="btn btn-primary" href="index.jsp">Cancelar</a>
            </fieldset>
    </form>
</body>
</html>