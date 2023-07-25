/* Este código selecciona el elemento del documento con el id "header" y le asigna un bloque de código HTML para construir una barra de navegación. El código HTML contiene una estructura de navegación típica de una barra de navegación de Bootstrap, con enlaces a diferentes páginas y un formulario de búsqueda.
El código se encarga de asignar el contenido HTML al elemento con el id "header", lo que resulta en la visualización de la barra de navegación en ese lugar dentro del documento HTML.
*/
document.getElementById(
    "header"
  ).innerHTML = ` <nav nav class="navbar navbar-light " style="background-color: #e3f2fd;">
  <div class="container">
    <a class="navbar-brand" href="index.html"> <img width=10% src="logofinalh.png" alt="logo" class="d-inline-block align-text-center px-2">Productos y Merchandising</a>       
    <div class="CRUD">
        <a class="btn btn-danger animate__animated animate__heartBeat btn-animate" href="producto-create.html" color="red">Nuevo</a>
    </div>  
  </div>  
  </nav>
  `;