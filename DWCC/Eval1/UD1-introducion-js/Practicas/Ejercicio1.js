
function esPrimo(numero) {
    if (numero <= 1) {
      return false;
    }
    if (numero <= 3) {
      return true;
    }
    if (numero % 2 === 0 || numero % 3 === 0) {
      return false;
    }
    let i = 5;
    while (i * i <= numero) {
      if (numero % i === 0 || numero % (i + 2) === 0) {
        return false;
      }
      i += 6;
    }
    return true;
  }
  
  function listaPrimosMenores(numero) {
    const primosMenores = [];
    for (let i = 2; i < numero; i++) {
      if (esPrimo(i)) {
        primosMenores.push(i);
      }
    }
    return primosMenores;
  }
  
  let numero = parseInt(prompt('introduce un primer número: '));

  while(numero <=0 || isNaN(numero)){
      numero1 = parseInt(prompt('introduce un primer número: '));
      console.log(numero1);
  }
    
  if (esPrimo(numero)) {
    console.log(`${numero} es un número primo.`);
    const primosMenores = listaPrimosMenores(numero);
    console.log(`Números primos menores que ${numero}: ${primosMenores.join(", ")}`);
  } else {
    console.log(`${numero} no es un número primo.`);
  }
  

