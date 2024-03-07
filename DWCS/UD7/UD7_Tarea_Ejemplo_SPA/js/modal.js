const OK_TEXT = "Aceptar";
const CANCEL_TEXT = "Cancelar";

/**
 *  Muestra un modal con el id especificado (sin #)
 * @param {string} modal_id
 * @param {string} title Titulo del modal
 * @param {string}  msg Mensaje con la pregunta que se plantearÃ¡ al usuario
 * @param {string} opt_ok_text Texto a mostrar en el botÃ³n de Aceptar. Si no existe, se mostrarÃ¡ el contenido en el html inicialmente.
 * @param {string} opt_cancel_text Texto a mostrar en el botÃ³n de Cancelar. Si no existe, se mostrarÃ¡ el contenido en el html inicialmente.
 * @param {function} opt_ok_function FunciÃ³n a ejecutar si el usuario ha hecho clic en el botÃ³n de aceptar. Se deberÃ¡ ejecutar despuÃ©s de cerrar el diÃ¡logo. Si no se aporta una funciÃ³n, simplemente se cerrarÃ¡ el diÃ¡logo.
 * @param {function} opt_cancel_function FunciÃ³n a ejecutar si el usuario ha hecho clic en el botÃ³n de cancelar. Se deberÃ¡ ejecutar despuÃ©s de cerrar el diÃ¡logo.  Si no se aporta una funciÃ³n, simplemente se cerrarÃ¡ el diÃ¡logo.
 
 */
function showModal(modal_id, title, msg,
    opt_ok_text = null,
    opt_cancel_text = null,
    opt_ok_function = null,
    opt_cancel_function = null) {

    //creamos unos flags para indicar quÃ© ha decidido el usuario
    let ok_clicked = false;
    let cancel_clicked = false;

    //Se crea con un objeto options, para que no se cierre el modal cuando se haga clic fuera del modal, pero sÃ­ si se usa la tecla ESC
    let myModal = new bootstrap.Modal(document.getElementById(modal_id), { backdrop: 'static', keyboard: true});

    let modal_id_selector = '#' + modal_id;

    let title_el = document.querySelector(modal_id_selector + ' #modal_title');
    let msg_el = document.querySelector(modal_id_selector + '  #modal_msg');
    let optok_el = document.querySelector(modal_id_selector + '  #opt_ok');
    let optcancel_el = document.querySelector(modal_id_selector + '  #opt_cancel');

    //Establecemos el title y msg
    title_el.innerHTML = title;
    msg_el.innerHTML = msg;

    //Establecemos textos personalizados en los botones si vienen por parÃ¡metro, si no, se usan mensajes por defecto
    if (opt_ok_text !== null) {
        optok_el.innerHTML = opt_ok_text;
    } else {
        optok_el.innerHTML = OK_TEXT;
    }

    if (opt_cancel_text !== null) {
        optcancel_el.innerHTML = opt_cancel_text;
    } else {
        optcancel_el.innerHTML = CANCEL_TEXT;
    }

    //obtenemos el div del modal
    let myModalEl = document.getElementById(modal_id);

    //Este evento se dispara cuando se termina de ocultar el modal, tanto si el usuario ha hecho clic en OK, NOK o ninguna opciÃ³n.
    myModalEl.addEventListener('hidden.bs.modal', function (event) {
        if (ok_clicked === true) {
            if (opt_ok_function !== null) {
                //llamamos a la funciÃ³n de aceptaciÃ³n
                opt_ok_function();
            }
        } else {
            if (cancel_clicked === true) {
                if (opt_cancel_function !== null) {
                    //llamamos a la funciÃ³n de cancelaciÃ³n
                    opt_cancel_function();
                }
            }
        }
        //reseteamos los flags a false
        ok_clicked = false;
        cancel_clicked = false;
    }, { once: true });
    //Con once:true 
    //nos aseguramos de que solo se ejecute una vez y que justo despuÃ©s se quite el manejador de enventos
    //https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener
    //Un elemento puede tener varios manejadores de eventos (EventListeners) y si el usuario cancela la primera vez que se le muestra el diÃ¡log modal,
    // aÃ±adimos un manejador. Si se le vuelve a mostrar el diÃ¡logo, habrÃ­a un segundo manejador y asÃ­ sucesivamente. Para evitar que existan varios manejadores y se ejecuten todos cuando el modal se oculte, 
    //usamos once:true


    optok_el.onclick = function () {
        //establecemos los flags del botÃ³n sobre el que se ha hecho clic y  reiniciamos el valor del otro botÃ³n a false
        ok_clicked = true;
        cancel_clicked = false;

        myModal.hide();
    };
    optcancel_el.onclick = function () {
        cancel_clicked = true;
        ok_clicked = false;

        myModal.hide();
    };

    //Establecemos el foco en OK button con el evento que nos avisa de que se ha mostrado el modal al usuario
    /*Due to how HTML5 defines its semantics, the autofocus HTML attribute has no effect in Bootstrap modals. To achieve the same effect, use some custom JavaScript:
     * 
     */
    myModalEl.addEventListener('shown.bs.modal', function () {
        optok_el.focus();
    }, { once: true });

    //Finalmente mostramos el modal
    myModal.show();

}