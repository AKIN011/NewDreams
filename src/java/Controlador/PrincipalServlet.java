
package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Felipe Rodriguez
 */
public class PrincipalServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion == null || accion.isEmpty()) {
            // Si no se proporciona ningún parámetro de acción, redirecciona al dashboard
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            return; // Importante: termina la ejecución del método después de la redirección
        }
        switch (accion) {
            case "Inicio" -> request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            case "Cotizaciones" -> request.getRequestDispatcher("cotizaciones.jsp").forward(request, response);
            case "Cotizantes" -> request.getRequestDispatcher("cotizantes.jsp").forward(request, response);
            case "Clientes" -> request.getRequestDispatcher("clientes.jsp").forward(request, response);
            case "Eventos" -> request.getRequestDispatcher("eventos.jsp").forward(request, response);
            case "Estados" -> request.getRequestDispatcher("estados.jsp").forward(request, response);
            case "Servicios" -> request.getRequestDispatcher("servicios.jsp").forward(request, response);
            default -> throw new AssertionError();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
