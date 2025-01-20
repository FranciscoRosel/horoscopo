<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="styles.css">
  <title>Eliminar Cuenta</title>
</head>
<body>
<h1>Eliminar Cuenta</h1>
<p>¿Estás seguro de que deseas eliminar tu cuenta? Esta acción no se puede deshacer.</p>
<form action="eliminarUsuario" method="post">
  <button type="submit">Eliminar Cuenta</button>
  <a href="menu.jsp">Cancelar</a>
</form>
</body>
</html>