package Controlador;

import DAO.clienteDAO;
import DAO.cotizanteDAO;
import Modelo.cliente;
import Modelo.cotizante;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Felipe Rodriguez
 */
public class PrincipalServlet extends HttpServlet {

    cotizante cotizante = new cotizante();
    cotizanteDAO cotizanteDAO = new cotizanteDAO();
    cliente cliente = new cliente();
    clienteDAO clienteDAO = new clienteDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        if (menu.equals("Inicio")) {
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        }
        if (menu.equals("Cotizaciones")) {
            request.getRequestDispatcher("cotizaciones.jsp").forward(request, response);
        }
        if (menu.equals("Cotizantes")) {
            switch (accion) {
                case "listar":
                    List lista = cotizanteDAO.listar();
                    request.setAttribute("cotizantes", lista);
                    break;
                case "Agregar":
                    String correo = request.getParameter("correoClt");
                    String contraseña = request.getParameter("contraseñaClt");
                    cliente.setCltCorreo(correo);
                    cliente.setCltContraseña(contraseña);
                    clienteDAO.agregar(cliente);
                    request.getRequestDispatcher("PrincipalServlet?menu=Cotizantes&accion=listar").forward(request, response);
                    break;
                case "Editar":
                    break;
                case "Eliminar":
                    break;
            }
            request.getRequestDispatcher("cotizantes.jsp").forward(request, response);
        }
        if (menu.equals("Clientes")) {
            switch (accion) {
                case "listar":
                    List lista = clienteDAO.listar();
                    request.setAttribute("clientes", lista);
                    break;
            }
            request.getRequestDispatcher("clientes.jsp").forward(request, response);
        }
        if (menu.equals("Eventos")) {
            request.getRequestDispatcher("eventos.jsp").forward(request, response);
        }
        if (menu.equals("Estados")) {
            request.getRequestDispatcher("estados.jsp").forward(request, response);
        }
        if (menu.equals("Servicios")) {
            request.getRequestDispatcher("servicios.jsp").forward(request, response);
        }
        throw new AssertionError();

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
