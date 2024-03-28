<%@page import="com.gestionturnos.turnero.logica.Turno"%>
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
                <div class="card-header"><h3 class="text-center font-weight-light my-4">Buscar Turno</h3></div>
                <div class="card-body">
                    <form action="SvFiltrarTurno" method="GET">
                      <div class="col mb-3">
                           <div class="md-6">
                               <div class="form-floating mb-3">
                                   <input class="form-control" id="fecha" type="date" placeholder="Introducir Fecha" name="fecha"/>
                                   <label for="fecha">Fecha</label>
                               </div>
                           </div>
                       <div class="form-floating mb-3">
                            <select class="form-select" aria-label="Default select example" name="estado">
                                <option selected>En espera</option>
                                <option>Ya atendido</option>
                            </select>
                       </div>
      
                     
                       <div class="mt-4 mb-4">
                           <div class="d-grid"><button class="btn btn-primary btn-block" type="submit">Buscar Turno</button></div>
                           <br>
                       <% String errorMensaje = (String) request.getAttribute("errorMensaje");
                           if(errorMensaje != null) { %>
                              <p style=" color: red"><%=errorMensaje %></p>
                        <% } %>
                        
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
            Tabla Turnos Filtrados
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
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Id</th>
                        <th>Fecha</th>
                        <th>Dni Ciudadano</th>
                        <th>Trámite</th>
                        <th>Estado</th>
                    </tr>
                </tfoot>
                              <!-- Se hace un casteo de ListTurno> y con GET ATTRIBUTE traemos el atributo que se ha seteado en el servlet -->
                <tbody>
                    <%for (Turno turno : (List<Turno>) request.getSession().getAttribute("listadoTurnosFiltrados")) { %>
                    <tr>
                        <td id="idTurno<%=turno.getIdTurno()%>"><%=turno.getIdTurno() %></td>
                        <td><%=turno.fechaFormateada() %></td>
                        <td><%=turno.getCiudadano().getDni() %></td>
                        <td><%=turno.getDescripcionTramite() %></td>
                        <td><%=turno.getEstado() %></td>
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
