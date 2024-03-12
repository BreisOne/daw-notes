'use strict';
//Clase Vehiculo
class Pelicula {
  constructor (titulo, director, duracion) {
    this.titulo = titulo;
    this.director = director;
    this.duracion = duracion;
  }
}
// Comprobar si localStorage está disponible
if (typeof Storage !== 'undefined') {
  // LocalStorage disponible
  console.log ('LocalStorage disponible');
} else {
  // LocalStorage no soportado en este navegador
  console.log ('LocalStorage no soportado en este navegador');
}

//Metodo para limpiar todos los cuadros de texto y asignar el foco a titulo
const limpiarCuadros = () => {
  const cuadrosTexto = document.querySelectorAll ('input');
  cuadrosTexto.forEach (element => {
    element.value = '';
  });

  //Posicionar el foco en el primer cuadro de texto
  cuadrosTexto[0].focus ();
};

//Método que asegura que cuando se accede a los elementos del DOM, estoy ya
//se encuentran cargados

window.addEventListener ('DOMContentLoaded', () => {
  //Formulario añadir peliculas
  const formulario = document.querySelector ('#formpeliculas');
  const mostrarBoton = document.getElementById ('mostrar');

  //A continuación vamos a dar funcionalidad a los distintos botones
  //utilizando la delegacion de eventos en el caso del evento submit, y sin
  //delegación de eventos en el caso del botón Mostrar

  formulario.addEventListener ('submit', evt => {
    evt.preventDefault ();
    const addTitulo= document.getElementById ('addTitulo');
    let titulo = document.getElementById ('addTitulo').value;
    let director = document.getElementById ('addDirector').value;
    let duracion = document.getElementById ('addDuracion').value;

    //No debe permitir que el usuario guarde una pelicula sin titulo
    if (titulo == '') addTitulo.focus ();
    else {
      //Almacenar objeto javascript
      let pelicula = new Pelicula (titulo, director, duracion);
      //Convertir a json
      const peliculaJSON = JSON.stringify (pelicula);
      //Almacenar json
      localStorage.setItem (titulo, peliculaJSON);
      limpiarCuadros ();
    }
  });

  mostrarBoton.addEventListener ('click', function () {
    //Antes de mostrar las peliculas vamos a borrar la lista

    const ul = document.querySelector ('#peliculaslist');
    const divMostrarPeliculas = document.getElementById ('divPelicula');
    //Eliminar todos los hijos de divMostrarPeliculas

    while (ul.hasChildNodes ()) ul.removeChild (ul.firstChild);

    //Recorrer el localStorage
    for (let i = 0; i < localStorage.length; i++) {
      const li = document.createElement ('li');
      console.log ('Ahora entro aqui');
      const peliculaGuardada = localStorage.getItem (localStorage.key (i));
      //Convertir el objeto JSON a JavaScript
      const peliculaJ = JSON.parse (peliculaGuardada);
      console.log ('pelicula guardada ' + peliculaJ.titulo);

      li.append (peliculaJ.titulo);
      ul.append (li);
    }
  });

  //Formulario borrar peliculas
  const formulariob = document.querySelector ('#formborrarpeliculas');

  formulariob.addEventListener ('submit', function () {
    evt.preventDefault ();
    let titulo = document.querySelector ('#removepelicula').value;
    //localStorage.clear();

    //Guardar datos
    if (titulo.length >= 1)
      //Para eliminar un elemento del localStorage haremos:
      localStorage.removeItem (titulo);
  });
});
