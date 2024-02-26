package DAO;

import Modelo.conexion;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class cotizacionDAO {
    Connection con = new conexion().conectar();
    PreparedStatement ps;
    ResultSet rs;

    public List<Object[]> listarCotizaciones() {
        List<Object[]> lista = new ArrayList<>();
        String sql = "SELECT Cot.No_Cotizacion, Cot.Tipo_Cotizacion, Cot.Ubicacion, Cot.Fecha_Parcial_Evento_Cotización, Cot.Fecha_Hora_Cotizacion, Cot.Valor_Cotización,"
                + "Cot.Cantidad_Personas_Cotización, Cot.Cotizante_Correo, Ctz.Nombre_Cotizante, Ctz.Apellido_Cotizante, Ctz.Telefono_Cotizante, Ser.idServicio, Ser.Valor_Servicio,"
                + "Ser.Tipo_Servicio, Ser.Descripcion_servicio FROM Cotización Cot "
                + "JOIN Cotizante Ctz ON Cot.Cotizante_Correo = Ctz.Correo_Cotizante "
                + "JOIN Cotizacion_Servicio CS ON Cot.No_Cotizacion = CS.Cotizacion_No_Cotizacion "
                + "JOIN Servicio Ser ON CS.Servicio_idServicio = Ser.idServicio";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Object[] cotizacion = new Object[15];
                cotizacion[0] = rs.getString("No_Cotizacion");
                cotizacion[1] = rs.getString("Tipo_Cotizacion");
                cotizacion[2] = rs.getString("Ubicacion");
                cotizacion[3] = rs.getDate("Fecha_Parcial_Evento_Cotización");
                cotizacion[4] = rs.getDate("Fecha_Hora_Cotizacion");
                cotizacion[5] = rs.getInt("Valor_Cotización");
                cotizacion[6] = rs.getInt("Cantidad_Personas_Cotización");
                cotizacion[7] = rs.getString("Cotizante_Correo");
                cotizacion[8] = rs.getString("Nombre_Cotizante");
                cotizacion[9] = rs.getString("Apellido_Cotizante");
                cotizacion[10] = rs.getString("Telefono_Cotizante");
                cotizacion[11] = rs.getString("idServicio");
                cotizacion[12] = rs.getInt("Valor_Servicio");
                cotizacion[13] = rs.getString("Tipo_Servicio");
                cotizacion[14] = rs.getString("Descripcion_servicio");
                lista.add(cotizacion);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Imprimir el error
        }
        return lista;
    }
}
