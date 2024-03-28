# Turnero

Turnero es el desarrollo Java Web de una Aplicación de Gestión de Turnos, en la cual se ha utilizado JPA y JSP.

## Objetivos del proyecto

El usuario puede:

✅ Insertar ciudadanos: el nombre, apellidos, teléfono, dirección, dni y fecha de nacimiento

✅ Ver el listado de ciudadanos que hay dados de alta en la base de datos junto con los turnos asociados

✅ Actualizar los datos de los ciudadanos

✅ Eliminar ciudadanos

✅ Buscar ciudadanos por su DNI

✅ Insertar turnos: la fecha, trámite, ciudadano y estado

✅ Ver el listado de turnos que hay dados de alta en la base de datos junto con el dni del ciudadano asignado al mismo.

✅ Actualizar los datos de los turnos

✅ Eliminar turnos

✅ Buscar turnos por fecha y estado

El objetivo es que se realice un CRUD (Crear, Leer, Actualizar, Borrar) conectado directamente con la base de datos

## Explicación Código

Se ha utilizado como servidor web Apache Tomcat y el proyecto se ha creado con Maven.

En el proyecto podemos encontrar:

1. Capa interfaz gráfica de usuario - utilizando JSP y Bootstrap para las plantillas
2. Servlets
3. Capa lógica de negocios
4. Capa de persistencia

En las cuáles se encuentran:

- Alta Ciudadano y Alta Turno --> archivos jsp en los que se encuentra el código para formulario
- Ver Ciudadanos y Ver Turnos --> archivos jsp en los que encontramos el código para mostrar los datos en una tabla
- index --> archivo jsp en el que encontramos la home
- Editar Ciudadano y Editar Turno --> archivos jsp en los que se encuentra el formulario para editar los datos
- Turnos Filtrados y Ciudadanos Filtrados --> archivos jsp en los que encontramos el formulario con los datos que queremos que rellene el usuario para poder filtar y el código para que los datos devueltos se muestren en una tabla
  Todos estos archivos se encuentran dentro de la capa gráfica (Web Pages)

- Servlet Ciudadano
- Servlet Turno
  en los cuales el método doPost --> se utiliza para crear los elementos; y el método doGet --> para traer los elementos creados
  (en el caso de ciudadado se traen también los turnos asociados a éste; y en el turno se puede ver el DNI del ciudadano asociado)

- Servlet Editar Ciudadano
- Servlet Editar Turno
  en los cuales el método doGet --> se utiliza para traer el elemento que se va a querer modificar; y el método doPost --> para editar dicho elemento

- Servlet Eliminar Ciudadano
- Servlet Eliminar Turno
  en los cuales se utiliza sólo el método doPost --> para eliminar el elemento

- Servlet Filtrado Ciudadanos
- Servlet Filtrado Turnos
  en los cuales se utiliza sólo el método doGet --> para traer el listado de los elementos indicados en el filtro
  (en ciudadanos podremos ver los datos de éstos y los turnos asociados y en el caso de los turnos veremos el turno y el dni del ciudadanos al que está asociado)

- Clase Ciudadano
- Clase Turno
  ambas con: - las annotations, atributos (en private), constructores, getters, setters, y métodos necesarios
  Entre ambas clases tenemos una relación Uno a Muchos - ya que un turno sólo puede tener asociado un ciudadano pero un ciudadano puede tener muchos turnos
- Controladora
  están dentro de la lógica de negocio

- Clase ciudadanoJpaController
- Clase turnoJpaController
- Controladora de Persistencia
  con todos los métodos crear, editar, filtrar... --> se encuentran dentro de la persistencia

Para cada opción del menú se han creado métodos, cada uno con su lógica correspondiente:

🔹 crearTurno y crearCiudadano -- a través de éste método vamos a insertar los turnos o ciudadanos - se ingresan los datos a través de un formulario - se guardan en el arrayList - y se insertan en la base de datos
Creada una regex para el DNI (se tiene que introducir 8 números y una letra) sino se cumple salta un error al intentar enviar el formulario
Todos los campos del formulario son obligatorios, por lo que si el usuario hace click en el botón sin rellenar alguno de los campos sale un error indicándoselo y en este caso no se creará dicho elemento en la base de datos.

🔹 traerTurnos y traerCiudadanos -- retorna el listado con todos los turnos o ciudadanos activos - mostrando al usuario los datos en una tabla

🔹 En el caso de que lo que se quiera sea actualizar algún dato lo que hace la aplicación es:

- Buscar al empleado que queramos modificar y trae el objeto - de esto se encarga el método traerUnTurno y traerCiudadano
- Con los métodos editarTurno y editarCiudadano lo que estamos haciendo es guardar el objeto en una nueva instancia, hacer las modificaciones y volver a mandar el objeto de vuelta a la base de datos

🔹eliminarTurno y eliminarCiudadano -- a través del id se elimina el elemento indicado

🔹métodos para filtrar:

- traerCiudadanosFiltrados
- traerTurnosFiltrados
- traerTurnosPorFechaYEstado
  en estos casos se ha utilizado stream - filter - collect para traer a los ciudadanos o turnos en función de la condición indicada

En el código se han utilizado:

✔️ Estructuras condicionales:

▫️ If

```java

               <td><%for (Turno turno : (List<Turno>) request.getSession().getAttribute("listadoTurnos")) {
                        if(ciudadano.getDni().equals(turno.getCiudadano().getDni())) { %>
                                <%=turno.fechaFormateada() %>
                        <% }
                      }%>
               </td>
```

✔️ Estructuras repetitivas

▫️ For - para recorrer Arrays y poder mostrar en la aplicación el listado de elementos

```java
              <%for (Turno turno : (List<Turno>) request.getSession().getAttribute("listadoTurnos")) { %>
                    <tr>
                        <td id="idTurno<%=turno.getIdTurno()%>"><%=turno.getIdTurno() %></td>
                        <td><%=turno.fechaFormateada() %></td>
                        <td><%=turno.getCiudadano().getDni() %></td>
                        <td><%=turno.getDescripcionTramite() %></td>
                        <td><%=turno.getEstado() %></td>
                    </tr>
                    <% } %>
```

✔️ Streams

```java
            List<Turno> listaTurnosFiltrados = controlPersis.traerTurnos();

            List<Turno> filtroTurno =  listaTurnosFiltrados.stream()
               .filter(p -> p.getCiudadano().getDni().equalsIgnoreCase(dni) )
               .collect(Collectors.toList());
```

✔️ Pattern y Matcher

```java

              private String regex = "\\b\\d{8}[A-Z-a-z]\\b";

              public boolean comprobarDni(String dni) {
                 Pattern pattern = Pattern.compile(regex); //Compilando la regex
                 Matcher matcher = pattern.matcher(dni); //Buscando coincidencias
                 return matcher.matches();
              }

```

✔️ Collections

▫️ List - ArrayList

```java
                List<Turno> listaTurnos = new ArrayList<Turno>();
                List<Ciudadano> listaCiudadanos = new ArrayList<Ciudadano>();
```

### Supuestos

Si un ciudadano tiene uno o varios turnos asociados, para poder eliminarle primero hay que eliminar el/los turnos y después ya podremos eliminarle.

## Tecnologías utilizadas

![java](https://github.com/beaperezm/PerezMedelBeatriz_pruebatec1/assets/113792109/6288edf5-8e0f-4beb-9941-b41d3ca33e79)

![Netbeans](https://github.com/beaperezm/PerezMedelBeatriz_pruebatec1/assets/113792109/eeb75421-0e86-43f5-8db5-404b9710006b)
