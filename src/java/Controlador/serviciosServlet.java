package Controlador;

import DAO.servicioDAO;
import Modelo.conexion;
import Modelo.servicio;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class serviciosServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Crear instancia de conexion
        conexion con = new conexion();
        
        // Obtener conexión a la base de datos
        Connection connection = con.conectar();
        
        // Crear instancia de servicioDAO
        servicioDAO servicioDAO = new servicioDAO(connection);

        try {
            // Consultar todos los servicios
            List<servicio> servicios = servicioDAO.consultarTodosServicios();

            // Agregar la lista de servicios como atributo de solicitud
            request.setAttribute("servicios", servicios);

            // Enviar la solicitud al JSP
            request.getRequestDispatcher("WebPages/form.jsp").forward(request, response);
            System.out.println("Datos de servicios: " + servicios);

        } catch (SQLException e) {
            e.printStackTrace();
            // Manejo de errores
        }
        
    }
}

