<%@page import="com.gestionturnos.turnero.logica.Ciudadano"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<%@include file="components/head.jsp"%>
<%@include file="components/topnav.jsp"%>
<%@include file="components/sidenav.jsp"%>


<div class="container">
    <div class="row justify-content-center mt-3">
        <div class="col-lg-7 mt-5 mb-5">
            <div class="card shadow-lg border-0 rounded-lg mt-3">
                <div class="card-header"><h3 class="text-center font-weight-light my-4">Editar Ciudadano</h3></div>
                <div class="card-body">
                    <% Ciudadano ciudadano = (Ciudadano) request.getSession().getAttribute("editarCiudad"); %>
                    <form action="SvEditarCiudadano" method="POST">
                      <div class="col mb-3">
                           <div class="md-6">
                               <div class="form-floating mb-3">
                                   <input class="form-control" id="nombre" type="text" placeholder="Introducir nombre" name="nombre" value="<%=ciudadano.getNombre() %>" />
                                   <label for="nombre">Nombre</label>
                               </div>
                           </div>
                         <div class="md-6">
                                <div class="form-floating">
                                  <input class="form-control" id="apellido" type="text" placeholder="Introducir apellido" name="apellido" value="<%=ciudadano.getApellido() %>"/>
                                  <label for="apellido">Apellido</label>
                               </div>
                           </div>
                       </div>
                        <div class="form-floating mb-3">
                           <input class="form-control" id="telefono" type="text" placeholder="Introducir Teléfono" name="telefono" value="<%=ciudadano.getTelefono() %>" />
                           <label for="telefono">Teléfono</label>
                       </div>
                        <div class="col mb-3">
                            <div class="md-6">
                               <div class="form-floating mb-3">
                                   <input class="form-control" id="direccion" type="text" placeholder="Introducir Dirección" name="direccion" value="<%=ciudadano.getDireccion() %>" />
                                   <label for="direccion">Dirección</label>
                               </div>
                           </div>
                           <div class="md-6">
                               <div class="form-floating mb-3">
                                   <input class="form-control" id="dni" type="text" placeholder="Introducir DNI" name="dni" value="<%=ciudadano.getDni() %>" />
                                   <label for="dni">DNI</label>
                               </div>
                           </div>
                           <div class="md-6">
                               <div class="form-floating mb-3">
                                   <input class="form-control" id="fechanacimiento" type="date" placeholder="Introducir Fecha de Nacimiento" name="fechanacimiento" value="<%=ciudadano.getFechaNac() %>" />
                                   <label for="fechanacimiento">Fecha de Nacimiento</label>
                               </div>

                                
                       <div class="mt-4 mb-4">
                           <div class="d-grid"><button class="btn btn-primary btn-block" type="submit">Editar Ciudadano</button></div>
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
