// Crear la clase abstracta y las sub clases.

class Forma {
    dibujar() {}
    borrar(){}
}
    
class Circulo extends Forma {
    dibujar(){
    document.write("Dibujo un círculo");
    }
    borrar() {
    document.write("Borro un círculo");
    }
}

class Cuadrado extends Forma {
    dibujar(){
    document.write ("Dibujo un cuadrado");
    }
    borrar() {
    document.write("Borro un cuadrado");
    }
}

class Triangulo extends Forma {
    dibujar(){
    document.write("Dibujo un triángulo");
    }
    borrar() {
    document.write("Borro un triángulo");
    }
}

// Crear la clase punto con la siguiente estructura. Todas las figuras geométricas necesitan
// un punto para dibujarse.
class Punto {
    constructor(x, y) {
        this.x = x;
        this.y = y;
    }
    distancia(b) {
        const dx = this.x - b.x;
        const dy = this.y - b.y;
        return Math.sqrt(dx * dx + dy * dy);
    }
}

const pintar = (event) => {
    event.preventDefault();
}

btnsPintar = document.querySelectorAll("input[type='submit']");

btnsPintar.forEach(btnPintar => {
    btnPintar.addEventListener('click', pintar);
});

