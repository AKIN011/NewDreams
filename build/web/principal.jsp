<%-- 
    Document   : dashboard
    Created on : 10/02/2024, 6:35:56 p. m.
    Author     : Felipe Rodriguez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>New Dreams-Dashboard</title>
        <link rel="stylesheet" href="css/stylesprincipal.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>

    <body id="body-pd">
        <header class="header" id="header">
            <div class="header_toggle"> <i class='bx bx-menu' id="header-toggle"></i> </div>
        </header>
        <div class="l-navbar" id="nav-bar">
            <nav class="nav">
                <div>
                    <div class="logo">
                        <img src="images/Logo.png" alt="logo">
                    </div>
                    <div class="nav_list">
                        <%
                            String usuario = (String) session.getAttribute("usuario");
                            String rol = (String) session.getAttribute("rol");
                        %>
                        <a class="nav_link">
                            <span class="nav_name"><%= usuario%></span>
                        </a>
                        <a class="nav_link">
                            <span class="nav_name"><%= rol%></span>
                        </a>
                        <a href="PrincipalServlet?menu=Inicio" target="myFrame" class="nav_link active">
                            <span class="nav_name">Inicio</span>
                        </a>
                        <a href="PrincipalServlet?menu=Cotizantes&accion=listar" target="myFrame" class="nav_link">
                            <span class="nav_name">Cotizantes</span>
                        </a>
                        <a href="PrincipalServlet?menu=Cotizaciones&accion=listar" target="myFrame" class="nav_link">
                            <span class="nav_name">Cotizaciones</span>
                        </a>
                        <a href="PrincipalServlet?menu=Clientes&accion=listar" target="myFrame" class="nav_link">
                            <span class="nav_name">Clientes</span>
                        </a>
                        <a href="PrincipalServlet?menu=Eventos" target="myFrame" class="nav_link">
                            <span class="nav_name">Eventos</span>
                        </a>
                        <a href="PrincipalServlet?menu=Estados" target="myFrame" class="nav_link">
                            <span class="nav_name">Estados</span>
                        </a>
                        <a href="PrincipalServlet?menu=Servicios" target="myFrame" class="nav_link">
                            <span class="nav_name">Servicios</span>
                        </a>
                    </div>
                </div>
                <!-- Botón de cerrar sesión -->
                <a id="logoutButton" name="logoutButton" class="nav_link">
                    <i class='bx bx-log-out nav_icon'></i>
                    <span class="nav_name">Cerrar Sesión</span>
                </a>
            </nav>
        </div>

        <div class="Frame">
            <iframe id="myFrame" name="myFrame">

            </iframe>
        </div>    

    </body>
    <script>
        document.getElementById('logoutButton').addEventListener('click', function (event) {
            event.preventDefault(); // Evitar que el enlace realice la acción predeterminada (navegar a una URL)

            // Enviar una solicitud al servidor para cerrar la sesión
            fetch('Controlador/LogoutServlet', {
                method: 'POST'
            }).then(function (response) {
                // Redireccionar a la página de inicio de sesión después de cerrar sesión
                window.location.href = 'login.jsp';
            }).catch(function (error) {
                console.error('Error al cerrar sesión:', error);
            });
        });
        window.onload = function () {
            document.getElementById('myFrame').src = 'dashboard.jsp';
        };
    </script>
</html>
