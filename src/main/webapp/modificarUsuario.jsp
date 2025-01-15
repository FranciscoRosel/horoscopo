<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Modificar Usuario</title>
</head>
<body>
<h1>Modificar Usuario</h1>
<form action="modificarUsuario" method="post">
  <input type="hidden" name="id" value="${usuario.id}">
  <label for="nombre">Nombre:</label>
  <input type="text" id="nombre" name="nombre" value="${usuario.nombre}" required>
  <br>
  <label for="username">Usuario:</label>
  <input type="text" id="username" name="username" value="${usuario.username}" required>
  <br>
  <label for="email">Email:</label>
  <input type="email" id="email" name="email" value="${usuario.email}" required>
  <br>
  <label for="fechaNacimiento">Fecha de Nacimiento:</label>
  <input type="date" id="fechaNacimiento" name="fechaNacimiento" value="${usuario.fechaNacimiento}" required>
  <br>
  <label for="password">Contraseña:</label>
  <input type="password" id="password" name="password" value="${usuario.password}" required>
  <br>
  <button type="submit">Modificar</button>
</form>
<a href="menu.jsp">Volver al menú</a>
</body>
</html>