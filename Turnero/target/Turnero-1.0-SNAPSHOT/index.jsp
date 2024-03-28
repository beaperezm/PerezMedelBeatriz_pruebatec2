<%@page import="java.util.List"%>
<%@page import="com.gestionturnos.turnero.logica.Ciudadano"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@include file="components/head.jsp"%>
<%@include file="components/topnav.jsp"%>
<%@include file="components/sidenav.jsp"%>


       <main >
           <div class="container-fluid px-4">
               <h1 class="mt-4 mb-4 titleHome" style="text-align: center; font-size: 80px; font-weight: 900; text-shadow: 1px 1px 1px #6d7092, 2px 2px 1px #656888,3px 3px 1px #606381,4px 4px 1px #585b83,
                   5px 5px 1px #585b83, 6px 6px 1px #606388, 7px 7px 1px #535682; color: whitesmoke; padding: 10px 10px;">Turnero</h1>
               <div class="row d-flex flex-row justify-content-center p-4">
                   <div class="col-xl-3 col-md-6 mt-4">
                       <div class="card bg-primary text-white mb-4">
                           <i class="fas fa-solid fa-people-group" style="font-size: 8em; padding-top: 25px;"></i>
                           <div class="card-body" style="font-size: 2em; text-align: center;">Ciudadanos</div>
                           <div class="card-footer d-flex align-items-center justify-content-between">
                              <a class="small text-white stretched-link" href="altaCiudadano.jsp" style="font-size: 1.03em">Dar de alta</a>
                               <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                           </div>
                       </div>
                   </div>
                   <div class="col-xl-3 col-md-6 mt-4">
                       <div class="card bg-danger text-white mb-4">
                           <i class="fas fa-solid fa-calendar" style="font-size: 8em; padding-top: 25px"></i>
                           <div class="card-body" style="font-size: 2em; text-align: center">Turnos</div>
                           <div class="card-footer d-flex align-items-center justify-content-between">
                               <a class="small text-white stretched-link" href="altaTurno.jsp" style="font-size: 1.03em">Dar de alta</a>
                               <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                           </div>
                       </div>
                   </div>
               </div>
       </main>

<%@include file="components/footer.jsp"%>
<%@include file="components/bodyfinal.jsp"%>
</html>
