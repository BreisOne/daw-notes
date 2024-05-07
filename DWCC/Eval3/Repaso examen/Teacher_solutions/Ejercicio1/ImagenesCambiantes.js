
var intervalo;

//las imágenes están numeradas de 1 a 12
//se cambia la imagen por su siguiente si su número actual es impar
//o a la anterior si es par
function cambiar(nombre) {
    let elemento = document.getElementById(nombre);

    let numImagen = parseInt(elemento.src.substring(elemento.src.lastIndexOf("/") + 1,
        elemento.src.lastIndexOf(".")));
    
    if(numImagen % 2 == 1) {
        elemento.src = (numImagen + 1) + ".JPG";
    }
    else {
        elemento.src = (numImagen - 1) + ".JPG";
    }
}


function inicializar() {
    intervalo = setInterval("cambiar('img1'); cambiar('img2'); cambiar('img3');", 2000);
    

    document.getElementById("img4").onmouseover=function(evento){
        cambiar(this.id);
    }

    document.getElementById("img5").onmouseover=function(evento){
        cambiar(this.id);
    }

    document.getElementById("img6").onmouseover=function(evento){
        cambiar(this.id);
    }

}

window.onload = inicializar;

window.onclose = clearInterval(intervalo);
