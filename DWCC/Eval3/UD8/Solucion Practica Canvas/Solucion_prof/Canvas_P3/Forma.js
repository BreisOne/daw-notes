class Forma {
    constructor() {
        if (this.constructor === Forma)
            throw new Error("La clase personaA es abstracto");
    }
    dibujar() {
        throw new Error(
            "Este es un método abstracto y se debe sobreescribir en las subclases"
        );
    };

}

