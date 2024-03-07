function login(event) {
    //evitamos que se envíe el formulario de forma predefinida (la acción por defecto sería enviar los datos al servidor)
    event.preventDefault();

    let email = document.getElementById('email').value;
    let pwd = document.querySelector("#pwd").value;
    let rol = document.querySelector("#rol").value;


    let login_url = "?controller=Usuario&action=login";

    //preparamos los datos que se enviarían al servidor como si se enviasen  por POST  desde el formulario
    const data = new FormData();
    data.append('email', email);
    data.append('pwd', pwd);
    data.append('rol', rol);

    const request = new Request(base_url + login_url, {
        method: "POST",
        body: data
    });

    fetch(request)
            .then((response) => {
                if (response.status === 200) {
                    return response.json();
                    //bad request
                } else if ((response.status === 400) || (response.status===401)) {
                    console.log('error 400');
                    return false;
                } else {
                    console.log("Something went wrong on API server!");
                    return false;
                }

            })
            .then((response) => {
                if (response.userId && response.email) {
                    toggleLoginMain(response.email);
                    userId = response.userId;
                    console.log(userId);
                } else {
                    console.error('La autenticación ha fallado');
                    showErrorLogin('La autenticación ha fallado', true, "errorLogin");
                }
            })
            .catch((error) => {
                console.error('Ha ocurrido un error en login' + error);
            });
    }

function logoutCliente() {
   
    if (userId != null && userId != undefined) {
        let logout_url = "?controller=Usuario&action=logout";
        const data = {'userId': userId};
            
        const request = new Request(base_url + logout_url, {
            method: "POST",
            body: JSON.stringify(data)
        });
                    
        fetch(request)
            .then((response) => {
                return response.json();
            })
            .then((response) => {
                
                console.log(response);
                toggleLoginMain('');
                userId = null;
                if (response.error == false) {
                    console.log('Se ha cerrado sesion correctamente');
                } else {
                    showErrorLogin('Ha ocurrido un error en logout', true, "errorLogout");}
            })
            .catch((error) => {
                console.error('Ha ocurrido un error en logout' + error);
            });
    }  
}
   
function confirmLogout(event) {
    //evitamos que se envíe el formulario de forma predefinida (la acción por defecto sería enviar los datos al servidor)
    event.preventDefault();
    showModal("spa_modal", "Confirmación logout", "¿Confirma que quiere cerrar sesión?", null, null, 
                logoutCliente, null);
}

/**
 * Muestra la sección main y oculta la sección login o viceversa en función del estado actual de cada una.
 * @param  email email del usuario logueado o cadena vacía. Ambos se mostrarán en la cabecera de la página.
 * Si email es cadena vacía, la sección main se vaciará de contenido html
 */
function toggleLoginMain(email) {



    let main = document.getElementById('main');
    let login = document.getElementById('login');
    let usuarioCabecera = document.getElementById('userHeader');
    let emailHeader = document.getElementById('email_header');

    emailHeader.innerHTML = email;
// https://getbootstrap.com/docs/5.0/utilities/display/
    emailHeader.classList.toggle('d-none');


    login.classList.toggle('d-none');

    main.classList.toggle('d-none');
    usuarioCabecera.classList.toggle('d-none');
    
    if(email.trim()===''){
        //vaciamos el main
        main.innerHTML='';
    }

}
/**
 * Muestra u oculta un mensaje en función de show en el html_id
 * @param {string} msg Mensaje a mostrar
 * @param {boolean} show true para mostrar, false en caso contrario
 * @parma {string} html_id id del elemento html donde se mostrará/ocultará el mensaje
 */
function showErrorLogin(msg, show, html_id) {
    var divError = document.getElementById(html_id);
    if (show) {
        divError.innerHTML = msg;
        divError.classList.remove('d-none');
        //setTimeout establece un temporizador que ejecuta una función o una pieza de código específica una vez que expira el temporizador.
        setTimeout(function () {
            divError.innerHTML = '';
            divError.classList.add('d-none');
        }
        //El tiempo, en milisegundos, que el temporizador debe esperar antes de que se ejecute la función o el código especificado
        , 2000);
    } else {
        divError.innerHTML = '';
        divError.classList.add('d-none');
    }    
}