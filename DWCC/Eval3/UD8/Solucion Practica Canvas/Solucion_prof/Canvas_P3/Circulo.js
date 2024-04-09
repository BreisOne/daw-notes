class Circulo extends Forma {
    constructor(radio, ladoLienzo) {
        super();
        this.radio = radio;
        this.center = new Punto(ladoLienzo / 2, ladoLienzo / 2);
        
    }

    dibujar(ctx) {
        ctx.beginPath();
        ctx.arc(this.center.x, this.center.y, this.radio, 0, Math.PI * 2);
        ctx.fill();
        ctx.close();
    }
}