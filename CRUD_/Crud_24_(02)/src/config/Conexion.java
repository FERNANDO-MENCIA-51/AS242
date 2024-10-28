package config;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    Connection con;

    public Conexion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud", "root", "Mencia1234");
        } catch (Exception e) {
        }
    }

    public Connection getConnection() {
        return con;
    }

    public static void main(String[] args) {
        Conexion conexion = new Conexion();
        if (conexion.getConnection() != null) {
            System.out.println("Conexion establecida correctamente.");
        } else {
            System.out.println("No se pudo establecer la conexión.");
        }
    }
}
