function onceLoaded() {
    console.log('La página ha terminado de cargarse!!');
    let grButton = document.getElementById("greetButton");
    grButton.onclick = greetMe;
}


function greetMe() {
    let nombre = document.getElementById("nombre");
    alert('¡Hola, ' + nombre.value + '!');
}


window.onload = function () {
    onceLoaded();
};
//window.addEventListener('load', function () {
//  onceLoaded();
//   
//   
//});


