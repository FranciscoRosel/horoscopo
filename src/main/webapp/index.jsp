<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles.css">
    <title>Iniciar Sesión</title>
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
    <button type="submit">Iniciar Sesión</button>
</form>

<a href="registrarse.jsp">Registrarse</a>

<%
    String errorMessage = (String) request.getAttribute("error");
    String alertMessage = request.getParameter("alert");
%>
<div id="overlay" style="display:none;"></div>
<div id="customAlert" style="display:none;">
    <p id="alertMessage"></p>
    <button onclick="closeCustomAlert()">Aceptar</button>
</div>

<script>
    function showCustomAlert(message) {
        document.getElementById("alertMessage").innerText = message;
        document.getElementById("customAlert").style.display = "block";
        document.getElementById("overlay").style.display = "block";
    }


    function closeCustomAlert() {
        document.getElementById("customAlert").style.display = "none";
        document.getElementById("overlay").style.display = "none";
    }

    <% if (errorMessage != null) { %>
    window.onload = function() {
        showCustomAlert("<%= errorMessage %>");
    };
    <% } else if (alertMessage != null) { %>
    window.onload = function() {
        showCustomAlert("<%= alertMessage %>");
    };
    <% } %>
</script>

</body>
</html>
