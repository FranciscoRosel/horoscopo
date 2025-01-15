<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Inicio de Sesión</title>
</head>
<body>
<h1>Iniciar Sesión</h1>
<form action="login" method="post">
    <label for="username">Usuario:</label>
    <input type="text" id="username" name="username" required>
    <br>
    <label for="password">Contraseña:</label>
    <input type="password" id="password" name="password" required>
    <br>
    <button type="submit">Ingresar</button>
</form>
<p style="color: red;">
    ${requestScope.error}
</p>
<p>¿No tienes una cuenta? <a href="registrarse.jsp">Crea una aquí</a>.</p>
</body>
</html>
