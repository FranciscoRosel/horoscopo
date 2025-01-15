package com.edutecno.servlets;

import com.edutecno.dao.UsuarioDAO;
import com.edutecno.modelo.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@WebServlet("/crearUsuario")
public class CrearUsuarioServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Obtener los datos del formulario
            String nombre = request.getParameter("nombre");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String fechaNacimientoStr = request.getParameter("fechaNacimiento");

            // Convertir fecha de nacimiento
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaNacimiento = sdf.parse(fechaNacimientoStr);

            // Calcular el animal del horóscopo
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(fechaNacimiento);
            int anioNacimiento = calendar.get(Calendar.YEAR);
            String animal = calcularAnimal(anioNacimiento);

            // Crear el objeto usuario
            Usuario usuario = new Usuario(0, nombre, username, email, fechaNacimiento, password, animal);

            // Guardar el usuario en la base de datos
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            usuarioDAO.crearUsuario(usuario);

            // Redirigir a la lista de usuarios
            response.sendRedirect("listarUsuarios");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al crear el usuario.");
            request.getRequestDispatcher("crearUsuario.jsp").forward(request, response);
        }
    }

    // Método para calcular el signo del horóscopo
    private String calcularAnimal(int anioNacimiento) {
        String[] signos = {"Rata", "Buey", "Tigre", "Conejo", "Dragón", "Serpiente",
                "Caballo", "Cabra", "Mono", "Gallo", "Perro", "Cerdo"};
        return signos[anioNacimiento % 12];
    }
}
