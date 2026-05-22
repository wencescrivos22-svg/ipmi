//Wenceslao Crivos Tp2 Comision 3 Profesor:David Bedoian


int estado;        // En qué pantalla estoy
int contador= 0;     // contador
PImage[] imagenes; 
String[] textos;   
PFont miLetra;   //declarar la fuente que voy a usar

boolean mouseSobreRectangulo(float cx, float cy, float w, float h) {       //declaracion del boton de comenzar 
  return mouseX > cx - w/2 && mouseX < cx + w/2 &&   mouseY > cy - h/2 && mouseY < cy + h/2;
}



void inicializar() { //funcion para arrancar en la pantalla de inicio 
  estado = 0; 
  contador = 0;
}

void setup() {
  size(640,480);
  inicializar();
  //declaro mi fuente en el setup para que se vea en todas las pantallas 
miLetra = loadFont("BodoniMT-BoldItalic-40.vlw");
textFont (miLetra);

  // declaracion de imagenes para la presentacion
  imagenes = new PImage[5];
  imagenes[0] = loadImage("beatleslogo.jpg");
  imagenes[1] = loadImage("inicios.jpg");
  imagenes[2] = loadImage("album.jpg");
  imagenes[3] = loadImage("ultimoconcierto.jpg");
  imagenes[4] = loadImage("beatles1.jpg");

  // declaracion de textos para la presentacion
  textos = new String[5]; // reservamos espacio para 5 frases
  textos[0] = "La banda que revolucionó la música";
  textos[1] = "John, Paul, George y Ringo";
  textos[2] = "Innovación y psicodelia en los 60s";
  textos[3] = "Última presentación en vivo, 1969";
  textos[4] = "Un legado eterno,muchas gracias beatles por existir";

  textAlign(CENTER, CENTER);
}


//definicion de los estados

void draw() {
  if (estado == 0) {
    dibujaPantallaInicio();   // pantalla de inicio
  } else if (estado == 1) {
    dibujaPantallaUno();      // pantalla 1
  } else if (estado == 2) {
    dibujaPantallaDos();      // pantalla 2
  } else if (estado == 3) {
    dibujaPantallaTres();     // pantalla 3
  } else if (estado == 4) {
    dibujaPantallaCuatro();   // pantalla final
  } 
  }


//Pantalla de Inicio
void dibujaPantallaInicio() {
  background(20, 30, 80);

  fill(255,255,255);//color blanco
  textSize(40);//tamaño texto
  textAlign(CENTER, CENTER);
  textFont (miLetra);
  //text(textos[0], width/2, 60);//texto 0 que elegimos al principio
  //luego de aplicarle mi letra no me entra el texto en el ancho de la pantalla asi que lo voy a dividir 
  text("La banda", width/2,60);
  text("Que revoluciono la musica", width/2,95);
  image(imagenes[0], width/2 - 250, height/4, 500, 250);//imagen del logo centrada
  
  fill(200, 0, 0);//color boton
  rectMode(CENTER);//centrado
  rect(width/2, height - 60, 200, 100);//posicion del boton 

  fill(255);//color texto boton 
  textSize(36);//tamaño del texto 
  text("Comenzar", width/2, height - 60);//texto dentro del boton 
}
//declaracion de los botones de inicio y fin 
void mousePressed() {
  if (estado == 0) {
    // botón Comenzar
    if (mouseSobreRectangulo(width/2, height - 60, 200, 100)) {
      estado = 1;   // pasa a la Pantalla 1
      contador = 0; // reiniciamos el contador
    }
  } else if (estado == 4) {
    // botón Fin
    if (mouseSobreRectangulo(width - 120, height - 20, 200, 50)) {
      inicializar(); // vuelve al estado 0 pantalla inicial
    }
  }
}



void dibujaPantallaUno() {
  background(#D6005D); //color rosa de fomdo
  image(imagenes[1], 0, 0, width - 260, height);  //imagen beatles jovenes 

 
  float desplazamiento = contador; // movimiento del texto

  fill(0); // negro
  textAlign(LEFT, CENTER); //alineacion del texto 
  textSize(40); // más grande

  text("John Paul", width - 260 , -60 + desplazamiento);//arriba bajando 
  text("George Ringo", width - 260, -10 + desplazamiento);//mas abajo tambien bajando 
  contador = contador + 2; // velocidad del movimiento

  // pasar a la otra pantalla automaticamente 
  if (contador > 600) { // tiempo para que pase 
    estado = 2;
    contador = 0;
  }
}



void dibujaPantallaDos() {
  background (#DCFF00); //fondo amarillo
  image(imagenes[2], 0, 0, width, height - 100); //imagen del album st pepper

  float desplazamiento = contador; //desplazamiento con el contador

  fill(0); // texto negro
  textAlign(LEFT, CENTER); 
  textSize(32);
 text(textos[2], 0 + desplazamiento, height - 60); //posicion del texto en la parte inferior 

  contador = contador + 2; // velocidad del movimiento

  // pasar a la otra pantalla automaticamnete 
  if (contador > 650) { //600 frames 
    estado = 3; //pasa a imagen 3
    contador = 0; //el contador vuelve a 0 
  }
}



void dibujaPantallaTres() {
  image(imagenes[3], 0, 0, width, height); //imagen ultima presentacion en vivo 

  float desplazamiento = contador; //movimiento usando el contador 

  fill(0); // texto negro
  textAlign(LEFT, CENTER);
  textSize(40);
  text(textos[3], -250 + desplazamiento, height - 30); //texto moviendose a la derecha 

  contador = contador + 2; // velocidad del movimiento en cada frame 

  // pasar a la siguiente pantalla 
  if (contador > 900) { //despues de 900 frames
    estado = 4; //pasa a la imagen 4  
    contador = 0; //contador vuelve a 0 
  }
}

  
  

void dibujaPantallaCuatro() {
  image(imagenes[4], 0, 0, width, height); //imagen abbey road 
 
  float desplazamiento = contador; //desplazamiento usando el contador 

  fill(255,255,255); // texto blanco
  textAlign(CENTER, CENTER);
  textSize(36);
  //separe el texto para que entre en la pantalla 
 text("Un legado eterno de la música", width/2, -50 + desplazamiento );
 text("que marcó generaciones", width/2, -10 + desplazamiento );
  contador = contador + 1; //aumento de contador por frame 

  //boton
  fill(200, 0, 0); // color del botón
  rectMode(CENTER); // centrado
  rect(width - 120, height - 20, 200, 50); // posición del botón

  fill(255); // color del texto del botón
  textSize(36); // tamaño del texto
  text("Fin",width - 120, height - 20); // texto dentro del botón
}
