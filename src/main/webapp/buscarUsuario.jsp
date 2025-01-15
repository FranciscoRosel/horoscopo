<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Buscar Usuario</title>
</head>
<body>
<h1>Buscar Usuario</h1>
<form action="buscarUsuario" method="post">
  <label for="criterio">Criterio de búsqueda:</label>
  <input type="text" id="criterio" name="criterio" value="${criterio}" required>
  <button type="submit">Buscar</button>
</form>

<c:if test="${not empty usuarios}">
  <h2>Resultados de búsqueda</h2>
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
</c:if>

<a href="menu.jsp">Volver al menú</a>
</body>
</html>
