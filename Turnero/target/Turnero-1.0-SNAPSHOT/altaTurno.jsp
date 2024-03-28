<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@include file="components/head.jsp"%>
<%@include file="components/topnav.jsp"%>
<%@include file="components/sidenav.jsp"%>


<div class="container">
    <div class="row justify-content-center mt-3">
        <div class="col-lg-7 mt-5 mb-5">
            <div class="card shadow-lg border-0 rounded-lg mt-3">
                <div class="card-header"><h3 class="text-center font-weight-light my-4">Dar de Alta Turno</h3></div>
                <div class="card-body">
                    <form action="SvTurno" method="POST">
                      <div class="col mb-3">
                           <div class="md-6">
                               <div class="form-floating mb-3">
                                   <input class="form-control" id="fecha" type="date" placeholder="Introducir Fecha" name="fecha" />
                                   <label for="fecha">Fecha</label>
                               </div>
                           </div>
                            <div class="md-6">
                               <div class="form-floating mb-3">
                                  <input class="form-control" id="ciudadano" type="text" placeholder="Introducir Ciudadano" name="ciudadano"/>
                                  <label for="ciudadano">Id Ciudadano</label>
                               </div>
                           </div>
                          
                           <div class="md-6">
                               <div class="form-floating">
                                  <input class="form-control" id="tramite" type="text" placeholder="Introducir Tramite" name="tramite"/>
                                  <label for="tramite">Trámite</label>
                               </div>
                           </div>
                       </div>
                        
                       <div class="md-6">
                             <div class="form-floating mb-3">
                                 <select class="form-select" aria-label="Default select example" name="estado">
                                    <option selected>En espera</option>
                                    <option>Ya atendido</option>
                                 </select>
                             </div>
                       </div>
                        
                      <div class="mt-4 mb-4">
                           <div class="d-grid"><button class="btn btn-primary btn-block" type="submit">Crear Turno</button></div>
                      </div>
                        
                       <% String errorMensaje = (String) request.getAttribute("errorMensaje");
                           if(errorMensaje != null) { %>
                              <p style=" color: red"><%=errorMensaje %></p>
                        <% } %>
   
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file="components/footer.jsp"%>
<%@include file="components/bodyfinal.jsp"%>
</html>
