<%@page import="com.gestionturnos.turnero.logica.Turno"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<%@include file="components/head.jsp"%>
<%@include file="components/topnav.jsp"%>
<%@include file="components/sidenav.jsp"%>



<div class="container-fluid px-4">
    <h1 class="mt-5 m-5">Ver Turnos</h1>
    <ol class="breadcrumb mb-4 m-5">
        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
        <li class="breadcrumb-item active">Tabla turnos</li>
    </ol>
    <div class="card mb-4  ">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
            Tabla Turnos
        </div>
        <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Fecha</th>
                        <th>Dni Ciudadano</th>
                        <th>Trámite</th>
                        <th>Estado</th>
                        <th>Eliminar</th>
                        <th>Editar</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Id</th>
                        <th>Fecha</th>
                        <th>Dni Ciudadano</th>
                        <th>Trámite</th>
                        <th>Estado</th>
                        <th>Eliminar</th>
                        <th>Editar</th>
                    </tr>
                </tfoot>
              
                <tbody>
                    <%for (Turno turno : (List<Turno>) request.getSession().getAttribute("listadoTurnos")) { %>
                    <tr>
                        <td id="idTurno<%=turno.getIdTurno()%>"><%=turno.getIdTurno() %></td>
                        <td><%=turno.fechaFormateada() %></td>
                        <td><%=turno.getCiudadano().getDni() %></td>
                        <td><%=turno.getDescripcionTramite() %></td>
                        <td><%=turno.getEstado() %></td>
                        <td>
                            <form action="SvEliminarTurno" method="POST" name="eliminar"> <!-- para mandar el código al servlet -->
                                <button type="submit" style="border: none; background: none"><i class="fas fa-solid fa-trash-can" style="color: red;"></i></button>
                                <input type="hidden" name="id" value="<%=turno.getIdTurno() %>" /> <!-- para mandar el código al servlet solo visible para nosotros - no para el usuario -->
                            </form>
                        </td>
                        
                        <td>
                            <form action="SvEditarTurno" method="GET" name="editar"> <!-- para mandar el código al servlet -->
                                <button type="submit" style="border: none; background: none"><i class="fas fa-solid fa-pen-to-square" style="color: green;"></i></button>
                                <input type="hidden" name="id" value="<%=turno.getIdTurno() %>" /> <!-- para mandar el código al servlet -->
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>




<%@include file="components/footer.jsp"%>
<%@include file="components/bodyfinal.jsp"%>
</html>
