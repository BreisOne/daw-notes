const userNum = [];
let sum = 0;

while(true) {
  
  entrada = prompt('introduce un número: ');

  if (entrada !== null) {

    numero = parseInt(entrada);
      while(isNaN(numero)){
        entrada = prompt('introduce un número correcto: ');
        numero = parseInt(entrada);
      }
      userNum.push(numero);
      
  }else{
    for (let i = 0; i < userNum.length; i++) {
      sum += userNum[i];
    }
    mean = sum /userNum.length;
    alert(mean);
  }
}


