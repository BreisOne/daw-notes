
function calcFactorial(num){
  let factorial = 1;

  for(i=1; i<=num; i++){
    factorial *= i;
  }

  return factorial
}

// Leer números hasta que se ingrese un cero
let numero = parseFloat(prompt("Introduce un número (0 para terminar):"));

// Calcular y mostrar la suma y la media de los números
const resFacorial = calcFactorial(numero);
console.log(`Factorial: ${resFacorial}`);
