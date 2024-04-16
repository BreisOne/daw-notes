let obtenerUrlActual = window.location;
console.log(obtenerUrlActual);

//Obtener la ruta de los archivos
var ficheroArray = obtenerUrlActual.toString().split('/');
let long = ficheroArray.length;

console.log("Nombre de fichero " + ficheroArray[long - 1]);

// Obtener el nombre del fichero
let namefichero = ficheroArray[long - 1]

let idURL = obtenerUrlActual.toString().split(namefichero);
console.log(idURL[0]);

let rutaUsers = idURL[0].toString().concat('users.json');

let rutaCiclos = idURL[0].toString().concat('ciclos.json')

console.log("Acceder al fichero json " + rutaUsers);
console.log("Acceder al fichero json " + rutaCiclos);