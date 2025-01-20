<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles.css">
  <meta charset="UTF-8">
  <title>Modificar Cuenta</title>
</head>
<body>
<h1>Modificar Datos de la Cuenta</h1>
<form action="modificarCuenta" method="post">
  <label for="nombre">Nombre:</label>
  <input type="text" id="nombre" name="nombre" value="${usuario.nombre}" required>
  <br>
  <label for="username">Usuario:</label>
  <input type="text" id="username" name="username" value="${usuario.username}" required>
  <br>
  <label for="email">Correo Electrónico:</label>
  <input type="email" id="email" name="email" value="${usuario.email}" required>
  <br>
  <br>
  <label for="fechaNacimiento">Fecha de Nacimiento:</label>
  <input type="date" id="fechaNacimiento" name="fechaNacimiento" value="<%= request.getAttribute("fechaNacimiento") %>" required>
  <br>
  <label for="password">Nueva Contraseña:</label>
  <input type="password" id="password" name="password" value="${usuario.password}" required>
  <br>
  <button type="submit">Guardar Cambios</button>
</form>
<p style="color: red;">
  ${requestScope.error}
</p>
<a href="menu.jsp">Volver al menú</a>
</body>
</html>
