/* Andrés Echayre
Comisión 3
Profe: David
Dni: 47008695
Legajo: 120301/9
*/






PImage img1, img2, img3;
float posX, posY;
int estado;
float opacidadTexto = 255;
PFont miFuente;
//variable para contar fps
int contador;
String texto1, texto2, texto3;

//1: pantalla 1
//2: transicion 1-2
//3: pantalla 2
//4: transicion 2-3
//5: pantalla 3




void setup() {
 
  size(640, 480);
 
 
  img1 = loadImage("data/Obra 1.jpg");
  img2 = loadImage("data/Obra 2.jpg");
  img3 = loadImage("data/Obra 3.jpg");

  texto1 = "Obra Número 1";
  texto2 = "Obra Número 2";
  texto3 = "Obra Número 3, Gracias x ver!";

  miFuente = loadFont("data/BradleyHandITC-58.vlw");
  //establece la fuente para los textos:
  textFont( miFuente );
  textAlign(LEFT);

  estado = 1;
  contador = 0;
  posX =20;
  posY =60;
}




void draw() {
  println("estado="+estado);
  background(0, 255, 0);
  if ( estado == 1 ) {
    image( img1, 0, 0, width, height);
    fill(0,0,255);
    textSize(60);
    text ( texto1, posX, posY, 600, 200);
    //cuento los fotogramas y veo si cambio:
    contador++;
    if ( contador>=260 ) {
      //este es un cambio de estado:
      //estado 1  a  2
      estado++;
      contador = 0;
    }
  }
  
  
  
  else if ( estado == 2 ) {
    image( img1, 0, 0, width, height);
    fill(0,0,255, opacidadTexto);
    textSize( map(opacidadTexto, 255, 0, 48, 0 ) );
    text ( texto1, posX, posY, 600, 200);
    opacidadTexto-=3;
    if (opacidadTexto<=0) {
      estado = 3;
      contador = 0;
      posX = 20;
      posY = 60;
      opacidadTexto = 255;
    }
  }
  
  else if ( estado == 3 ) {
    //pantalla 2
    image( img2, 0, 0, width, height);
    fill(0,0,255);
    textSize(48);
    text ( texto2, posX, posY, 600, 200);
    contador++;
    if ( contador>=260 ) {
      //estado 3  a  4
      estado++;
      contador = 0;
    }
  }
  
  else if ( estado == 4 ) {
    //transicion 2-3
    //transicion 1-2
    image( img2, 0, 0, width, height);
    fill(0,0,255);
    textSize(48);
    text ( texto2, posX, posY, 600, 200);

    posX+=5;
    if (posX>=width) {
      //cambio el estado:
      estado = 5;
      contador = 0;
      posX = 20;
      posY = 60;
    }
  } else if ( estado == 5 ) {
    image( img3, 0, 0, width, height);
    text ( texto3, 20, 100, 600, 200);
    //pantalla 3
    if ( mouseX>200 && mouseX<200+150
      && mouseY >300 && mouseY<300+80 ) {
      fill(0, 0, 255);
    } else {
      fill(200);
    }
    rect( 240, 320, 150, 80);
  } else {
    
  }
}
void mousePressed() {
  if ( estado==5) {
    //colision de mouseX,mouseY
    //con el rectangulo de 200,300 de
    //ancho 150 y alto 80
    if ( mouseX>240 && mouseX<240+170
      && mouseY >320 && mouseY<320+100 ) {
      estado = 1;
    }
  } else {
    estado++;
    contador = 0;
    posX = 20;
  }
}
