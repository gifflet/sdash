<%@ include file="include/head.jsp"%>
  <body>

    <div class="container">

      <form action="usucontroller.do" method="post" class="form-signin">
        <h2 class="form-signin-heading">Login</h2>
        <input type="text" class="input-block-level" name="email" placeholder="Email address">
        <input type="password" class="input-block-level" name="senha" placeholder="Password">
        <label class="checkbox">
          <input type="checkbox" value="remember-me"> Remember me
        </label>
        <button class="btn btn-large btn-primary" type="submit">Entrar</button>
        <br><br>
            <div class="alert alert-error">
    			<button type="button" class="close" data-dismiss="alert">×</button>
    				<h4>Acesso Negado!</h4>
    					Usuário ou Senha invalido!!
    		</div>
      </form>

    </div>
  </body>
</html>