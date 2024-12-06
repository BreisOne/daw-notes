const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

const snowflakes = [];


// Crear un copo de nieve
function createSnowflake() {
    const x = Math.random() * canvas.width; // Posición aleatoria en X
    const y = Math.random() * canvas.height - canvas.height; // Posición inicial en Y (fuera de la pantalla)
    const speed = Math.random() + 0.50; // Velocidad de caída aleatoria
    const radius = Math.random() * 3 + 2; // Tamaño aleatorio
    snowflakes.push({ x, y, speed, radius });
}

// Dibujar los copos de nieve
function drawSnowflakes() {
    ctx.clearRect(0, 0, canvas.width, canvas.height); // Limpiar el canvas
    snowflakes.forEach((snowflake, index) => {
        ctx.beginPath();
        ctx.arc(snowflake.x, snowflake.y, snowflake.radius, 0, Math.PI * 2); // Dibuja cada copo de nieve
        ctx.fillStyle = "white";
        ctx.fill();
        ctx.closePath();


        // Actualizar la posición de los copos de nieve solo en el eje Y
        snowflake.y += snowflake.speed;

        // Si el copo se sale del fondo, lo reiniciamos en la parte superior
        if (snowflake.y > canvas.height) {
            snowflakes.splice(index, 1);
            createSnowflake();
        }
    });
}

// Animar los copos de nieve
function animate() {
    drawSnowflakes();
    // Limitar el número de copos de nieve
    if(snowflakes.length < 125){
        createSnowflake();
    }
    requestAnimationFrame(animate); // Volver a llamar la animación
}

// Ajustar el tamaño del canvas si la ventana cambia de tamaño
window.addEventListener("resize", () => {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
});

animate();
