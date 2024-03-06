
const base_url = "http://localhost:3000/UD7_Temario_2.1_Ejemplo_SPA_modal/controller/FrontController.php";

window.onload = onceLoaded;


function onceLoaded() {

    console.debug("window loaded");
    document.querySelector('#formLogin').onsubmit = confirmLoginJSON;
    
    getRoles();
}

