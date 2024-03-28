<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <a class="nav-link" href="index.jsp">
                        <div class="sb-nav-link-icon"><i class="fas fa-solid fa-caret-down"></i></div>
                        Menú de opciones
                    </a>
                    <!-- comment   <div class="sb-sidenav-menu-heading">Interface</div>  --> 
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseCiudadano" aria-expanded="false" aria-controls="collapseCiudadano">
                        <div class="sb-nav-link-icon"><i class="fas fa-solid fa-people-group"></i></div>
                        Ciudadanos
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                            
                    <div class="collapse" id="collapseCiudadano" aria-labelledby="headingCiudadano" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="altaCiudadano.jsp">Crear Ciudadano</a>
                            <a class="nav-link" href="SvCiudadano">Ver Ciudadanos</a>
                            <a class="nav-link" href="SvFiltrarCiudadano">Buscar Ciudadano</a>
                        </nav>
                    </div>
                            
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseTurno" aria-expanded="false" aria-controls="collapseTurno">
                        <div class="sb-nav-link-icon"><i class="fas fa-solid fa-calendar"></i></div>
                        Turnos
                         <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseTurno" aria-labelledby="headingTurno" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                            <a class="nav-link collapsed" href="altaTurno.jsp">Crear turno</a>
                            <a class="nav-link collapsed" href="SvTurno">Ver turnos</a>
                            <a class="nav-link collapsed" href="SvFiltrarTurno">Buscar turno</a>
                        </nav>
                    </div>
        </nav>
    </div>
                
   <div id="layoutSidenav_content">


