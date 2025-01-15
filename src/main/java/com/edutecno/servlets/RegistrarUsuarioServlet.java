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
        try {
            String nombre = request.getParameter("nombre");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String repeatPassword = request.getParameter("repeatPassword");
            String fechaNacimientoStr = request.getParameter("fechaNacimiento");

            if (!password.equals(repeatPassword)) {
                request.setAttribute("mensaje", "Las contraseñas no coinciden.");
                request.getRequestDispatcher("registrarse.jsp").forward(request, response);
                return;
            }

            // Convertir fecha de nacimiento
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaNacimiento = sdf.parse(fechaNacimientoStr);

            // Obtener el animal del horóscopo
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            String animal = usuarioDAO.obtenerAnimalPorFecha(fechaNacimiento);

            if (animal == null) {
                request.setAttribute("mensaje", "No se encontró un animal del horóscopo para la fecha ingresada.");
                request.getRequestDispatcher("registrarse.jsp").forward(request, response);
                return;
            }

            // Crear el usuario con el animal correcto
            Usuario usuario = new Usuario(0, nombre, username, email, fechaNacimiento, password, animal);
            usuarioDAO.crearUsuario(usuario);

            request.setAttribute("mensaje", "Registro realizado con éxito.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mensaje", "Error al registrar el usuario.");
            request.getRequestDispatcher("registrarse.jsp").forward(request, response);
        }
    }
}
