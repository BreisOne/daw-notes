
const base_url = "http://localhost:3000/DWCS/UD7/UD7_Temario_1.4_Ejemplo_SPA/controller/FrontController.php";

window.onload = onceLoaded;


function onceLoaded() {

    console.debug("window loaded");
    document.querySelector('#formLogin').onsubmit = login;
    
    getRoles();
}

