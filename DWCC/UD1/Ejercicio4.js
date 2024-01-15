
function esPar(num){
  if(num % 2 === 0){
    return true;
  } else{
    return false;
  }
}

// Leer números hasta que se ingrese un cero
  let numeros = [4,6,4,87,3,98,234]
  
  let resultadoImpar = document.getElementById("num");
  
  for (let i = 0; i < numeros.length; i++) {
     if(esPar(numeros[i])){
      console.log (`${numeros[i]} es par`)
    } else{    
      resultadoImpar.innerHTML += 
      "<h3> el número "+ numeros[i] + " es impar</h3>";
     }
  }
  
