package com.edutecno.servlets;

import com.edutecno.dao.UsuarioDAO;
import com.edutecno.modelo.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/modificarCuenta")
public class ModificarCuentaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuario");

        if (usuario == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        request.setAttribute("usuario", usuario);

        if (usuario.getFechaNacimiento() != null) {
            request.setAttribute("fechaNacimiento", new SimpleDateFormat("yyyy-MM-dd").format(usuario.getFechaNacimiento()));
        }
        request.getRequestDispatcher("modificarCuenta.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuario");

        if (usuario == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        try {
            String nombre = request.getParameter("nombre");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String fechaNacimientoStr = request.getParameter("fechaNacimiento");

            usuario.setNombre(nombre);
            usuario.setUsername(username);
            usuario.setEmail(email);
            usuario.setPassword(password);

            if (fechaNacimientoStr != null && !fechaNacimientoStr.isEmpty()) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                usuario.setFechaNacimiento(sdf.parse(fechaNacimientoStr));
            }

            UsuarioDAO usuarioDAO = new UsuarioDAO();
            usuarioDAO.modificarCuenta(usuario);

            session.setAttribute("usuario", usuario);
            response.sendRedirect("menu.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al actualizar los datos de la cuenta.");
            request.getRequestDispatcher("modificarCuenta.jsp").forward(request, response);
        }
    }
}
