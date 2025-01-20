package com.edutecno.modelo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Horoscopo {
    private String animal;
    private Date fechaInicio;
    private Date fechaFin;
}
