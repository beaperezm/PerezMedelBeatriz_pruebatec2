<%@page import="com.gestionturnos.turnero.logica.Turno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<%@include file="components/head.jsp"%>
<%@include file="components/topnav.jsp"%>
<%@include file="components/sidenav.jsp"%>


<div class="container">
    <div class="row justify-content-center mt-3">
        <div class="col-lg-7 mt-5 mb-5">
            <div class="card shadow-lg border-0 rounded-lg mt-3">
                <div class="card-header"><h3 class="text-center font-weight-light my-4">Editar Turno</h3></div>
                <div class="card-body">
                    <% Turno turno = (Turno) request.getSession().getAttribute("editarTurn"); %>
                    <form action="SvEditarTurno" method="POST">
                      <div class="col mb-3">
                           <div class="md-6">
                               <div class="form-floating mb-3">
                                   <input class="form-control" id="fecha" type="date" placeholder="Introducir Fecha" name="fecha" value="<%=turno.getFecha() %>" />
                                   <label for="fecha">Fecha</label>
                               </div>
                           </div>
                         <div class="md-6">
                                <div class="form-floating">
                                  <input class="form-control" id="idciudadano" type="text" placeholder="Introducir Ciudadano" name="idciudadano" value="<%=turno.getCiudadano().getId_ciudadano() %>"/>
                                  <label for="idciudadano">Id Ciudadano</label>
                               </div>
                           </div>
                       </div>
                        <div class="form-floating mb-3">
                           <input class="form-control" id="tramite" type="tramite" placeholder="Introducir Tramite" name="tramite" value="<%=turno.getDescripcionTramite() %>" />
                           <label for="tramite">Trámite</label>
                       </div>
                        <div class="col mb-3">
                            <div class="md-6">
                               <div class="form-floating mb-3">
                                   
                                   <!-- En el primer option se coge la info que aparece en la BBDD antes de que se pueda modificar -->
                                   <!-- En el segundo option si el estado de la BBDD es "En espera" aparecerá Ya atendido y sino aparecerá En espera -->
                                 <select class="form-select" aria-label="Default select example" name="estado">
                                    <option><%=turno.getEstado() %></option>
                                    <option><% if(turno.getEstado().equalsIgnoreCase("En espera")) { %>
                                            Ya atendido
                                       <% } else { %>
                                       En espera
                                       <% } %>
                                 </option>
                                 </select>
                               </div>
                           </div>
                          
                                
                       <div class="mt-4 mb-4">
                           <div class="d-grid"><button class="btn btn-primary btn-block" type="submit">Editar Turno</button></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



<%@include file="components/footer.jsp"%>
<%@include file="components/bodyfinal.jsp"%>
</html>
