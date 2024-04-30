
let numero1 = parseInt(prompt('introduce un primer número: '));
let numero2 = parseInt(prompt('introduce un segundo número: '))

while (numero1 <=0 || numero2 <=0 || isNaN(numero1) || isNaN(numero2)){
    numero1 = parseInt(prompt('introduce un primer número: '));
    numero2 = parseInt(prompt('introduce un segundo número: '));

    console.log(numero1);
    console.log(numero2);
}

function operaciones(num1, num2){
        suma = num1 + num2;
        resta = num1 - num2;
        multiplicacion = num1 * num2;
        division = num1 / num2;

       console.log(`suma : ${suma}`)
       console.log(`resta : ${resta}`)
       console.log(`multiplicacion : ${multiplicacion}`)
       console.log(`division : ${division}`)
 }

 operaciones(numero1, numero2);


