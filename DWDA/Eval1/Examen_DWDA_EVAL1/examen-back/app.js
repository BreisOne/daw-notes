const express = require('express');
const cors = require('cors');
const app = express();
const PORT = 8001;

// Middleware para parsear JSON
app.use(express.json());
app.use(cors({
    origin: '*'
}));

// Ruta para la suma
app.get('/sumar', (req, res) => {
    const { num1, num2 } = req.query;
    const resultado = parseFloat(num1) + parseFloat(num2);
    res.json({ resultado });
});

// Ruta para la resta
app.get('/restar', (req, res) => {
    const { num1, num2 } = req.query;
    const resultado = parseFloat(num1) - parseFloat(num2);
    res.json({ resultado });
});

// Ruta para la multiplicación
app.get('/multiplicar', (req, res) => {
    const { num1, num2 } = req.query;
    const resultado = parseFloat(num1) * parseFloat(num2);
    res.json({ resultado });
});

// Ruta para la división
app.get('/dividir', (req, res) => {
    const { num1, num2 } = req.query;
    if (parseFloat(num2) === 0) {
        res.status(400).json({ error: "No se puede dividir entre 0" });
    } else {
        const resultado = parseFloat(num1) / parseFloat(num2);
        res.json({ resultado });
    }
});


// Iniciar el servidor
app.listen(PORT, () => {
    console.log(`Servidor escuchando en http://localhost:${PORT}`);
});