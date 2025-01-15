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

@WebServlet("/modificarUsuario")
public class ModificarUsuarioServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String fechaNacimientoStr = request.getParameter("fechaNacimiento");
            String password = request.getParameter("password");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Usuario usuario = new Usuario(id, nombre, username, email, sdf.parse(fechaNacimientoStr), password, null);

            UsuarioDAO usuarioDAO = new UsuarioDAO();
            usuarioDAO.modificarUsuario(usuario);

            response.sendRedirect("listarUsuarios.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al modificar usuario.");
            request.getRequestDispatcher("modificarUsuario.jsp").forward(request, response);
        }
    }
}
