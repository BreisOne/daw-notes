// Obtenemos el canvas y su contexto
var canvas = document.getElementById("myCanvas");
var ctx = canvas.getContext("2d");

// Creamos una nueva imagen
var img = new Image();
img.onload = function() {
    // Dibujamos la imagen en el canvas
    ctx.drawImage(img, 0, 0);

    // Dibujamos un círculo rojo sobre la imagen
    ctx.beginPath();
    ctx.arc(355, 80, 50, 0, 2 * Math.PI);
    ctx.fillStyle = "red";
    ctx.fill();
    ctx.closePath();
};
img.src = "./CiudadFuturista.jpg"; // Cambia "ruta_de_la_imagen.jpg" por la ruta de tu imagen

