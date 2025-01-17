<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="styles.css">
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
