package DAO;

import Modelo.cliente;
import Modelo.conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class clienteDAO {

    Connection con = new conexion().conectar();
    PreparedStatement ps;
    ResultSet rs;
    int agregarCliente;

    // Método para validar las credenciales del cliente mediante correo y contraseña
    public boolean validarCrendenciales(String correo, String contraseña) {
        boolean resultado = false; // Variable para almacenar el resultado de la validación

        try {
            // Se establece la conexión a la base de datos utilizando la clase 'conexion'
            Connection con = new conexion().conectar();

            // Se define la consulta SQL para verificar las credenciales del cliente
            String query = "SELECT COUNT(*) FROM Cliente WHERE Correo_cotizante = ? AND Contraseña_Cliente = ?";

            // Se prepara la consulta SQL
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, correo); // Se establece el primer parámetro (correo) en la consulta
            pst.setString(2, contraseña); // Se establece el segundo parámetro (contraseña) en la consulta

            // Se ejecuta la consulta y se obtiene el resultado
            ResultSet rs = pst.executeQuery();

            // Si la consulta devuelve algún resultado
            if (rs.next()) {
                int count = rs.getInt(1); // Se obtiene el valor de la primera columna del resultado
                resultado = count == 1; // Si count es igual a 1, las credenciales son válidas y se establece 'resultado' como true
            }

            // Se cierran los recursos de base de datos para liberar memoria y conexiones
            rs.close();
            pst.close();
            con.close();
        } catch (SQLException ex) { // Se capturan las excepciones de SQL en caso de algún error
            ex.printStackTrace(); // Se imprime el rastreo de la pila de excepciones en la consola
        }

        // Se devuelve el resultado de la validación de las credenciales del cliente
        return resultado;
    }

    public List<cliente> listar() {
        List<cliente> lista = new ArrayList<>();
        String sql = "CALL SP_READLIST_CLIENTE";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery(); // Asignar el resultado de la consulta a rs
            while (rs.next()) {
                cliente clt = new cliente();
                clt.setCltId((char) rs.getShort(1));
                clt.setCltContraseña(rs.getString(2));
                clt.setCltCorreo(rs.getString(3));
                lista.add(clt);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Imprimir el error
        }
        return lista;
    }
    
    public int agregar(cliente clt) {
        String sql = "CALL SP_INSERT_CLIENTE (?, ?)";
        int filasAfectadas = 0;

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, clt.getCltContraseña());
            ps.setString(2, clt.getCltCorreo());

            filasAfectadas = ps.executeUpdate();
        } catch (SQLException e) {
            // Manejar la excepción adecuadamente, por ejemplo, imprimir el error
            e.printStackTrace();
        } finally {
            // Cerrar la conexión y la declaración preparada en el bloque finally
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                // Manejar la excepción si hay un error al cerrar la declaración preparada
                e.printStackTrace();
            }
        }

        return filasAfectadas; // Devolver el número de filas afectadas por la operación de inserción
    }

}
