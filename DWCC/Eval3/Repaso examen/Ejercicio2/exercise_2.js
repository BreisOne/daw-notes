class Cliente{

    constructor(nombre, DNI, Direccion) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.Direccion = Direccion;
    }

    mostrar() {
        return `Este es el cliente ${this.nombre} con DNI ${this.DNI}, que vive en ${this.Direccion}`;
    }

}

// const Juanjo = new Cliente("Juanjo", "586943931R", "Calle Venezuela, 47");

// const Lucia = new Cliente("Lucia", "694359821T", "Calle Ecuador, 76");

// const clientes = [Juanjo, Lucia];

// clientes.map(
//     cliente => {
//         localStorage.setItem(cliente.DNI, JSON.stringify(cliente));
//     }
// )

const guardarCliente = (event)=>{
    event.preventDefault();

    let nombre = document.getElementById("nombre");
    let DNI = document.getElementById("DNI");
    let direccion = document.getElementById("direccion");

    let cliente = new Cliente(nombre.value, DNI.value, direccion.value);
    console.log(cliente);
    localStorage.setItem(cliente.DNI, JSON.stringify(cliente));

    nombre.value = "";
    DNI.value = "";
    direccion.value = "";
}

const mostrarClientes = () => {

    let containerClientes = document.getElementById("containerMostrar");


    let clienteKeys = Object.keys(localStorage);
    let clientes = [];

    clienteKeys.map(key => {
        let cliente = JSON.parse(localStorage.getItem(key));
        clientes.push(cliente);
    });
    clientes.map(cliente => {
        let parrafoCliente = document.createElement("p");
        parrafoCliente.innerHTML = `Nombre cliente: ${cliente.nombre}, DNI cliente: ${cliente.DNI}, direccion cliente:${cliente.Direccion}`;
        containerClientes.appendChild(parrafoCliente);
    });
}
document.addEventListener("DOMContentLoaded", () => {
    const formCliente = document.getElementById("formGuardarCliente");
    
    formCliente.addEventListener("submit", guardarCliente);

    const btnMostrar = document.getElementById("mostrar");

    btnMostrar.addEventListener("click", mostrarClientes)
})