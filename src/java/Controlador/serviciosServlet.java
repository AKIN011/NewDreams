package Controlador;

import DAO.servicioDAO;
import Modelo.servicio;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class serviciosServlet extends HttpServlet {

    private servicioDAO servicioDAO = new servicioDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Procesando solicitud en el método processRequest()...");

        // Obtener lista de servicios
        System.out.println("Obteniendo lista de servicios...");
        List<servicio> lista = servicioDAO.consultarTodosServicios();

        // Imprimir número de servicios obtenidos
        System.out.println("Número de servicios obtenidos: " + lista.size());

        // Pasar lista de servicios al formulario JSP
        System.out.println("Pasando lista de servicios al formulario JSP...");
        request.setAttribute("servicios", lista);

        // Enviar la solicitud al JSP
        request.getRequestDispatcher("form.jsp").forward(request, response);

        // Mensaje indicando que la lista se ha pasado correctamente
        System.out.println("Lista de servicios pasada al formulario JSP con éxito.");
    }
}
