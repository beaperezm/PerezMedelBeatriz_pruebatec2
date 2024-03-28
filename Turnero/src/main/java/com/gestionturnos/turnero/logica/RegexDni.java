
package com.gestionturnos.turnero.logica;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexDni {
    
    //Definiendo la expresión regular para que sólo se puedan introducir DNI de 8 números y una letra
    private String regex = "\\b\\d{8}[A-Z-a-z]\\b";
    
  
    public boolean comprobarDni(String dni) {
        Pattern pattern = Pattern.compile(regex); //Compilando la regex
        Matcher matcher = pattern.matcher(dni); //Buscando coincidencias
        return matcher.matches();
    }
    
}
