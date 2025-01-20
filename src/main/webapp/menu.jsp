<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <title>Menú Principal</title>
</head>
<body>
<h1>Menú Principal</h1>
<p>Bienvenido, ${sessionScope.usuario.nombre}</p>
<div class="menu-container">
    <a href="consultaHoroscopo" class="menu-button">Consultar Horóscopo</a>
    <a href="listarUsuarios" class="menu-button">Listar Usuarios</a>
    <a href="buscarUsuario.jsp" class="menu-button">Buscar Usuario</a>
    <a href="modificarCuenta" class="menu-button">Modificar Cuenta</a>
    <a href="eliminarUsuario.jsp" class="menu-button">Eliminar Cuenta</a>
</div>
<div style="margin-top: 2rem;">
    <a href="index.jsp" class="menu-button" style="background-color: #dc3545;">Cerrar Sesión</a>
</div>
</body>
</html>
