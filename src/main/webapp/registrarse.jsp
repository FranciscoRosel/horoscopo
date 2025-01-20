<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="styles.css">
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

<a href="index.jsp">Volver al inicio</a>

<div id="overlay" style="display:none;"></div>
<div id="customAlert" style="display:none;">
  <p id="alertMessage"></p>
  <button onclick="closeCustomAlert()">Aceptar</button>
</div>

<%
  String alertMessage = (String) request.getAttribute("alertMessage");
  Boolean redirect = (Boolean) request.getAttribute("redirect");
%>

<script>
  function showCustomAlert(message) {
    document.getElementById("alertMessage").innerText = message;
    document.getElementById("customAlert").style.display = "block";
    document.getElementById("overlay").style.display = "block";
  }

  function closeCustomAlert() {
    document.getElementById("customAlert").style.display = "none";
    document.getElementById("overlay").style.display = "none";
    <% if (Boolean.TRUE.equals(redirect)) { %>
    window.location.href = "index.jsp";
    <% } %>
  }

  <% if (alertMessage != null) { %>
  window.onload = function() {
    showCustomAlert("Tú Horóscopo Chino: <%= alertMessage %>");
  };
  <% } %>
</script>

</body>
</html>
