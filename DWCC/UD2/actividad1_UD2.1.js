// Generar un número aleatorio entre 0 y 50

//Solución utilizando las estrucuras de datos mencionadas en la actividad,
//Ciclo for y palabras reservadas break/continue,

const numeroAleatorio = Math.floor(Math.random() * 51); // Se agrega 1 al máximo para incluir 50

let intentos = 5;

console.log(numeroAleatorio)

// Bucle para 5 intentos
for (let i = 1; i <= intentos; i++) {
  // Solicitar un número al usuario
  const numeroUsuario = prompt(`Intento ${i}/${intentos}: Adivina el número entre 0 y 50:`);

  // Validar si el usuario ingresó un número válido
  const numeroIngresado = parseInt(numeroUsuario);

  if (isNaN(numeroIngresado) || numeroIngresado < 0 || numeroIngresado > 50) {
    alert("Ingresa un número válido entre 0 y 50.");
    continue;
  }

  // Comprobar si el número es igual al número aleatorio
  if (numeroIngresado === numeroAleatorio) {
    alert("¡Enhorabuena! Has adivinado el número.");
    break;
  } else if (numeroIngresado < numeroAleatorio) {
    alert("El número es mayor.");
  } else {
    alert("El número es menor.");
  }

  // Mostrar un mensaje si no adivina en 5 intentos
  if (i === intentos) {
    alert(`Lo siento, no has conseguido adivinar el número. El número era ${numeroAleatorio}.`);
  }
}
