document.getElementById("caculadora").addEventListener("submit", async function(event) {
    event.preventDefault();

    // Obtener los valores del formulario
    const num1 = document.getElementById("num1").value;
    const num2 = document.getElementById("num2").value;
    const operation = document.getElementById("operation").value;

    // Construir la URL de la API según la operación
    const url = `http://127.0.0.1:8001/${operation}?num1=${num1}&num2=${num2}`;

    try {
        // Enviar la solicitud a la API
        const response = await fetch(url);
        const data = await response.json();

        // Verificar el estado de la respuesta y mostrar el resultado
        if (response.ok) {
            document.getElementById("result").innerText = `${data.resultado}`;
            document.getElementById("result").style.backgroundColor = "green";
        } else {
            document.getElementById("result").innerText = "Error en la solicitud";
            document.getElementById("result").style.backgroundColor = "red";
        }
    } catch (error) {
        document.getElementById("result").innerText = "Error en la conexión";
        document.getElementById("result").style.backgroundColor = "red";
        console.error("Error:", error);
    }
});