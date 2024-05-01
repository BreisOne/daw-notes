let ocultos = new Array(8);
let aciertos = new Array(4);
window.addEventListener("DOMContentLoaded", () => {
    for (let cont = 0; cont < ocultos.length; cont++) {
        ocultos[cont] = Math.floor(Math.random() * 16 + 1);
    }
    console.log(ocultos.length);

    aleatorio();
    comprobar();
});



function aleatorio() {

    let i = 1;
    for (let cont = 0; cont < 4; cont++) {
        aciertos[cont] = parseInt(prompt("Introduce valor " + i++));

    }
    
    aciertos.sort((a,b)=>{
        return a-b;
     }); 

    aciertos.forEach(function (a) {
        console.log(`${a}`)
    });
}

function comprobar() {


    ocultos.forEach(function (o) {
        aciertos.forEach(function (a) {
            if (o == a)
                document.getElementById(o).style.backgroundColor = "yellow";
        }
          
        )
    })

    /*for (let x = 0; x < ocultos.length; x++) {
        for (let y = 0; y < 4; y++) {
            if (ocultos[x] == aciertos[y])
                document.getElementById(ocultos[x]).style.backgroundColor = "yellow";


        }
    }*/


    //Al final hace visible todas las celdas ocultas
    for (let x = 0; x < ocultos.length; x++) {
        document.getElementById("s" + ocultos[x]).style.visibility = "visible";
    }

}

