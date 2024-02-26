<%-- 
    Document   : dashboard
    Created on : 10/02/2024, 6:35:56 p. m.
    Author     : Felipe Rodriguez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>New Dreams-Dashboard</title>
        <link rel="stylesheet" href="css/stylesdashboard.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>

    <body id="body-pd">
        <!--Container Main start-->
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Correo Cotizante</th>
                                <th scope="col">Tipo de Evento</th>
                                <th scope="col">Ver Detalle</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="cotizacion" items="${cotizaciones}">
                                <tr>
                                    <td>${cotizacion[7]}</td>
                                    <td>${cotizacion[1]}</td>
                                    <td>
                                        <!-- Botón para mostrar el detalle -->
                                        <button class="ver-detalle-btn">Ver Detalle</button>
                                        <!-- Detalle desplegable oculto por defecto -->
                                        <div class="detalle">
                                            <!-- Aquí debes agregar el contenido detallado -->
                                            <table>
                                                <tr>
                                                    <td>${cotizacion[2]}</td>
                                                    <td>${cotizacion[3]}</td>
                                                    <td>${cotizacion[4]}</td>
                                                    <td>${cotizacion[5]}</td>
                                                    <td>${cotizacion[6]}</td>
                                                    <td>${cotizacion[0]}</td>
                                                    <td>${cotizacion[8]}</td>
                                                    <td>${cotizacion[9]}</td>
                                                    <td>${cotizacion[10]}</td>
                                                    <td>${cotizacion[11]}</td>
                                                    <td>${cotizacion[12]}</td>
                                                    <td>${cotizacion[13]}</td>
                                                    <td>${cotizacion[14]}</td>
                                                    <td><i class="fa-solid fa-user-plus crear-cliente-btn" style="cursor: pointer;"></i></td>
                                                    <td><i class="fa-solid fa-trash"></i></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script>
            // Script para manejar el clic en el botón "Ver Detalle"
            document.querySelectorAll('.ver-detalle-btn').forEach(btn => {
                btn.addEventListener('click', function () {
                    // Obtener el elemento padre de este botón (fila de la tabla)
                    const fila = this.closest('tr');
                    // Buscar el detalle asociado a esta fila
                    const detalle = fila.querySelector('.detalle');
                    // Cambiar el estado de visualización del detalle
                    detalle.style.display = detalle.style.display === 'none' ? 'table-row' : 'none';
                });
            });
        </script>
    </body>

</html>