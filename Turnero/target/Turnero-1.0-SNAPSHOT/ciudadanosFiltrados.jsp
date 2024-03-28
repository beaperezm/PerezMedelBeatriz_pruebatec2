<%@page import="com.gestionturnos.turnero.logica.Turno"%>
<%@page import="com.gestionturnos.turnero.logica.Ciudadano"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<%@include file="components/head.jsp"%>
<%@include file="components/topnav.jsp"%>
<%@include file="components/sidenav.jsp"%>



<div class="container">
    <div class="row justify-content-center mt-3">
        <div class="col-lg-7 mt-5 mb-5">
            <div class="card shadow-lg border-0 rounded-lg mt-3">
                <div class="card-header"><h3 class="text-center font-weight-light my-4">Buscar Ciudadano</h3></div>
                <div class="card-body">
                    <form action="SvFiltrarCiudadano" method="GET">
                      <div class="col mb-3">
                           <div class="md-6">
                               <div class="form-floating mb-3">
                                   <input class="form-control" id="dniciudadano" type="text" placeholder="Introducir Dni Ciudadano" name="dniciudadano"/>
                                   <label for="dniciudadano">Dni Ciudadano</label>
                               </div>
                           </div>
                       <div class="mt-4 mb-4">
                           <div class="d-grid"><button class="btn btn-primary btn-block" type="submit">Buscar Ciudadano</button></div>
                           </form
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid px-4 mt-5">
    <div class="card mb-4  ">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
            Tabla Ciudadanos Filtrados
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
                    </tr>
                </tfoot>
              
                         <!-- Se hace un casteo de List<Ciudadano> y con GET ATTRIBUTE traemos el atributo que se ha seteado en el servlet -->
                <tbody>
                    <%for (Ciudadano ciudadano : (List<Ciudadano>) request.getSession().getAttribute("listadoCiudadanosFiltrados")) { %>
                    <tr>
                        <td id="id_ciudadano<%=ciudadano.getId_ciudadano()%>"><%=ciudadano.getId_ciudadano() %></td>
                        <td><%=ciudadano.getNombre() %></td>
                        <td><%=ciudadano.getApellido() %></td>
                        <td><%=ciudadano.getTelefono() %></td>
                        <td><%=ciudadano.getDireccion() %></td>
                        <td><%=ciudadano.getDni() %></td>
                        <td><%=ciudadano.fechaNacFormateada() %></td>
                        
                        <!-- Se realiza dicho bucle para que aparezcan en la tabla todos los turnos asociados a cada ciudadano  -->     
                   
                        <td><%for (Turno turno : (List<Turno>) request.getSession().getAttribute("listadoTurnosFiltrados")) { 
                                if(ciudadano.getDni().equals(turno.getCiudadano().getDni())) { %>
                                       <%=turno.fechaFormateada() %>
                                 <% } 
                              }%>
                        </td>
                    </tr>
                  >
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>




<%@include file="components/footer.jsp"%>
<%@include file="components/bodyfinal.jsp"%>
</html>
