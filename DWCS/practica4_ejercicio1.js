//Declaracion de variables
let ventana = null;

//Obtener todos los cuadros de texto
let cuadrosTexto = document.querySelectorAll('input[type="text"]');

//Obtener todos los botones
let botones = document.querySelectorAll('input[type="button"]');

//Comprobar que tenemos todos los botones y cuadros de texto
console.log(botones);
console.log(cuadrosTexto);

//Asignar el foco al primer cuadro de texto del formulario
const ancho = document.getElementById("ancho");
ancho.focus();
ancho.select();

window.onload = () => console.log('window onload');
window.onunload = () => console.log('window onunload');

//Deshabilita los botones
for (let i = 1; i < botones.length; i++)
  botones[i].disabled = true;


//Función que limpia los cuadros de texto
const limpiar = () => {
  ancho.focus();
  ancho.select();
  for (let i = 0; i < cuadrosTexto.length; i++)
    cuadrosTexto[i].value = "";

}

//Obtener los botones a través del identificador
const bCrear = document.getElementById('BCrear');
const bCerrar = document.getElementById('BCerrar');
const bMover = document.getElementById('BMover');
const BRedimensionar = document.getElementById('BRedimensionar');

//Debemos implementar la función antes de invocarla por tratarse de una declaración de función como constante
const crearVentana = () => {
  let opciones = '';
  //Inicializar las características con los valores del formulario
  opciones = `width=${cuadrosTexto[0].value}, height= ${cuadrosTexto[1].value}, left=${cuadrosTexto[2].value},top=${cuadrosTexto[3].value}`;

  //Abrir la ventana y guardar la referencia en la variable ventana
  let  ventana = window.open('', 'ventana', opciones);
  
  ventana.name = 'nueva';
  //Crear la estructura html de la ventana
  ventana.document.write(
    '<head><meta http-equiv="content-type" content="text/html; charset=iso-8859-1"><title>Nueva ventana</title>'
  );
  ventana.document.write(
    '<link rel="StyleSheet" href="estilos.css" type="text/css"></head>'
  );
  ventana.document.write('<body id="cuerpo">');
  ventana.document.write('<div id="capa">');
  ventana.document.write('</div>');
  ventana.document.write('</body>');

  //Modificar el color de fondo de la ventana
  const cuerpoVentana = ventana.document.getElementById('cuerpo');
  cuerpoVentana.style.backgroundColor = 'grey';

  //Llama a la función que añade un elemento
  addElement('Voy a añadir un nuevo elemento');

  //Llama a la función que añade un nuevo parrafo al arbol
  anadir_parrafo();
  //Llama a la funcion que añade un parrafo antes
  insertar_antes();

  if (ventana != null) {
    //Habilita los botones y deshabilita el botón Crear
    botones[0].disabled = true;
    for (let i = 1; i < botones.length; i++)
      botones[i].disabled = false;
  }

};



bCrear.addEventListener(`click`, crearVentana);

const cerrarNuevaVentana = () => {
  
  if (ventana!=null)
      ventana.close();

  //opener: usada desde una ventana que ha sido creada por otra,
  //hace referencia a la que la creó
  limpiar();
  ventana.opener.focus();//Asignar el foco a la ventana padre al cerrar la secundaria

  //DesHabilita los botones y habilita el botón Crear
  botones[0].disabled = false;
  for (let i = 1; i < botones.length; i++)
    botones[i].disabled = true;



}

bCerrar.addEventListener(`click`, cerrarNuevaVentana);
/*
Para averiguar la posición de una ventana con respecto a la pantalla del usuario usaremos las siguientes propiedades del Objeto Window():

    screenX: distancia en píxels entre el borde izquierdo de la ventana y el de la pantalla. No funciona en el navegador web Internet Explorer.
    screenLeft: igual que screenX, pero no funciona en el navegador web Firefox.
    screenY: distancia en píxels entre el borde superior de la ventana y el de la pantalla. No funciona en Internet Explorer.
    screenTop: distancia en píxels entre el borde superior de la ventana y el de la pantalla. No funciona en Firefox.

*/


const moverVentana = () => {
  ventana.focus();
  let posX = ventana.screenX;
  let posY = ventana.screenY;
  
  ventana.moveBy(cuadrosTexto[2].value + posX, cuadrosTexto[3].value + posY);
}

bMover.addEventListener(`click`, moverVentana);

const redimensionar = () => {
  ventana.focus();
  let ancho = ventana.innerWidth;
  let alto = ventana.innerHeight;
  //En este caso vamos a aumentar el tamaño de la ventana de 10 en 10
  const inc=10;
  ventana.resizeBy(inc + ancho, inc + alto);
}


BRedimensionar.addEventListener(`click`, redimensionar);

//Funciones para añadir elementos en la nueva ventana
function addElement(texto) {

  let capa = ventana.document.getElementById("capa");
  let h1 = ventana.document.createElement("h1");

  // Accede al contenido del texto de un elemento
  h1.innerHTML = texto;
  capa.appendChild(h1);
}

// Añade un nodo al arbol de un documento

function anadir_parrafo() {

  let capa = ventana.document.getElementById("cuerpo");
  let parrafo = ventana.document.createElement('p');
  let texto = ventana.document.createTextNode("Parrafo añadido");
  parrafo.appendChild(texto);
  capa.appendChild(parrafo);

}

// Inserta un parrafo antes de uno que ya existe
function insertar_antes() {

  let capa = ventana.document.getElementById("cuerpo");
  let parrafo = ventana.document.createElement('p');

  parrafo.appendChild(document.createTextNode("Parrafo anterior al primero"));
  let elementoReferencia = capa.getElementsByTagName('p')[0];
  capa.insertBefore(parrafo, elementoReferencia);
}



