<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles.css">
    <meta charset="UTF-8">
    <title>Menú Principal</title>
</head>
<body>
<h1>Menú Principal</h1>
<p>Bienvenido, ${sessionScope.usuario.nombre}</p>
<ul>
    <li><a href="consultaHoroscopo">Consultar Horóscopo</a></li>
    <li><a href="listarUsuarios">Listar Usuarios</a></li>
    <li><a href="buscarUsuario.jsp">Buscar Usuario</a></li>
    <li><a href="modificarCuenta">Modificar Cuenta</a></li>
    <li><a href="eliminarUsuario.jsp">Eliminar Cuenta</a></li>
</ul>
<a href="index.jsp">Cerrar Sesión</a>
</body>
</html>
