let contador = 0;
let valorEscondido = "";

//Crear la clase Articulo

class Articulo {
    constructor(descripcion, precio) {
        this.descripcion = descripcion;
        this.precio = precio;

    }

    //Metodos asociados a la clase articulo. De momento no implementamos ninguno
}


//Funciones que van a crear los botones asociados a cada articulo añadido

function creaBotonEliminar() {
    //Se crea el botón eliminar
    const botonEliminar = document.createElement("input");
    botonEliminar.type = "button";
    botonEliminar.value = "x";
    botonEliminar.name = "elimina" + contador;
    botonEliminar.form = "formElimina";
    //Se añade el manejador
    botonEliminar.addEventListener("click", elimina);
    return botonEliminar;
}


function creaBotonBajar() {
    //Se crea el botón bajar
    const botonBajar = document.createElement("input");
    botonBajar.type = "button";
    botonBajar.value = "Bajar";
    botonBajar.name = "baja" + contador;
    botonBajar.form = "formBaja";
    //Se añade el manejador
    botonBajar.addEventListener("click", baja);
    return botonBajar;
}

function creaBotonSubir() {
    //Se crea el botón subir
    var botonSubir = document.createElement("input");
    botonSubir.type = "button";
    botonSubir.value = "Subir";
    botonSubir.name = "sube" + contador;
    botonSubir.form = "formSube";
    //Se añade el manejador
    botonSubir.addEventListener("click", sube);
    return botonSubir;
}

//Metodo que gestiona la lista de articulos comprados
function anhade() {

    //Se obtiene la descripcion y el precio
    let descripcion = valorEscondido;
    let precio = document.getElementById("precio").value;
    
    valorEscondido = "";
    if (descripcion != "") { //Solo crea el elemento en la lista si el campo no está vacío
        //Se crea el elemento li
        const nuevoItem = document.createElement("li");
        nuevoItem.id = "articulo" + contador;
        //Se crea el contenido textual del elemento li
        const contenido = document.createTextNode(descripcion);
        //Se añaden los hijos al elemento li
        const botonEliminar = creaBotonEliminar(); //Creación del botón eliminar
        const botonSubir = creaBotonSubir(); //Creación del botón subir
        const botonBajar = creaBotonBajar(); //Creación del botón bajar
        nuevoItem.appendChild(contenido);
        nuevoItem.appendChild(botonEliminar);
        nuevoItem.appendChild(botonSubir);
        nuevoItem.appendChild(botonBajar);
        const lista = document.getElementById("listaC");

        //Esto añade el producto al final
        //lista.appendChild(nuevoItem);

        //Esto añade el producto al principio
        lista.insertBefore(nuevoItem, lista.childNodes[0]);
        contador++;

        //Crea el objeto y lo almacena en el localStorage, no comprueba su existencia
        //por lo que si se repite el articulo se modifica el precio

        const articulo = new Articulo(descripcion, precio);
        //Convertir a json
        const articuloJSON = JSON.stringify(articulo);
        //Almacenar json
        localStorage.setItem(descripcion, articuloJSON);

    }
    //Eliminamos el texto del campo de texto

    document.getElementById("entrada").value = "";
    document.getElementById("precio").value = "";
    document.getElementById("entrada").focus();

}

function elimina() {
    const nodoLi = this.parentNode; //Toma el <li> donde se encuentra el botón
    const textoNuevoE = nodoLi.firstChild.textContent;
    
    nodoLi.parentNode.removeChild(nodoLi);

    //Crear un nuevo elemento en la lista eliminados

    const nuevoItem = document.createElement("li");
    //Se crea el contenido textual del elemento li
    const contenido = document.createTextNode(textoNuevoE);

    nuevoItem.appendChild(contenido);

    const lista = document.getElementById("listaE");

    //Esto añade el producto al final
    lista.appendChild(nuevoItem);
    console.log(nuevoItem);

    //Borrar el articulo elimado del localStorage, para lo cual accedemos a través
    //de la clave, que en este caso es la descripcion
    localStorage.removeItem(textoNuevoE);

    //Comprobamos a través de la consola que se ha eliminado
    //Recorrer el localStorage
    for (x=0; x<localStorage.length; x++)  { 
        
      const articuloGuardado = localStorage.getItem (localStorage.key (x));
      //Convertir el objeto JSON a JavaScript
      const articuloJ = JSON.parse (articuloGuardado);
      console.log ('articulo guardada de todo el año ' + articuloJ.descripcion);
    };

}
    
function baja() {
    const articuloActual = this.parentNode; //Toma el <li> donde se encuentra el botón
    const articuloSiguiente = articuloActual.nextSibling;
    const lista = articuloActual.parentNode;
    lista.insertBefore(articuloActual, articuloSiguiente.nextSibling); //Con esto ya saca el nodoActual de donde está y lo mueve hacia abajo  
}

function sube() {
    const articuloActual = this.parentNode; //Toma el <li> donde se encuentra el botón
    const articuloAnterior = articuloActual.previousSibling;
    const lista = articuloActual.parentNode;
    lista.insertBefore(articuloActual, articuloAnterior); //Con esto ya saca el nodoActual de donde está y lo mueve hacia arriba  
}



function borrarTodos() {
    console.log("Voy a borrar");
    const listaC = document.getElementById("listaC");
    const articulosC = listaC.childNodes;
    while (articulosC.length != 0) {
        listaC.removeChild(listaC.firstChild);
    }

    const listaE = document.getElementById("listaE");
    const articulosE = listaE.childNodes;
    while (articulosE.length != 0) {
        listaE.removeChild(listaE.firstChild);
    }

    //Elimina el localStorage
    if (localStorage!=null)
        localStorage.clear();
}

function eliminaListaE(evt) {
    const nodoAEliminar = evt.target;
    nodoAEliminar.parentNode.removeChild(nodoAEliminar);
}

function modificarFondo(evt) {
    evt.preventDefault();
    const nodoLista = evt.target;
    nodoLista.style.color = "white";
    nodoLista.style.background = "blue"
}
//Método que convierte los datos introducidos por el teclado en asteriscos
function introducirDatos(e) {

    if (!(e.ctrlKey || e.altKey)) {
        if (e.preventDefault) { // W3C variant 
            e.preventDefault();
        } else { // IE<=8
            e.returnValue = false;
        }
    }
    let tecla = e.keyCode || e.which;
    console.log("tecla:" + tecla);
    if (((tecla >= 48) && (tecla <= 57)) || ((tecla >= 65) && (tecla <= 90)) || ((tecla >= 97) && (tecla <= 122))) {
        let objetivo = e.target || e.srcElement;
        objetivo.value += "*";
        valorEscondido += String.fromCharCode(tecla); //Almaceno en el array el valor introducido
    }

}

window.onload = function () {
    const botonAnhade = document.getElementById("botonAnadir");
    const botonBorrar = document.getElementById("botonBorrar");
    const cuadroTexto = document.getElementById("entrada");
    const listaE = document.getElementById("listaE");

    //Asignacion de funcionalidad con delegacion de eventos a la lista de eliminados
    //De tal forma que al hacer click sobre cada elemento de la lista lo elimina y 
    //con el botón derecho modifica el fondo


    listaE.addEventListener("click", eliminaListaE);
    listaE.addEventListener("contextmenu", modificarFondo);

    botonAnhade.addEventListener("click", anhade); //Asigno el manejador de eventos
    botonBorrar.addEventListener("click", borrarTodos); //Asigno el manejador de eventos
    cuadroTexto.addEventListener("keypress", introducirDatos); //Asigno el manejador de eventos

}

