package com.edutecno.servlets;

import com.edutecno.dao.UsuarioDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/eliminarUsuario")
public class EliminarUsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Obtener el ID del usuario desde los parámetros
            int id = Integer.parseInt(request.getParameter("id"));

            // Eliminar el usuario con el ID proporcionado
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            usuarioDAO.eliminarUsuario(id);

            // Redirigir a la página de listado de usuarios
            response.sendRedirect("listarUsuarios");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al eliminar el usuario.");
            request.getRequestDispatcher("listarUsuarios.jsp").forward(request, response);
        }
    }
}
