document.getElementById("calculatorForm").addEventListener("submit", async function(event) {
    event.preventDefault();

    // Obtener los valores del formulario
    const num1 = document.getElementById("num1").value;
    const num2 = document.getElementById("num2").value;
    const operation = document.getElementById("operation").value;

    // Construir la URL de la API según la operación
    const url = `/api/${operation}/?num1=${num1}&num2=${num2}`;

    try {
        // Enviar la solicitud a la API
        const response = await fetch(url);
        const data = await response.json();

        // Verificar el estado de la respuesta y mostrar el resultado
        if (response.ok) {
            document.getElementById("result").innerText = `Resultado: ${data.resultado}`;
        } else {
            document.getElementById("result").innerText = "Error en la solicitud";
        }
    } catch (error) {
        document.getElementById("result").innerText = "Error en la conexión";
        console.error("Error:", error);
    }
});