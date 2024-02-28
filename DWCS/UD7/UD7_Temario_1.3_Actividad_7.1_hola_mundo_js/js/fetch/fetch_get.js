window.onload = function () {
    onceLoaded();
};


// window.onload = async function () {   
//     await onceLoadedAwait();
// };

//https://reqres.in/ API de prueba
function onceLoaded() {
    fetch('https://reqres.in/api/users')
        .then(data => data.json())
        .then(users => {
            data = users.data;
            procesarJSON(data);
        }
        )
        .catch((err) => console.error("error:", err));

}


async function onceLoadedAwait() {

    //https://reqres.in/ API de prueba

    try {
        let response = await fetch('https://reqres.in/api/users');
        if (response.ok === true) {
            let users = await response.json();
            data = users.data;
            procesarJSON(data);

        }

        else {
            console.error("Error-HTTP: " + response.status);
        }
    }
    catch (error) {
        console.error("Error: " + error);
    }
}

function procesarJSON(data) {
   
    console.log(data);


    let lista = document.createElement("ul");
    for (var i = 0; i < data.length; i++) {
        let elem = document.createElement("li");
        elem.innerHTML = data[i].email;
        lista.appendChild(elem);
    }

    var body = document.getElementById("users");
    body.innerHTML = "";
    body.appendChild(lista);
}