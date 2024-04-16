// Función para obtener los usuarios (clientes) a través de fetch
async function obtenerClientes() {
    try {
      const response = await fetch(rutaUsers); // ruta definida en fetchPath.js
      if (!response.ok) {
        throw new Error('Error al obtener los clientes');
        }
      console.log(response);
      const data = await response.json();
      return data;
    } catch (error) {
      console.error(error);
    }
}

// Función para obtener los ciclos a través de fetch
async function obtenerCiclos() {
  try {
    const response = await fetch(rutaCiclos); // ruta definida en fetchPath.js
    if (!response.ok) {
      throw new Error('Error al obtener los clientes');
      }
    console.log(response);
    const data = await response.json();
    return data;
  } catch (error) {
    console.error(error);
  }
}

function crearCicloPromise(ciclo, horas) {
  return new Promise((resolve, reject) => {
    if (!ciclo || !horas) {
      reject("La provincia y el ID del cliente son obligatorios.");
    } else {
      resolve({ ciclo, horas });
    }
  });
}

document.addEventListener('DOMContentLoaded', () => {
  let ciclos = obtenerCiclos();

  console.log(ciclos);

});

