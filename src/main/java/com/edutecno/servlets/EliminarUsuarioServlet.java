package com.edutecno.servlets;

import com.edutecno.dao.UsuarioDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/eliminarUsuario")
public class EliminarUsuarioServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = ((com.edutecno.modelo.Usuario) session.getAttribute("usuario")).getId();

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        usuarioDAO.eliminarUsuario(userId);

        // Invalidar la sesión después de eliminar el usuario
        session.invalidate();

        // Redirigir al index.jsp con un parámetro en la URL
        response.sendRedirect("index.jsp?alert=Cuenta eliminada exitosamente");
    }
}
