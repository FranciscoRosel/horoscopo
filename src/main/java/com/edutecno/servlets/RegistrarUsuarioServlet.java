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
import java.util.Date;

@WebServlet("/registrarUsuario")
public class RegistrarUsuarioServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try {
            // Obtener los datos del formulario
            String nombre = request.getParameter("nombre");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String repeatPassword = request.getParameter("repeatPassword");
            String fechaNacimientoStr = request.getParameter("fechaNacimiento");

            // Validar que las contraseñas coincidan
            if (!password.equals(repeatPassword)) {
                request.setAttribute("alertMessage", "Las contraseñas no coinciden.");
                request.setAttribute("redirect", false);
                request.getRequestDispatcher("registrarse.jsp").forward(request, response);
                return;
            }

            // Convertir fecha de nacimiento
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaNacimiento = sdf.parse(fechaNacimientoStr);

            // Obtener el animal del horóscopo desde la base de datos
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            String animal = usuarioDAO.obtenerAnimalPorFecha(fechaNacimiento);

            // Crear el objeto usuario con el animal obtenido
            Usuario usuario = new Usuario(0, nombre, username, email, fechaNacimiento, password, animal);

            // Guardar el usuario en la base de datos
            usuarioDAO.crearUsuario(usuario);

            // Redirigir con mensaje de éxito
            request.setAttribute("alertMessage", "Usuario registrado exitosamente");
            request.setAttribute("redirect", true); // Indicar redirección
            request.getRequestDispatcher("registrarse.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("alertMessage", "Error al registrar el usuario.");
            request.setAttribute("redirect", false);
            request.getRequestDispatcher("registrarse.jsp").forward(request, response);
        }
    }
}
