// Declarar un array para almacenar los números
const numeros = [];

// Función para calcular la suma de los números en el array
function calcularSuma(arr) {
  let suma = 0;
  for (let i = 0; i < arr.length; i++) {
    suma += arr[i];
  }
  return suma;
}

// Función para calcular la media de los números en el array
function calcularMedia(arr) {
  if (arr.length === 0) {
    return 0;
  }
  const suma = calcularSuma(arr);
  return suma / arr.length;
}

// Leer números hasta que se ingrese un cero
let numero;
do {
  numero = parseFloat(prompt("Introduce un número (0 para terminar):"));
  if (!isNaN(numero)) {
    numeros.push(numero);
  }
} while (numero !== 0);

// Calcular y mostrar la suma y la media de los números
const suma = calcularSuma(numeros);
const media = calcularMedia(numeros);

console.log(`Suma: ${suma}`);
console.log(`Media: ${media}`);
