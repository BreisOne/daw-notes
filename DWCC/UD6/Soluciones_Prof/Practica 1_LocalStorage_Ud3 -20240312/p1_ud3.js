

class Vehiculo {
    constructor(modelo, marca, precio, km) {
        this.modelo = modelo;
        this.marca = marca;
        this.precio = precio;
        this.km = km;
    }

    getModelo() { return this.modelo; }
    setModelo(modelo) { this.modelo = modelo; }

    getMarca() { return this.marca; }
    setMarca(marca) { this.marca = marca; }

    getPrecio() { return this.precio; }
    setPrecio(precio) { this.precio = precio; }

    getKm() { return this.km; }
    setKm(km) { this.km = km; }
}

function crearVehiculos(modelo, marca, precio, km) {
    const vehiculo = new Vehiculo(modelo, marca, precio, km);
    localStorage.setItem(vehiculo.getModelo(), JSON.stringify(vehiculo));
}

window.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('crearVehiculos');
    const modelo = document.getElementById('modelo');
    const marca = document.getElementById('marca');
    const precio = document.getElementById('precio');
    const km = document.getElementById('km');
    const mostrar = document.getElementById('mostrar');
    const divVehiculos = document.getElementById('divVehiculos');
    const buscar = document.getElementById('buscar');
    const buscarModelo = document.getElementById('buscarModelo');
    const divVehiculosBuscados = document.getElementById('divVehiculosBuscados');

    form.addEventListener('submit', e => {
        e.preventDefault();
        crearVehiculos(modelo.value, marca.value, precio.value, km.value)
    });

    mostrar.addEventListener('click', () => {
        divVehiculos.innerHTML = '';
        const ul = document.createElement('ul');
        divVehiculos.appendChild(ul);

        for (let i = 0; i < localStorage.length; i++) {
            const vehiculo = JSON.parse(localStorage.getItem(localStorage.key(i)));
            const li = document.createElement('li');
            ul.appendChild(li);
            li.innerHTML = `🚗 Vehículo: ${i + 1}; Modelo: ${vehiculo.modelo}; Marca: ${vehiculo.marca}; Precio: ${vehiculo.precio} €; Km: ${vehiculo.km}`

        }
    });

    buscar.addEventListener('submit', e => {
        e.preventDefault();
        divVehiculosBuscados.innerHTML = '';

        if (localStorage.getItem(buscarModelo.value)) {
            const vehiculo = JSON.parse(localStorage.getItem(buscarModelo.value));
            const p = document.createElement('p');
            p.innerHTML = `🚗 Modelo: ${vehiculo.modelo}; Marca: ${vehiculo.marca}; Precio: ${vehiculo.precio} €; Km: ${vehiculo.km}`
            divVehiculosBuscados.appendChild(p);

           /* const formCambiar = document.createElement('form');
            divVehiculosBuscados.appendChild(formCambiar);
            const h2 = document.createElement('h2');
            h2.innerHTML = 'Cambiar datos de vehículo';
            formCambiar.appendChild(h2);

            const cambiarMarca = document.createElement('input');
            cambiarMarca.type = 'text';
            cambiarMarca.placeholder = 'Cambiar marca';
            cambiarMarca.value = vehiculo.marca;
            formCambiar.appendChild(cambiarMarca);

            const cambiarPrecio = document.createElement('input');
            cambiarPrecio.type = 'number';
            cambiarPrecio.placeholder = 'Cambiar precio';
            cambiarPrecio.value = vehiculo.precio;
            formCambiar.appendChild(cambiarPrecio);

            const cambiarKm = document.createElement('input');
            cambiarKm.type = 'number';
            cambiarKm.placeholder = 'Cambiar Km';
            cambiarKm.value = vehiculo.km;
            formCambiar.appendChild(cambiarKm);

            const cambiar = document.createElement('input');
            cambiar.type = 'submit';
            cambiar.value = 'Cambiar datos';
            formCambiar.appendChild(cambiar);

            formCambiar.addEventListener('submit', ev => {
                ev.preventDefault();
                crearVehiculos(vehiculo.modelo, cambiarMarca.value, cambiarPrecio.value, cambiarKm.value);
            });*/

        }
    });
})