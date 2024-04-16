document.addEventListener('DOMContentLoaded', function() {
    const clienteForm = document.getElementById('clienteForm');
  
    clienteForm.addEventListener('submit', function(event) {
        event.preventDefault(); // Evita que se recargue la página al enviar el formulario
      // Obtener los valores del formulario
      
      const provincia = document.getElementById('provincia').value;
      const id = document.getElementById('id').value;
      
      let clientes = obtenerClientes();
  
      console.log(clientes);
      // Crear el objeto cliente
      const cliente = {
            provincia: provincia,
            id: id
        };
  
        // Guardar el cliente en el LocalStorage
        guardarCliente(cliente);
  
        // Limpiar el formulario
        clienteForm.reset();
    });
  
    const mostrarClientesBtn = document.getElementById('mostrarClientes');
    const tablaClientes = document.getElementById('tablaClientes');
  
    mostrarClientesBtn.addEventListener('click', function() {
        mostrarClientes();
    });
  });
  
  function mostrarClientes() {
    // Obtener los clientes del LocalStorage
    const clientes = JSON.parse(localStorage.getItem('clientes')) || [];
    const clientesAPI =  obtenerClientes();
    
    console.log(clientesAPI);
    // Construir la tabla HTML
    let tablaHTML = '<table>';
    tablaHTML += '<tr><th>ID</th><th>Provincia</th><th>Eliminar</th></tr>';
  
    clientes.forEach((cliente, index) => {
      tablaHTML += `<tr data-index="${index}"><td>${cliente.provincia}</td><td>${cliente.id}</td><td><button class="eliminarBtn">Eliminar</button></td></tr>`;
    });
  
    tablaHTML += '</table>';
  
    // Mostrar la tabla en el elemento tablaClientes
    tablaClientes.innerHTML = tablaHTML;
  
    // Escuchar el clic en los botones "Eliminar"
    const eliminarBtns = document.querySelectorAll('.eliminarBtn');
    eliminarBtns.forEach(btn => {
      btn.addEventListener('click', function () {
        const rowIndex = this.parentElement.parentElement.dataset.index;
        eliminarCliente(rowIndex);
      });
    });
  }
  
   // Función para eliminar un cliente
   function eliminarCliente(index) {
    let clientes = JSON.parse(localStorage.getItem('clientes')) || [];
    clientes.splice(index, 1); // Eliminar el cliente del arreglo
    localStorage.setItem('clientes', JSON.stringify(clientes)); // Actualizar el LocalStorage
    mostrarClientes(); // Volver a mostrar la tabla actualizada
  }
  
  function guardarCliente(cliente) {
    // Obtener los clientes existentes del LocalStorage (si los hay)
    let clientes = JSON.parse(localStorage.getItem('clientes')) || [];
  
    // Agregar el nuevo cliente
    clientes.push(cliente);
  
    // Guardar los clientes actualizados en el LocalStorage
    localStorage.setItem('clientes', JSON.stringify(clientes));
  }