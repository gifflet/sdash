<%@ include file="include/head.jsp"%>
  <body>
    <div class="container">
      <form action="usucontroller.do" method="post" class="form-signin">
        <h2 class="form-signin-heading">Login</h2>
<<<<<<< HEAD
        <input type="hidden" class="input-block-level" name="nome" value="1">
        <input type="text" class="input-block-level" name="email" placeholder="Email address">
        <input type="password" class="input-block-level" name="senha" placeholder="Password">
        <button class="btn btn-large btn-primary" type="submit">Entrar</button><br><br>
        <a class="btn btn-primary" href="form_usuario.jsp">Cadastra-se aqui</a> 
=======
        <input type="text" class="input-block-level" name="email" placeholder="Email address">
        <input type="password" class="input-block-level" name="senha" placeholder="Password">
        <label class="checkbox">
          <input type="checkbox" value="remember-me"> Remember me
        </label>
        <button class="btn btn-large btn-primary" type="submit">Entrar</button>
>>>>>>> master
      </form>
    </div>
  </body>
</html>