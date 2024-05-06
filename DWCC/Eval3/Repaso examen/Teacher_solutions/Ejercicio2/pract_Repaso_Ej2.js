'use strict';

//Creamos un array de objetos de tipo Cliente.
const cliente_Array = [
  {
    dni: '11111111A',
    nombre: 'Sara',
    direccion: 'Vigo',
  },
  {
    dni: '22222222B',
    nombre: 'Juan',
    direccion: 'Pontevedra',
  },
  {
    dni: '33333333C',
    nombre: 'Amalia',
    direccion: 'Coruña',
  },
  {
    dni: '44444444D',
    nombre: 'Andrés',
    direccion: 'Lugo',
  },
];

// Comprobar si localStorage está disponible
if (typeof Storage !== 'undefined') {
  // LocalStorage disponible
  console.log ('LocalStorage disponible');
} else {
  // LocalStorage no soportado en este navegador
  console.log ('LocalStorage no soportado en este navegador');
}

//Crear la clase Cliente con los métodos
class Clientes {
  //Crear el constructor
  constructor (dni, nombre, direccion) {
    this.dni = dni;
    this.nombre = nombre;
    this.direccion = direccion;
  }

  mostrarCliente () {
    return `El cliente ${this.nombre} con DNI: ${this.dni}, vive en  ${this.direccion}`;
  }
}
//Declaración de variables globales
var div_clientes;
var div_mostrarClientes;

//Declarar la función almacenamientoLocal. La sintaxis utilizada es la de la función flecha
let almacenamientoLocal = () => {
  //Borrar el localStorage para asegurarnos que no hay otros objetos
  localStorage.clear ();
  //Recorrer el objeto clientes y almacenar en localStorage
  
  cliente_Array.forEach (element => {
    localStorage.setItem (element.dni, JSON.stringify (element));

    //Además lo muestra por consola para comprobar su funcionamiento
    console.log (element.dni);
    //Crear un objeto clienteObj utilizando el constructor de la clase Clientes
    let clienteObj=new Clientes(element.dni,element.nombre,element.direccion);

    //Muestra los datos del cliente utilizando el método implementado en la clase Clientes.
    //En este caso no creamos nodos de la estructura DOM, si no que utilizamos la propiedad innerHTML

    div_clientes.innerHTML=div_clientes.innerHTML+"<br>"+clienteObj.mostrarCliente();

  });
};

//Declarar la funcion eliminar fila con delegación de eventos

let eliminarFila=(event)=>{
    //Comprobar donde fue el click
    console.log(event.target.innerHTML);
    //Eliminar toda la fila, para lo que tenemos que acceder al nodo padre 
    console.log(event.target.parentNode);
    //Con esta instruccion comprobamos como acceder al elemento tr que es la fila
    //Ahora vamos a eliminar dicha fila, para lo cual hay que acceder al nodo padre
    //del nodo a eliminar

    const nodoAeliminar=event.target.parentNode;
    const nodoPadre=nodoAeliminar.parentNode;
    nodoPadre.removeChild(nodoAeliminar);

}

window.onload = function () {
  //Función que asegura que la estructura DOM está cargada
  div_clientes = document.querySelector ('#clientes');
  div_mostrarClientes = document.querySelector ('#mostrar_clientes');
  console.log (div_clientes);
  console.log (div_mostrarClientes);

  //Llamar a la función cargar que recorre la lista de clientes y los
  //almacena en el LocalStorage.
  almacenamientoLocal ();
  //Poner el botón a la escucha y mostrar datos
  document
    .getElementById ('mostrar')
    .addEventListener ('click', mostrarClientes);

    //Poner el div mostrarClientes a la escucha para borrar la fila de la tabla con 
    //delegación de eventos
    div_mostrarClientes.addEventListener("click", eliminarFila);
};

//Funcionalidad al botón mostrar, que lee el contenido del localStorage y lo muestra por pantalla
function mostrarClientes () {
  //Limpiar el div de contenido
  div_mostrarClientes.innerHTML = '';

  //Crear la estructura de la tabla con los métodos del DOM
  const tabla = document.createElement ('table');
  const fila_encabezado = document.createElement ('thead');
  const cuerpo_tabla = document.createElement ('tbody');
  const celda_encabezado1 = document.createElement ('th');
  const texto_encabezado1 = document.createTextNode ('DNI');
  const celda_encabezado2 = document.createElement ('th');
  const texto_encabezado2 = document.createTextNode ('NOMBRE');
  const celda_encabezado3 = document.createElement ('th');
  const texto_encabezado3 = document.createTextNode ('DIRECCION');

  //Recorrer el localStorage
  for (let i = 0; i < localStorage.length; i++) {
    let dni_key = localStorage.key (i);
    //Obtiene el elemento cliente del localStorage identificado por su clave
    let cliente = localStorage.getItem (dni_key);

    //Convertir el objeto JSON a JavaScript

    const clienteJS = JSON.parse (cliente);

    //Crea la estructura de la tabla

    const fila = document.createElement ('tr');
    //Crear la primera celda con contenido
    const celda1 = document.createElement ('td');
    const textoCelda1 = document.createTextNode (`${clienteJS.dni}`);
    celda1.appendChild (textoCelda1);
    //Añadir la celda a la fila
    fila.appendChild (celda1);

    //Crear la segunda celda con contenido
    const celda2 = document.createElement ('td');
    const textoCelda2 = document.createTextNode (`${clienteJS.nombre}`);
    celda2.appendChild (textoCelda2);
    //Añadir la celda a la fila
    fila.appendChild (celda2);

    //Crear la segunda celda con contenido
    const celda3 = document.createElement ('td');
    const textoCelda3 = document.createTextNode (`${clienteJS.direccion}`);
    celda3.appendChild (textoCelda3);
    //Añadir la celda a la fila
    fila.appendChild (celda3);
    //Añadir la fila a la tabla
    cuerpo_tabla.append (fila);
  }

  //Crear la fila del encabezado
  celda_encabezado1.appendChild (texto_encabezado1);
  fila_encabezado.appendChild (celda_encabezado1);
  celda_encabezado2.appendChild (texto_encabezado2);
  fila_encabezado.appendChild (celda_encabezado2);
  celda_encabezado3.appendChild (texto_encabezado3);
  fila_encabezado.appendChild (celda_encabezado3);

  tabla.append (fila_encabezado);
  tabla.append (cuerpo_tabla);
  div_mostrarClientes.append (tabla);
}
