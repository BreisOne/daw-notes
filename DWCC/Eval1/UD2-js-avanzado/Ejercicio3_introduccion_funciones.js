
'use strict'
let numero;
let numOrden;
let userInput = [];
let numsPar =[];
let numsInPar =[];
let suma = 0;
let numeroBuscar;
let noEncontrado;

for (let i = 0; i <= 5; i++) {

    numero = parseInt(prompt("Introduce un número"))
    userInput.push(numero);
    
}

const mostrar = (userInput)=> {    
    for(let i = 0; i < userInput.length; i++) {
    console.log(userInput[i]);
};
};

const orden = (mostrar) => {
    console.log("Array ordenado")
    numOrden = userInput.sort((a,b)=>a,b); // Ordenar de forma numerica, sort ordenda de forma alfabeitca por defecto
    mostrar(numOrden);
    console.log("Array ordenado")
    userInput.sort(); // Sort y los metodos del array machaca los valores del array original.
    mostrar(numOrden);
}

const ordenInv = (mostrar)=> {
    console.log("Orden inversa")
    userInput.reverse();
    mostrar(userInput);
}

const tamanno = ()=>{
    console.log("Longitude del array")
    console.log(userInput.length);
}

const posicion = ()=>{
    
    numeroBuscar = parseInt(prompt("Introduce un número para buscar en el array"));
    
    for (let i = 0; i < userInput.length; i++) {
        
        if(numeroBuscar === userInput[i]){
            console.log("el indice del número que buscas es: ");
            console.log(userInput.indexOf(userInput[i]));
            noEncontrado =false;
            return false;
        }else{
            noEncontrado=true; 
        }
     }
    
     if (noEncontrado === true) {
        console.log("El numero que buscas no está en el array");
     }
    
}

const esPar = ()=>{
    for (let i = 0; i < userInput.length; i++) {
        if (userInput[i] %2 === 0) {

            numsPar.push(userInput[i]);

        } else {
            numsInPar.push(userInput[i]);
        }      
    }
    return numsPar;
};
const sumarPar = (esPar)=>{
    esPar();

    for (let i = 0; i < numsPar.length; i++) {
         suma = suma + numsPar[i];
    }

    console.log(`Las suma de tu array es: ${suma}`);
}

mostrar(userInput);
posicion();
orden(mostrar);
ordenInv(mostrar);
sumarPar(esPar);