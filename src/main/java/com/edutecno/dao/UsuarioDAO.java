package com.edutecno.dao;

import com.edutecno.modelo.Usuario;
import com.edutecno.procesaconexion.ConexionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    public List<Usuario> obtenerUsuarios() {
        List<Usuario> usuarios = new ArrayList<>();
        String sql = "SELECT id, nombre, username, email, fecha_nacimiento, password, animal FROM usuarios";

        try (Connection conn = ConexionDB.getConexion();
             PreparedStatement pstm = conn.prepareStatement(sql);
             ResultSet rs = pstm.executeQuery()) {

            while (rs.next()) {
                Usuario usuario = new Usuario(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getDate("fecha_nacimiento"),
                        rs.getString("password"),
                        rs.getString("animal")
                );
                usuarios.add(usuario);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return usuarios;
    }

    public void crearUsuario(Usuario usuario) {
        String sql = "INSERT INTO usuarios (nombre, username, email, fecha_nacimiento, password, animal) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConexionDB.getConexion();
             PreparedStatement pstm = conn.prepareStatement(sql)) {

            pstm.setString(1, usuario.getNombre());
            pstm.setString(2, usuario.getUsername());
            pstm.setString(3, usuario.getEmail());
            pstm.setDate(4, new java.sql.Date(usuario.getFechaNacimiento().getTime()));
            pstm.setString(5, usuario.getPassword());
            pstm.setString(6, usuario.getAnimal());
            pstm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void eliminarUsuario(int id) {
        String sql = "DELETE FROM usuarios WHERE id = ?";

        try (Connection conn = ConexionDB.getConexion();
             PreparedStatement pstm = conn.prepareStatement(sql)) {

            pstm.setInt(1, id);
            pstm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void modificarCuenta(Usuario usuario) {
        String sql = "UPDATE usuarios SET nombre = ?, username = ?, email = ?, password = ?, fecha_nacimiento = ?, animal = ? WHERE id = ?";

        try (Connection conn = ConexionDB.getConexion();
             PreparedStatement pstm = conn.prepareStatement(sql)) {

            String nuevoAnimal = obtenerAnimalPorFecha(usuario.getFechaNacimiento());
            usuario.setAnimal(nuevoAnimal);

            pstm.setString(1, usuario.getNombre());
            pstm.setString(2, usuario.getUsername());
            pstm.setString(3, usuario.getEmail());
            pstm.setString(4, usuario.getPassword());
            pstm.setDate(5, new java.sql.Date(usuario.getFechaNacimiento().getTime()));
            pstm.setString(6, usuario.getAnimal());
            pstm.setInt(7, usuario.getId());

            pstm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Usuario> buscarUsuarios(String criterio) {
        List<Usuario> usuarios = new ArrayList<>();
        String sql = "SELECT id, nombre, username, email, fecha_nacimiento, password, animal " +
                "FROM usuarios WHERE nombre LIKE ? OR username LIKE ?";

        try (Connection conn = ConexionDB.getConexion();
             PreparedStatement pstm = conn.prepareStatement(sql)) {

            String searchParam = "%" + criterio + "%";
            pstm.setString(1, searchParam);
            pstm.setString(2, searchParam);

            try (ResultSet rs = pstm.executeQuery()) {
                while (rs.next()) {
                    Usuario usuario = new Usuario(
                            rs.getInt("id"),
                            rs.getString("nombre"),
                            rs.getString("username"),
                            rs.getString("email"),
                            rs.getDate("fecha_nacimiento"),
                            rs.getString("password"),
                            rs.getString("animal")
                    );
                    usuarios.add(usuario);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return usuarios;
    }
    public Usuario validarUsuario(String username, String password) {
        String sql = "SELECT * FROM usuarios WHERE username = ? AND password = ?";
        Usuario usuario = null;

        try (Connection conn = ConexionDB.getConexion();
             PreparedStatement pstm = conn.prepareStatement(sql)) {

            pstm.setString(1, username);
            pstm.setString(2, password);

            try (ResultSet rs = pstm.executeQuery()) {
                if (rs.next()) {
                    usuario = new Usuario(
                            rs.getInt("id"),
                            rs.getString("nombre"),
                            rs.getString("username"),
                            rs.getString("email"),
                            rs.getDate("fecha_nacimiento"),
                            rs.getString("password"),
                            rs.getString("animal")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return usuario;
    }

    public String obtenerAnimalPorFecha(java.util.Date fechaNacimiento) {
        String sql = "SELECT ANIMAL FROM HOROSCOPO WHERE ? BETWEEN FECHA_INICIO AND FECHA_FIN";
        String animal = null;

        try (Connection conn = ConexionDB.getConexion();
             PreparedStatement pstm = conn.prepareStatement(sql)) {

            pstm.setDate(1, new java.sql.Date(fechaNacimiento.getTime()));

            try (ResultSet rs = pstm.executeQuery()) {
                if (rs.next()) {
                    animal = rs.getString("ANIMAL");
                } else {
                    System.out.println("No se encontró un rango de fechas válido en la tabla HOROSCOPO para la fecha: " + fechaNacimiento);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return animal;
    }
}
