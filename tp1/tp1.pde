PImage miImagen;

void setup(){
   size(800,400);
   miImagen = loadImage("mural1.jpg");
} 

void draw(){
  background(200);
   image(miImagen, 0, 0, 400, 400);
   textSize(30);
   text((  400 + mouseX) + " - " + mouseY, mouseX, mouseY);
   fill(237, 230, 230);//color pared mas chica
   rect(400, 98 , 30, 220);//pared mas chica
 
  fill(125, 210, 242);//color del cielo
  noStroke();
   beginShape();//forma del cielo
 vertex(400,0);
 vertex(800,0);
 vertex(800, 34);
 vertex(430, 18);
 vertex(430, 98);
 vertex(400, 98);
   endShape(CLOSE);
   fill(45, 62, 42);//color pared grande
   noStroke();
   beginShape();//forma pared grande
   vertex(430,325);
   vertex(800, 330);
   vertex(800, 22);
   vertex(430, 18);
   endShape(CLOSE);
   fill(151, 227, 140);//color del pasto
   noStroke();
   beginShape();//forma del pasto 
   vertex(400, 318);
   vertex(425, 318);
   vertex(800, 330);
   vertex(800, 400);
   vertex(400, 400);
   endShape(CLOSE);
   fill(247,242,247);//color circulo
   stroke(0);
   strokeWeight(3);
   ellipse(400 + 200,180,244, 247);//figura circulo grande
   fill(0,0,0);//color de la gorra
   beginShape();//forma de la gorra parte de atras
    vertex (480,158);
    vertex(480,194);
 vertex (428,194);
  vertex (428,180);
   endShape(CLOSE);
   
    fill(#BC0D30);//gorra forma y color 
  stroke(0);
  strokeWeight(3);
  arc(600, 150, 230, 230, PI, TWO_PI); // arco de 180° a 360°
  fill(0,0,0);
   beginShape();//forma del pelo(costo mucho)
   curveVertex(688,300);
   curveVertex(730,120);
   curveVertex(650,120);
   curveVertex(750,160);
   curveVertex(600,260);
   endShape(CLOSE);
   beginShape();
  vertex(670,100);
  vertex(650,120);
  vertex(743,100);
  
  endShape(CLOSE);

  stroke(0);//gorra
strokeWeight(3);
noFill();
curve(800,200,550,48,650,150,650,700);//linea de la gorra


}
