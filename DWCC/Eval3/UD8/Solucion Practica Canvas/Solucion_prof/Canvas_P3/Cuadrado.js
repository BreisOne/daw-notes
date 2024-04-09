class Cuadrado extends Forma {
    constructor(lado, ladoLienzo) {
        super();
        this.lado = lado;
        const x = (ladoLienzo - lado) / 2;
        const y = x;
        this.center = new Punto(x, y);
    }

    dibujar(ctx) {
        ctx.fillRect(this.center.x, this.center.y, this.lado, this.lado);
    }
}

