const REMOTE_API_URL = "http://192.168.7.21:8000/api/notas";

const LOCAL_BACKEND_URL = "http://localhost:3000/controller/FrontController.php?controller=Nota&action=create";

const TITULO_PERMITIDO = "AAL";

/**
 * Muestra u oculta un mensaje en función de show en el html_id
 * @param {string} msg Mensaje a mostrar
 * @param {boolean} show true para mostrar, false en caso contrario
 * @param {string} html_id id del elemento html donde se mostrará/ocultará el mensaje
 * @param {boolean} appendMsg true para añadir al mensaje, false para sustituir
 */
function showMsg(msg, show, html_id,  appendMsg) {
    var divMsg = document.getElementById(html_id);
    if (show) {
        if(appendMsg){
            console.log('intentando crear un di msg para ' + msg);
        divMsg.innerHTML = divMsg.innerHTML+ msg;
        }
        else{
            divMsg.innerHTML = msg;
        }
        divMsg.classList.remove('d-none');
      
     
    } else {
        divMsg.innerHTML = '';
        divMsg.classList.add('d-none');
    }
}