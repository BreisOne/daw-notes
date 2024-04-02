//Función que inicializa todos los valores
iniciar = () => {
    const botonCrear = document.getElementById("crear");
    //Crear un elemento de tipo button
    const botonBorrar = document.createElement("button");
    //Añadir el botón
    botonCrear.addEventListener("click", crearTabla);
    //Desactivar el botón Borrar
    botonBorrar.disabled = true; 
    botonBorrar.innerHTML="Borrar Tabla";
    botonBorrar.setAttribute("id", "borrar");
    //Añadir el botón Borrar como hermano del botón Crear
    botonCrear.parentNode.appendChild(botonBorrar);
    
    botonBorrar.addEventListener("click", borrarTabla);

}

borrarTabla = () => {
   
    let resultado = document.getElementById("resultado");
    resultado.removeChild;
    //Asignar el foco al cuadro de texto
    let fila=document.getElementById("fila");
    fila.focus();

}
borraFila = (evt) => {
    let fila = evt.target.parentNode;
    fila.parentNode.removeChild(fila);
}

fondoCelda = (evt) => {  
    let celda = evt.target;
    evt.target.style.background = "blue";
}

crearTabla = () => {
    const filas = document.getElementById("fila");
    const columnas = document.getElementById("columna");
    const resultado = document.getElementById("resultado");

    //Obtener los valores de los cuadros de texto
    let f = filas.value;
    let c = columnas.value;
   
    //Crear la tabla

    let tabla = document.createElement("table");
    //Asignar estilos a la tabla
    tabla.style.border = "2px solid blue";
    //Cambiar el tamaño de la letra en la tabla
    tabla.style.fontSize="22px";
    resultado.appendChild(tabla);

    for (let i = 0; i < f; i++) {
        let fila = document.createElement("tr");
       

        tabla.appendChild(fila);
        for (let j = 0; j < c; j++) {
            let contenido = document.createTextNode(i);
            let celda = document.createElement("td");
            celda.style.border="2px solid blue";
            celda.appendChild(contenido);
            fila.appendChild(celda);
        }
    }

    //Desactivar el botón Crear y activar el botón Borrar
    const botonCrear = document.getElementById("crear");
    botonCrear.disabled=true;
    const botonBorrar = document.getElementById("borrar");
    botonBorrar.disabled=false;

    //Asignar la funcionalidad con la delegación de eventos
    if (tabla) {
        tabla.addEventListener("click", fondoCelda);
        tabla.addEventListener("dblclick", borraFila);

        //Implementar la funcionalidad del menú derecho del ratón
        tabla.addEventListener("contextmenu", (evt) => {
            evt.preventDefault();
            console.log(evt.target.parentNode);
            evt.target.parentNode.style.color = "red";
        }
        );
    }
}

document.addEventListener("DOMContentLoaded", iniciar);


