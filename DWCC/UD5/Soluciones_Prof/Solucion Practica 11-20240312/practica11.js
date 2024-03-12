var foto1 = null;
var foto2 = null;
var time = null;
var campoWidth;
var campoHeight;
var ganador;
var imagenes;


// window.addEventListener("DOMContentLoaded", function () { 
//     iniciar();

// })
window.addEventListener("load", function () {
    iniciar();

})

function randomColor() {
    return `rgb(${Math.random(0, 255)}, ${Math.random(0, 255)}, ${Math.random(0, 255)})`;
}

function iniciar() {
    console.log("Estoy en iniciar");
    //Cargar la imagen
    foto1 = document.getElementById("coche1");
    foto1.src = 'coche.png'

    foto2 = document.getElementById("coche2");
    foto2.src = 'coche.png'

    imagenes = document.querySelectorAll('img');

    imagenes.forEach((fotoImagen) => {

        console.log(fotoImagen);
    });

    imagenes.forEach((fotoImagen, i) => {

        fotoImagen.setAttribute("left", "10");
        fotoImagen.setAttribute("width", "50");
        if (i == 0)
            fotoImagen.setAttribute("top", "10");
        else
            fotoImagen.setAttribute("top", "450")

        console.log(`El valor de la propiedad left de la foto${i} ${fotoImagen.getAttribute('left')},\n` +
            `y el valor de la propiedad top de la foto${i} es ${fotoImagen.getAttribute('top')}.`)
    });



    campo = document.getElementById("campo");



    // Establecer variable 
    campo.style.setProperty("height", campoHeight);

    const campoBorde = `${Math.random(10, 50)}px solid ${randomColor()}`;
    campo.style.setProperty('border', campoBorde);

    campoBoton = document.getElementById("campoBoton");
    const botonBorde = `${Math.random(10, 50)}px solid ${randomColor()}`;
    campoBoton.style.setProperty('border', botonBorde)

    //Esperar a que se carguen las imagenes para que salga el prompt
    setTimeout(() => {
        ganador = parseInt(prompt('Indica el coche ganador ' + document.getElementById("coche1").name + " - " + document.getElementById("coche2").name, ''));
        const botonMover = document.getElementById("btnIniciar");
        botonMover.addEventListener("click", mover), 3000
    });


}

function mover() {

    xvelocidad1 = Math.floor(Math.random() * 50 + 10);
    xvelocidad2 = Math.floor(Math.random() * 50 + 10);

    // Obtner las clientWidth y clientHeight del campo para devolver la altura y anchura de un elemento
    var campoWidth = document.getElementById('campo').clientWidth;
    var campoHeight = document.getElementById('campo').clientHeight;
    console.log(`${campoWidth} x ${campoHeight}`);

    // Obtener el alto y ancho del campo con bordes y barras de desplazamiento

    campoWidth = document.getElementById('campo').offsetWidth;
    campoHeight = document.getElementById('campo').offsetHeight;
    console.log(`${campoWidth} x ${campoHeight}`);

    //El resultado es un objeto con estilos, respecto a todas las clases CSS.
    let computedStyle = getComputedStyle(document.getElementById("coche1"));

    // ahora podemos obtener el ancho del coche y el resto de propiedades

    let ancho = parseInt(computedStyle.width);
    campoWidth = campoWidth - ancho;

    time = setInterval(function () {
        let x1 = parseInt(foto1.getAttribute('left'));
        let x2 = parseInt(foto2.getAttribute('left'));

        foto1.setAttribute('left', x1 + xvelocidad1);
        foto2.setAttribute('left', x2 + xvelocidad2);

        foto1.style.left = foto1.getAttribute('left') + "px";
        foto2.style.left = foto2.getAttribute('left') + "px";

        console.log(console.log(`El valor del ancho ${foto1.getAttribute('width')},\n`));
        console.log(console.log(`El valor left es ${foto1.getAttribute('left')},\n`));
        console.log(console.log(`El valor la x es ${x1},\n`));
        
        if ((x1 >= (campoWidth)) || (x2 >= campoWidth)) {

            if ((x1) > (x2) && ganador == 2) {

                alert("Has perdido");
            }
            else if ((x1) < (x2) && ganador == 1) {

                alert("Has perdido");
            } else
                alert("Has ganado");
            //Finalizar la ejecución 
            clearInterval(time);
            //Poner el coche con los valores iniciales

            imagenes.forEach((fotoImagen, i) => {

                fotoImagen.setAttribute("left", "10");
                fotoImagen.style.left = fotoImagen.getAttribute('left') + "px";
            });
            //Desactivar el botón iniciar, para que se ejecute unicamente cuando recargo la página
            const botonMover = document.getElementById("btnIniciar");
            botonMover.removeEventListener('click',mover);
            
            botonMover.setAttribute('disabled',true)



        }

    }, 20);
}