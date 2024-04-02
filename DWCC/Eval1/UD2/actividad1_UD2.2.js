// Adivina un número aleatorio entre 0 y 50
// Esta forma es más eficiente ya que el uso de break no es una práctica recomendad en programación

const numeroAleatorio = Math.floor(Math.random() * 51); // Se agrega 1 al máximo para incluir 50

let intentos = 5;
let adivinado = false;

console.log(numeroAleatorio);

while (intentos > 0 && !adivinado) {
  const numeroUsuario = prompt(`Tienes ${intentos} intentos. Adivina el número entre 0 y 50:`);
  
  const numeroIngresado = parseInt(numeroUsuario);

        if (isNaN(numeroIngresado) || numeroIngresado < 0 || numeroIngresado > 50) {
            alert("Ingresa un número válido entre 0 y 50.");
        } else if (numeroIngresado === numeroAleatorio) {
            alert("¡Enhorabuena! Has adivinado el número.");
            adivinado = true;
        } else if (numeroIngresado < numeroAleatorio) {
            alert("El número es mayor.");
            intentos--;
        } else {
            alert("El número es menor.");
            intentos--;
        }
}

if (!adivinado) {
  alert(`Lo siento, no has conseguido adivinar el número. El número era ${numeroAleatorio}.`);
}
