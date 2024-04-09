class Triangulo extends Forma {
    constructor(lado, ladoLienzo) {
        super();
        this.lado = lado;
        this.mitadLadoLienzo = ladoLienzo / 2;
        const x = this.mitadLadoLienzo;
        const y = x;
        this.centro = new Punto(x, y);
        this.x1 = x;
        this.x2 = this.mitadLadoLienzo - (lado / 2);
        this.x3 = this.mitadLadoLienzo + (lado / 2);
        this.y1 = this.mitadLadoLienzo - ((2 / 3) * (1 / 2) * Math.sqrt(3) * lado);
        this.y2 = this.mitadLadoLienzo - ((2 / 3) * (1 / 2) * Math.sqrt(3) * lado) + (1 / 2) * Math.sqrt(3) * lado;
        this.y3 = this.y2;
    }

    dibujar(ctx) {
        ctx.beginPath();
        ctx.moveTo(this.x1, this.y1);
        ctx.lineTo(this.x2, this.y2);
        ctx.lineTo(this.x3, this.y3);
        ctx.fill();
    }
}

