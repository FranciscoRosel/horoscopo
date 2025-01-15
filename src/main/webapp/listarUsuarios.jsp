<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
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
        <th>Acciones</th>
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
            <td>
                <a href="eliminarUsuario?id=${usuario.id}">Eliminar</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="menu.jsp">Volver al menú</a>
</body>
</html>
