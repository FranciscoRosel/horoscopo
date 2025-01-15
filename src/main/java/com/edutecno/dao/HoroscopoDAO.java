package com.edutecno.dao;

import com.edutecno.modelo.Horoscopo;
import com.edutecno.procesaconexion.ConexionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HoroscopoDAO {
    public List<Horoscopo> obtenerHoroscopos() {
        List<Horoscopo> lista = new ArrayList<>();
        String sql = "SELECT * FROM horoscopo";

        try (Connection conn = ConexionDB.getConexion();
             PreparedStatement pstm = conn.prepareStatement(sql);
             ResultSet rs = pstm.executeQuery()) {

            while (rs.next()) {
                Horoscopo horoscopo = new Horoscopo(
                        rs.getString("animal"),
                        rs.getDate("fecha_inicio"),
                        rs.getDate("fecha_fin")
                );
                lista.add(horoscopo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }
}
