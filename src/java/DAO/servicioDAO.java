package DAO;


import Modelo.conexion;
import Modelo.servicio;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class servicioDAO {
    Connection con = new conexion().conectar();

    //Metodo para consultar los registros de la base de datos en la tabla servicios
    public List<servicio> consultarTodosServicios() {
        List<servicio> servicios = new ArrayList<>();
        String sql = "CALL SP_READLIST_SERVICIO";
        try (PreparedStatement statement = con.prepareStatement(sql)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                servicio ser = new servicio();
                ser.setServicioId(resultSet.getString(1));
                ser.setServicioValor(resultSet.getInt(2));
                ser.setServicioTipo(resultSet.getString(3));
                ser.setServicioDescripcion(resultSet.getString(4));
                servicios.add(ser);
            }
        }catch (Exception e){
            e.toString();
        }
        return servicios;
    }
}

