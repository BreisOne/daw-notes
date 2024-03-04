//Declaracion de la ventana
let ventana = null;
//Asignar el foco al primer cuadro de texto del formulario
window.document.getElementById ('ancho').focus ();
//Recorrer todos los cuadros de texto para modificar la propiedad
let cuadrosTexto = document.querySelectorAll ('input');
//Mostrar por consola los cuadros de texto
console.log (cuadrosTexto);
let botones = document.querySelectorAll ('button');
//Mostrar por consola los botones
console.log (botones);

//Deshabilita los botones
for (let i = 1; i < botones.length; i++)
  botones[i].disabled = true;


function CrearVentana () {
  var opciones = '';
  /*Inicializar las características con los valores del formulario
   en esta solucion estamos accediendo a la posición del array cuadrosTexto.
   Mejorar dicha solución utilizando los métodos de la estructura DOM, 
   como indico a continuación, pero que queda pendiente para la siguiente unidad
   height=' + document.getElementById ('ancho').value*/

  opciones = opciones + 'width=' + cuadrosTexto[0].value + ',';
  opciones = opciones + 'height=' + cuadrosTexto[1].value + ',';
  opciones = opciones + 'left=' + cuadrosTexto[2].value + ',';
  opciones = opciones + 'top=' + cuadrosTexto[3].value;

  ventana = window.open ('', 'ventana', opciones);
  ventana.name = 'nueva';

  //Como el objeto document de la ventana se  corresponde con la página, podemos crear una
  //pagina web a través del método write.

  ventana.document.write (
    '<head><meta http-equiv="content-type" content="text/html; charset=iso-8859-1"><title>Titulo nueva ventana</title>  </head>'
  );

  ventana.document.write ('<p> Esta es mi nueva ventana </p>');

  //Mostrar los valores por la consola para comprobar que son correctos
  console ('width' + cuadrosTexto[0].value);
  console.log ('height' + cuadrosTexto[1].value);
  console.log ('cordx' + cuadrosTexto[2].value);
  console.log ('cordy' + cuadrosTexto[3].value);
 

  
}

function CerrarVentana () {
  parent.ventana.close ();
  window.close ();
}



