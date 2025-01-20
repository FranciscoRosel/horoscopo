<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <title>Listar Usuarios</title>
</head>
<body>
<h1>Lista de Usuarios</h1>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Usuario</th>
        <th>Email</th>
        <th>Fecha de Nacimiento</th>
        <th>Animal</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="usuario" items="${usuarios}">
        <tr>
            <td>${usuario.id}</td>
            <td>${usuario.nombre}</td>
            <td>${usuario.username}</td>
            <td>${usuario.email}</td>
            <td>${usuario.fechaNacimiento}</td>
            <td>${usuario.animal}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="menu.jsp">Volver al menú</a>
</body>
</html>
