





function validarTitulo() {
    //TODO: 2- Completa la función validarTitulo() ya proporcionada en el archivo crear.js dentro de la carpeta js para que devuelva true solo cuando el valor del input del formulario que alberga el título de la nota en  index.php  sea igual a la constante TITULO_PERMITIDO y false en caso contrario. (1 punto)
    let title = document.getElementById('title').value;
    return title === TITULO_PERMITIDO;
}

function crearNotaApiRemota() {
    //TODO: 3- Completa la función crearNotaApiRemota() ya proporcionada en el archivo crear.js  de la carpeta js   para que, utilizando el API de Fetch, realice una petición POST con el título introducido en el formulario  enviando a REMOTE_API_URL un objeto JSON: 
    let title = document.getElementById('title').value;
    
    const dataPOST = {
        "title": title
    }
        const request = new Request(REMOTE_API_URL, {
            method: "POST",
            body: JSON.stringify(dataPOST)
        });
        fetch(request)
            .then((response) => {
            if (response.status === 201) {
                showMsg("Éxito en la creación de la nota", true, "div-msg", true);
                data = response.json();
                return data;
            } else if ((response.status === 400) || (response.status === 401)) {
                console.log('error 400');
                return false;
            } else {
                console.log("Something went wrong on API server!");
                return false;
            }
            })
            .then(data => {
                console.log(data);
                confirmCrearNotaLocal(data);
            })
            .catch((error) => {
                showMsg("Error en la creación de la nota", true ,"div-msg", true)
                console.error('Ha ocurrido un error en al crear la nota' + error);
             });
    

}

function confirmCrearNotaLocal(data) {
    //TODO: 4- Completa la función  confirmCrearNotaLocal(data) ya proporcionada en crear.js para que muestre un diálogo modal preguntando al usuario si quiere crear una nota en el servidor local, mediante NotaController y su método create. Si el usuario confirma su voluntad de crear una nota en el servidor local, deberá llamarse a crearNotaLocal(data), enviando los datos que se recibieron originalmente de la Api remota. (2 puntos)
    showModal("modal", "Confirmación creación de nota en local", "¿Confirma que quieres crear la nota en local?", null, null,
        function () { crearNotaLocal(data); }, null);
}

function crearNotaLocal(nota) {
    console.log(nota);
    //TODO:  6-  Completa la función crearNotaLocal(nota) ya proporcionada en el archivo crear.js para que cree una variable con los datos title, createdAt, updatedAt y completed (todos salvo el id) de la nota creada en la Api remota y se reciban en NotaController.php en el array superglobal $_POST como si fueran enviados en un formulario html (no se enviarán como objeto JSON). (2 puntos)    
    let title = nota["title"];
    console.log(title);
    let createdAt = nota["createdAt"];
    let updatedAt = nota["updatedAt"];
    let completed = nota["completed"];


    //preparamos los datos que se enviarían al servidor como si se enviasen  por POST  desde el formulario
    const dataPOST2 = new FormData();
    dataPOST2.append('title', title);
    dataPOST2.append('createdAt', createdAt);
    dataPOST2.append('updatedAt', updatedAt);
    dataPOST2.append('completed', completed);

    const request = new Request(LOCAL_BACKEND_URL, {
        method: "POST",
        body: dataPOST2
    });
    

    fetch(request)
        .then(response => response.json())
        .then(data => {

            if (data.id) {
                showMsg("<br/> Se ha creado localmente la nota : " + JSON.stringify(data, null, 10), true, "div-msg", true);
            }
            else {
                showMsg("<br/> Ha habido un error creando la nota localmente: " + data.error, true, "div-msg", true);
            }

        })
        .catch(error => console.error("Ha ocurrido un error" + error));

}