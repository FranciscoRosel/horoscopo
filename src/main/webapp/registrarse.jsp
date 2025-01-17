<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles.css">
  <meta charset="UTF-8">
  <title>Registrarse</title>
</head>
<body>
<h1>Crear Cuenta</h1>
<form action="registrarUsuario" method="post">
  <label for="nombre">Nombre:</label>
  <input type="text" id="nombre" name="nombre" required>
  <br>
  <label for="username">Usuario:</label>
  <input type="text" id="username" name="username" required>
  <br>
  <label for="email">Correo Electrónico:</label>
  <input type="email" id="email" name="email" required>
  <br>
  <label for="fechaNacimiento">Fecha de Nacimiento:</label>
  <input type="date" id="fechaNacimiento" name="fechaNacimiento" required>
  <br>
  <label for="password">Contraseña:</label>
  <input type="password" id="password" name="password" required>
  <br>
  <label for="repeatPassword">Repetir Contraseña:</label>
  <input type="password" id="repeatPassword" name="repeatPassword" required>
  <br>
  <button type="submit">Registrarse</button>
</form>
<p style="color: red;">
  ${requestScope.error}
</p>
<a href="index.jsp">Volver al inicio</a>
</body>
</html>
