<%@page import="com.gestionturnos.turnero.logica.Turno"%>
<%@page import="com.gestionturnos.turnero.logica.Ciudadano"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<%@include file="components/head.jsp"%>
<%@include file="components/topnav.jsp"%>
<%@include file="components/sidenav.jsp"%>



<div class="container-fluid px-4">
    <h1 class="mt-5 m-5">Ver Ciudadanos</h1>
    <ol class="breadcrumb mb-4 m-5">
        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
        <li class="breadcrumb-item active">Tabla ciudadanos</li>
    </ol>
    <div class="card mb-4  ">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
            Tabla Ciudadanos
        </div>
        <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Teléfono</th>
                        <th>Dirección</th>
                        <th>Dni</th>
                        <th>Fecha de Nacimiento</th>
                        <th>Turnos</th>
                        <th>Eliminar</th>
                        <th>Editar</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Teléfono</th>
                        <th>Dirección</th>
                        <th>Dni</th>
                        <th>Fecha de Nacimiento</th>
                        <th>Turnos</th>
                        <th>Eliminar</th>
                        <th>Editar</th>
                    </tr>
                </tfoot>
              
                <tbody>
                    <%for (Ciudadano ciudadano : (List<Ciudadano>) request.getSession().getAttribute("listadoCiudadanos")) { %>
                    <tr>
                        <td id="id_ciudadano<%=ciudadano.getId_ciudadano()%>"><%=ciudadano.getId_ciudadano() %></td>
                        <td><%=ciudadano.getNombre() %></td>
                        <td><%=ciudadano.getApellido() %></td>
                        <td><%=ciudadano.getTelefono() %></td>
                        <td><%=ciudadano.getDireccion() %></td>
                        <td><%=ciudadano.getDni() %></td>
                        <td><%=ciudadano.fechaNacFormateada() %></td>
                        <td><%for (Turno turno : (List<Turno>) request.getSession().getAttribute("listadoTurnos")) { 
                                if(ciudadano.getDni().equals(turno.getCiudadano().getDni())) { %>
                                       <%=turno.fechaFormateada() %>
                                 <% } 
                              }%>
                        </td>
                            
                      
                        <td>
                            <form action="SvEliminarCiudadano" method="POST" name="eliminar"> <!-- para mandar el código al servlet -->
                                <button type="submit" style="border: none; background: none; "><i class="fas fa-solid fa-trash-can" style="color: red;"></i></button>
                                <input type="hidden" name="id" value="<%=ciudadano.getId_ciudadano() %>" /> <!-- para mandar el código al servlet solo visible para nosotros - no para el usuario -->
                            </form>
                        </td>
                        
                        <td>
                            <form action="SvEditarCiudadano" method="GET" name="editar"> <!-- para mandar el código al servlet -->
                                <button type="submit" style="border: none; background: none"><i class="fas fa-solid fa-pen-to-square" style="color: green;"></i></button>
                                <input type="hidden" name="id" value="<%=ciudadano.getId_ciudadano() %>" /> <!-- para mandar el código al servlet -->
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
