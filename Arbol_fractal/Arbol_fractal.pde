float angle = radians(25); // Ángulo de inclinación de las ramas (en radianes)
float initialLength = 150; // Longitud inicial del tronco
PVector origin, endpoint;
int depth = 0; // Nivel de recursión actual

void setup() {
  size(600, 600);
  background(255);
  frameRate(0.8); // Puedes ajustar la velocidad de la animación cambiando este valor
  origin = new PVector(width / 2, height);
  endpoint = new PVector(width / 2, height - initialLength);
}

void draw() {
  if (depth < 15) { // Controla la profundidad de la recursión
    background(255);
    stroke(139, 69, 19); // Color marrón para el tronco
    strokeWeight(4); // Grosor de las ramas

    translate(width / 2, height);
    branch(initialLength, depth); // Llama a la función recursiva para dibujar el árbol
    
    depth++; // Avanza al siguiente nivel de recursión
  }
}

void branch(float len, int d) {
  line(0, 0, 0, -len); // Dibuja el tronco

  translate(0, -len); // Mueve el punto de origen al extremo superior del tronco

  if (d > 0) {
    pushMatrix(); // Guarda la transformación actual
    rotate(angle); // Rota hacia la derecha
    branch(len * 0.67, d - 1); // Llama recursivamente para la rama derecha
    popMatrix(); // Restaura la transformación anterior

    pushMatrix(); // Guarda la transformación actual
    rotate(-angle); // Rota hacia la izquierda
    branch(len * 0.67, d - 1); // Llama recursivamente para la rama izquierda
    popMatrix(); // Restaura la transformación anterior
  }
}
