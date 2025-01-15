package com.edutecno.modelo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Usuario {
    private int id; // Asegúrate de que este campo existe y es un entero
    private String nombre;
    private String username;
    private String email;
    private Date fechaNacimiento;
    private String password;
    private String animal;
}
