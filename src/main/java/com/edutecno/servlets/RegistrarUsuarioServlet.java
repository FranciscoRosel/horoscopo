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
            String nombre = request.getParameter("nombre");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String repeatPassword = request.getParameter("repeatPassword");
            String fechaNacimientoStr = request.getParameter("fechaNacimiento");

            if (!password.equals(repeatPassword)) {
                request.setAttribute("alertMessage", "Las contraseñas no coinciden.");
                request.setAttribute("redirect", false);
                request.getRequestDispatcher("registrarse.jsp").forward(request, response);
                return;
            }

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaNacimiento = sdf.parse(fechaNacimientoStr);

            UsuarioDAO usuarioDAO = new UsuarioDAO();
            String animal = usuarioDAO.obtenerAnimalPorFecha(fechaNacimiento);

            Usuario usuario = new Usuario(0, nombre, username, email, fechaNacimiento, password, animal);

            usuarioDAO.crearUsuario(usuario);

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
