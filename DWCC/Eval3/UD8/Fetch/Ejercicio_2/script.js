// Función para obtener los usuarios (clientes) a través de fetch
async function obtenerClientes() {
    try {
      const response = await fetch(ruta); // ruta definida en fetchPath.js
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
  
obtenerClientes();
