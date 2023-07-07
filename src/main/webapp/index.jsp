<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-PT">
<head>
    <title>Festival de Musica Login</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="overdadeioCSS.css">
</head>
<body>
<header>
    <img src="logo.jpg" height="125px" width="250px" alt="">
</header>
<main>
    <style>
        body {
            background: linear-gradient(rgba(0,0,0,0.5),#fe4141);
            background-size: cover;
            background-position: center;
            height: 100vh;
            /* Define o fundo da página como vermelho */
        }

        /* Estilos adicionais */
        main {
            margin: 0 auto;
            max-width: 800px;
            padding: 20px;
            color: white;
        }

        .login {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin-top: -200px; /* Ajusta a margem superior para 100 pixels */
        }

        .login h2 {
            font-size: 3em; /* Tamanho da fonte três vezes maior */
        }

        .login form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .login input[type="text"],
        .login input[type="password"] {
            width: 200px;
        }

        .login button {
            height: 30px;
            width: 70px;
        }
    </style>

    <div class="login">
        <h2>Login</h2>
        <% String error = request.getParameter("error");
            if (error != null && error.equals("invalid")) { %>
        <p>Palavra-passe/Nome inválido. Tente novamente.</p>
        <% } %>
        <form action="index_2.jsp" method="POST">
            <label for="username">Nome de utilizador:</label>
            <input type="text" name="username" id="username">
            <br><br>
            <label for="password">Password:</label>
            <input type="password" name="password" id="password">
            <br><br>
            <button type="submit">Entrar</button>
        </form>
    </div>
</main>

</body>
</html>





