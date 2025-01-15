<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Crear Usuario</title>
</head>
<body>
<h1>Crear Usuario</h1>
<form action="crearUsuario" method="post">
  <label for="nombre">Nombre:</label>
  <input type="text" id="nombre" name="nombre" required>
  <br>
  <label for="username">Usuario:</label>
  <input type="text" id="username" name="username" required>
  <br>
  <label for="email">Email:</label>
  <input type="email" id="email" name="email" required>
  <br>
  <label for="fechaNacimiento">Fecha de Nacimiento:</label>
  <input type="date" id="fechaNacimiento" name="fechaNacimiento" required>
  <br>
  <label for="password">Contraseña:</label>
  <input type="password" id="password" name="password" required>
  <br>
  <button type="submit">Crear</button>
</form>
<a href="menu.jsp">Volver al menú</a>
</body>
</html>
