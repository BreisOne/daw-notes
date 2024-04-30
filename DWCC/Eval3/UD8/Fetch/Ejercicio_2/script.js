// Función para obtener los usuarios (clientes) a través de fetch
const obtenerAlumnos = async () => {
    try {
      const response = await fetch(rutaUsers); // ruta definida en fetchPath.js
      if (!response.ok) {
        throw new Error('Error al obtener los clientes');
        }
      const results = await response.json();
      return results.data;
    } catch (error) {
      console.error(error);
    }
}

// Función para obtener los ciclos a través de fetch
const obtenerCiclos = async () => {
  try {
    const response = await fetch(rutaCiclos); // ruta definida en fetchPath.js
    if (!response.ok) {
      throw new Error('Error al obtener los clientes');
    }
    const results = await response.json();
    return results.data;

  } catch (error) {
    console.error(error);
  }
}

const crearCicloPromise = (id, nombre, horas) => {
  //console.log(`id: ${id}, nombre: ${nombre}, horas: ${horas}`);
  return new Promise((resolve, reject) => {
    if ( !id || !nombre || !horas) {
      reject("El ciclo y sus horas son parámetros obligatorios");
    } else {
      resolve({ id, nombre, horas });
    }
  });
}

const loadDataCiclos = async () => {
  let ciclos = await obtenerCiclos();
  let ciclosPromises = ciclos.map(ciclo => crearCicloPromise(ciclo.id, ciclo.nombre, ciclo.duracion));
  let ciclosPromisesResults = await Promise.all(ciclosPromises);
  
  return ciclosPromisesResults;
}
const saveDataInLocalStorage = (alumnos, ciclos) => {
        
  alumnos.forEach(alumno => {
          let ciclo = ciclos.find(ciclo => parseInt(ciclo.id) === parseInt(alumno.id_ciclo));
          console.log(ciclo);
          
          let AlumnoCiclo = {
            "id": alumno.id,
            "email":alumno.email,
            "first_name": alumno.first_name,
            "last_name": alumno.last_name,
            "avatar": alumno.avatar,
            "id_ciclo": alumno.id_ciclo,
            "nombre": ciclo.nombre,
            "duracion": ciclo.duracion
          }
          localStorage.setItem(alumno.id, JSON.stringify(AlumnoCiclo));
          
  });
}

const createTableCiclos = (ciclos) => {
  let tableContainer = document.getElementById("usuarios");

  let table = document.createElement("table");
  
  let cabeceraTabla = table.createTHead().insertRow();
  let cabeceraCiclo = cabeceraTabla.insertCell().innerHTML = "Ciclo";
  let cabeceraDuración = cabeceraTabla.insertCell().innerHTML = "Duración";
  
  let cuerpoTabla = table.createTBody();

  ciclos.forEach(ciclo => {
    let filaTabla = cuerpoTabla.insertRow();
    let celdaCiclo = filaTabla.insertCell().innerHTML = ciclo.nombre;
    let celdaDuracion = filaTabla.insertCell().innerText = ciclo.horas;
  });

  tableContainer.appendChild(table);
}

const printAlumnosCiclos = (alumnosCiclos) => {
  let ciclosContainer = document.getElementById("ciclos");
  alumnosCiclos.map(alumno => {
    let p = document.createElement("p");

    p.innerText = `El alumno ${alumno.first_name} esta matriculado en el ciclo ${alumno.nombre}`;

    ciclosContainer.appendChild(p);
  });
  
}

document.addEventListener('DOMContentLoaded', async() => {
  
  let alumnos = await obtenerAlumnos();
  let ciclos = await loadDataCiclos();

  saveDataInLocalStorage(alumnos, ciclos);

  const alumnosCiclos = [];
  
  const keys = Object.keys(localStorage);
  
  keys.forEach(key => {
    let alumnoString = localStorage.getItem(key);
    let alumno = JSON.parse(alumnoString);
    alumnosCiclos.push(alumno);
  })

  createTableCiclos(ciclos);
  printAlumnosCiclos(alumnosCiclos);

});

