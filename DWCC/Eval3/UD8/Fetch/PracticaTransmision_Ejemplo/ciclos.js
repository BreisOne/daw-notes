'use strict'


//Clase cicloAlumnado- Vamos a crear una clase para asignar el ciclo en el que está almacenado un alumn
class CicloAlumnado {
    constructor(id, alumno, nombreciclo, duracionciclo) {
        this.id = id;
        this.alumno = alumno;
        this.nombreciclo = nombreciclo;
        this.duracionciclo = duracionciclo;
    }
    //metodos
    asignarciclo(nombreciclo, duracionciclo) {
        this.nombreciclo = nombreciclo;
        this.duracionciclo = duracionciclo;
    }

    mostrarDatos() {
        return `El ciclo en el que está matriculado el alumno ${this.alumno} es ${this.nombreciclo} `;
    }

}

//Método que asegura que se ha cargado la estructura DOM para poder acceder

window.addEventListener('DOMContentLoaded', () => {
    const div_alumnos = document.querySelector('#alumnos');
    const div_ciclos = document.querySelector('#ciclos');
    //Declaración de variables
    let alumnos = [];

    //Si queremos mostrar la información de otro alumno o de otro ciclo debemos 
    //modificar este valor
    const id = 2;
    let cicloAlumnado;


    //Declaración de las funciones 

    let getusuarios = () => {
        //Devuelve los datos a través de la interfaz fetch. El resultado es un objeto de tipo promise
        //return fetch('https://reqres.in/api/users');
        return fetch('users.json');
    }

    //Función que muestra los datos de los usuarios
    let listadousuarios = (usuarios) => {
        usuarios.map((user, i) => {
            let nombre = document.createElement("h3");
            nombre.innerHTML = user.id + " " + user.first_name + " " + user.last_name;
            div_alumnos.appendChild(nombre);

            document.querySelector(".loading").style.display = "none";
        });
    }

    //Función que muestra los datos de un ciclo determinado.

    let listadociclos = (nombreciclo) => {

        let nombre = document.createElement("h3");
        nombre.innerHTML = " Nombre del ciclo: " + nombreciclo.nombre + " con una duración de " + nombreciclo.duracion;
        div_ciclos.appendChild(nombre);
        document.querySelector(".loading").style.display = "none";
        document.querySelector(".botonMostrar").style.display = "visibility";

    }

    //Llamada a la función getUsuarios que nos devuelve el resultado de ejecutar la interfaz ftech. Como dicha interfaz me devuelve un objeto de tipo Promise
    //lo que tengo que hacer es capturarlo

    getusuarios()
        .then(datos => datos.json())
        .then(alumnos => {
            listadousuarios(alumnos.data);

            //Crear un objeto CicloAlumnado. Para ello necesitamos obtener los datos del usuario cuyo id se inicializó 
            //con la constante id =2. Accede a todos los datos de alumnos y obtiene los datos del alumno buscado.


            const alumno = alumnos.data.find(a => a.id === id);
            //Creamos un objeto Cicloalumnado con su identificador, primer nombre y los dos campos relacionados con los ciclos
            //en blanco.
            (alumno) ? cicloAlumnado = new CicloAlumnado(alumno.id, alumno.first_name, "", 0)
                : console.log(`No hay alumnos con id ${id}`);

            //A continuación devolvemos una promesa con la siguiente instrucción. Nos devuelve resolve o reject. Al
            //tratarse de una promes, debemos capturarla y eso se hace con el .then.
            return getciclos(id);
        })
        .then(data => {

            //Añadir datos a el objeto cicloAlumnado que faltaban, es decir el nombre y la duración del ciclo. En este caso 
            //le asigna los datos del ciclo 2, pues el valor de la constante id sigue siendo dos.
            cicloAlumnado.asignarciclo(data.nombre, data.duracionciclo);

            console.log(cicloAlumnado.mostrarDatos());

            const ciclos_string = JSON.stringify(cicloAlumnado);
            localStorage.setItem(data.id, ciclos_string);
            console.log(ciclos_string);
            listadociclos(data);

        })
        .catch(err => console.log(err));

    //Crear una promesa desde cero para obtener la información del ciclo asociado a su id
    const getciclos = (id) => {

        const ciclos = [{
            id: 1,
            nombre: 'DIW',
            duracion: 120
        },
        {
            id: 2,
            nombre: 'ASIR',
            duracion: 180
        },
        {
            id: 3,
            nombre: 'DWCC',
            duracion: 100
        }
        ];

        return new Promise((resolve, reject) => {

            var profesor_string = " ";

            setTimeout(function () {

                const ciclo = ciclos.find(c => c.id === id);
                (ciclo) ? resolve(ciclo) :
                    reject(`No hay alumnos en el ciclo con id ${id}`);
            }, 3000);
        })

    };


});


