'use strict'


//Declarar un array de objetos de clientes
let datosClientes = [{
    id: 1,
    email: "michael.lawson@reqres.in",
    first_name: "Michael",
    last_name: "Lawson"
},
{
    id: 2,
    email: "lindsay.ferguson@reqres.in",
    first_name: "Lindsay", "last_name": "Ferguson"
}
    , {
    id: 3,
    email: "tobias.funke@reqres.in",
    first_name: "Tobias",
    last_name: "Funke"
},
{
    id: 4,
    email: "byron.fields@reqres.in",
    first_name: "Byron",
    last_name: "Fields"
    }];

//Declara un array de objetos de pizzas
let datosPizzas = [
    {
        nombre: "Pizza margarita",
        precio: 20,
        identificador: 1,
        ingredientes: [
            "Champiñones",
            "Jamón Cocido"
        ]
    },
    {
        nombre: "Pizza barbacoa",
        precio: 25,
        identificador: 2,
        ingredientes: [
            "Carne",
            "Salsa barbacoa",
            "Extra de queso"
        ]
    },
    {
        nombre: "Pizza atún",
        precio: 22,
        identificador: 3,
        ingredientes: [
            "Atún",
            "Aceitunas negras",
            "Anchoa"
        ]
    }
];

let pizzaMismoIdUsuario = "";

const comprarPizza = () =>{
    localStorage.setItem(pizzaMismoIdUsuario.identificador, JSON.stringify(pizzaMismoIdUsuario));
}

const buscarPizzaCliente = (datosPizzas, userId) => {
    let divIngredientes = document.getElementById("ingredientes");
    
    pizzaMismoIdUsuario = datosPizzas.find(datosPizza => datosPizza.identificador === userId);

    if (pizzaMismoIdUsuario !== undefined) {
        let ingredientes = pizzaMismoIdUsuario.ingredientes;
        let h1 = document.createElement("h1");
        h1.innerHTML = `Los ingredientes de ${pizzaMismoIdUsuario.nombre} son:`;
        divIngredientes.appendChild(h1);
        ingredientes.map(ingrediente => {
            
            let h2 = document.createElement("h2");
            h2.innerText = ingrediente;

            divIngredientes.appendChild(h2);

        });
        
        let btnComprar = document.createElement("input");
        btnComprar.type = "button";
        btnComprar.value = "Comprar";
        btnComprar.addEventListener('click', comprarPizza);
        divIngredientes.appendChild(btnComprar);
    } else {
        alert(`No hay pizzas con el mismo Id del cliente. Id cliente: ${userId}`);
    };

};

const nombrarDatos = (datosPizzas) =>{
    let divPizzas = document.getElementById("pizzas");
    
    let table = document.createElement("table");
    
    let tableHead = document.createElement('thead');
    
    let tableHeadR = document.createElement("tr");
    let encabezadoNombre = document.createElement("th");
    
    let encabezadoPrecio = document.createElement("th");

    encabezadoNombre.innerHTML = "NOMBRE";
    encabezadoPrecio.innerHTML = "PRECIO";
    
    tableHeadR.appendChild(encabezadoNombre);
    tableHeadR.appendChild(encabezadoPrecio);

    tableHead.appendChild(tableHeadR);
    table.appendChild(tableHead);
    let tableBody = document.createElement("tbody");

    datosPizzas.map(datosPizza => {
        console.log(datosPizza);
        let tableBodyR = document.createElement("tr");
        let pizza = document.createElement("td");
        pizza.innerHTML = datosPizza.nombre;

        let precio = document.createElement("td");
        precio.innerHTML = datosPizza.precio;

        tableBodyR.appendChild(pizza);
        tableBodyR.appendChild(precio);

        tableBody.appendChild(tableBodyR);
    })

    table.appendChild(tableBody);

    divPizzas.appendChild(table);

}
const nombreCliente = (clienteArray) => {
    let divCliente = document.getElementById("cliente");
        
    let h1 = document.createElement("h1");

    h1.innerText = `${clienteArray.first_name} ${clienteArray.last_name}`;
    
    divCliente.appendChild(h1);
}

const iniciarPrograma = () => {
    let userId = parseInt(prompt("Introduce identificador del cliente"));
    

    let clienteArray = datosClientes.find(cliente => cliente.id === userId);
    
    if (clienteArray !== undefined) {

        nombreCliente(clienteArray);
        nombrarDatos(datosPizzas);
        setTimeout(() => { buscarPizzaCliente (datosPizzas, userId) }, 2000);
        
    }else{
        alert(`No existe un cliente con el Id ${userId}`);
    }
    

}
    
document.addEventListener('DOMContentLoaded', iniciarPrograma);