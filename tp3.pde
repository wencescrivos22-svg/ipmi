//TP3  Wenceslao Crivos Comision 3 David Bedoian Obra N6
//https://youtu.be/mkj770oHeq0
//Variables globales 
PImage ref; //imagen de referencia 
int cant = 8;   // cantidad de celdas 8
int tam;        // tamaño de las celdas 

color puntoCol = color(255);   // círculos blancos
color lineaCol = color(100);   // líneas grises

void setup() {
  size(800, 400);
  ref = loadImage("06.jpeg"); 
  tam = 400/cant; 
}

void draw() {
  background(0);

  image(ref, 0, 0, 400, 400); //imagen a la izquierda y a la derecha 
  translate(400, 0);
  dibujarGrilla(cant, tam); //funcion propia para dibujar 
}

//Interactividad con click cambia de color 
void mousePressed() {
  if (puntoCol == color(255)) {
    puntoCol = color(255, 0, 0);   // círculos rojos
    lineaCol = color(0, 0, 255);   // líneas azules
  } else {
    puntoCol = color(255);         // círculos blancos
    lineaCol = color(100);         // líneas grises
  }
}

// tecla R reinicia colores
void keyPressed() {
  if (key == 'r') {
    puntoCol = color(255);
    lineaCol = color(100);
  }
}

// función propia que NO retorna valor
void dibujarGrilla(int cant, int tam) {
  // líneas horizontales
  stroke(lineaCol); 
  strokeWeight(13); //grosor
  for (int y=0; y<=cant; y++) { //ciclo for anidado 
    line(0, y*tam, 400, y*tam); //linea tamano
  }

  // líneas verticales
  for (int x=0; x<=cant; x++) {
    line(x*tam, 0, x*tam, 400);
  }
 for (int x=0; x<=cant; x++) {
    for (int y=0; y<=cant; y++) 
 {
      float d = dist(mouseX, mouseY, x*tam, y*tam); // variable de distancia 
      float op = calcularOpacidad(d);               // variable opacidad 

      fill(puntoCol, op);
      noStroke();

      // centrales completos
      if (x>0 && x<cant && y>0 && y<cant) {
        ellipse(x*tam, y*tam, tam/2.5, tam/2.5);
      }

      // costados verticales
      if (x==0 || x==cant) {
        pushMatrix();
        translate(x*tam, y*tam);
        if (x==0) {
          ellipse(0, 0, tam/2.5, tam/2.5); // círculo completo
        } else {
          rotate(radians(45));             // rotate
          ellipse(0, 0, tam/2.5, tam/5);   // círculo cortado
        }
        popMatrix(); } }
}
}

// función propia que RETORNA un valor
float calcularOpacidad(float d) {
  return map(d, 0, width, 255, 50); 
}
