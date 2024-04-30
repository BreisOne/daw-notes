
'use strict'

let numero1 = parseInt(prompt('introduce un primer número: '));
let numero2 = parseInt(prompt('introduce un segundo número: '));
let numero3 = parseInt(prompt('introduce un tercer número: '));

while (numero1 <=0 || numero2 <=0 || numero3<=0 || isNaN(numero1) || isNaN(numero2)|| isNaN(numero3)){
    numero1 = parseInt(prompt('introduce un primer número: '));
    numero2 = parseInt(prompt('introduce un segundo número: '));
    numero3 = parseInt(prompt('introduce un tercer número: '));

    console.log(numero1);
    console.log(numero2);
    console.log(numero3);
}

if (numero1 > numero2 && numero1 > numero3){
    console.log(`${numero1} es el mayor`);
}else if(numero2 > numero3 && numero2 > numero1){
    console.log(`${numero2} es el mayor`);
}else if (numero3> numero1 && numero3 > numero2){
    console.log(`${numero3} es el mayor`);
}else{
    console.log("Los numeros son iguales");
}

