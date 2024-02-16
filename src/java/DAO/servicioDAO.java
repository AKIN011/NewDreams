package DAO;


import Modelo.servicio;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class servicioDAO {
    private Connection connection;

    public servicioDAO(Connection connection) {
        this.connection = connection;
    }

    //Metodo para consultar los registros de la base de datos en la tabla servicios
    public List<servicio> consultarTodosServicios() throws SQLException {
        List<servicio> servicios = new ArrayList<>();
        String query = "SELECT * FROM servicio";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String idServicio = resultSet.getString("idServicio");
                int valorServicio = resultSet.getInt("Valor_Servicio");
                String tipoServicio = resultSet.getString("Tipo_Servicio");
                String descripcionServicio = resultSet.getString("Descripcion_servicio");
                 System.out.println("ID: " + idServicio + ", Valor: " + valorServicio + ", Tipo: " + tipoServicio + ", Descripción: " + descripcionServicio);
                servicios.add(new servicio(idServicio, valorServicio, tipoServicio, descripcionServicio));
            }
        }
        return servicios;
    }
}

