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

@WebServlet("/registrarUsuario")
public class RegistrarUsuarioServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String nombre = request.getParameter("nombre");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String repeatPassword = request.getParameter("repeatPassword");
            String fechaNacimientoStr = request.getParameter("fechaNacimiento");

            // Validar contraseñas
            if (!password.equals(repeatPassword)) {
                request.setAttribute("error", "Las contraseñas no coinciden.");
                request.getRequestDispatcher("registrarse.jsp").forward(request, response);
                return;
            }

            // Convertir fecha de nacimiento y calcular signo
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaNacimiento = sdf.parse(fechaNacimientoStr);

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(fechaNacimiento);
            int anioNacimiento = calendar.get(Calendar.YEAR);

            String[] signos = {"Rata", "Buey", "Tigre", "Conejo", "Dragón", "Serpiente",
                    "Caballo", "Cabra", "Mono", "Gallo", "Perro", "Cerdo"};
            String animal = signos[anioNacimiento % 12];

            // Crear usuario y guardarlo en la base de datos
            Usuario usuario = new Usuario(0, nombre, username, email, fechaNacimiento, password, animal);
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            usuarioDAO.crearUsuario(usuario);

            // Redirigir al inicio de sesión
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al registrar el usuario.");
            request.getRequestDispatcher("registrarse.jsp").forward(request, response);
        }
    }
}
