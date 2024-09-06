/*Street with light switch
1. Make swith(Remember switch is a reserved word)
2. light cone (intensity)
3. When light is turned on. Use frameCount to gradually increase light intensity
*/

int tiles;
int tileWidth;
boolean lightIsOn = false;


void setup()  {
  size(800, 800);
  
  tiles = 20;                                  //Number of tiles
  tileWidth = width/tiles;                     //Tiles width
  
}

void draw()  {
  building();
  
}

void building()  {
  
  background(128, 0, 15);
  
  //Street
  noStroke();
  fill(0);
  rectMode(CORNER);
  rect(0, height-tileWidth*5, width, height-tileWidth*5);
  fill(127);
  rect(0, height-tileWidth*7, width, tileWidth*2);
  strokeWeight(3);
  stroke(0);
  line(0, height-tileWidth*5.35, width, height-tileWidth*5.35);
  
  //Door
  fill(0);
  noStroke();
  rect(tileWidth*14, tileWidth*7, tileWidth*4, tileWidth*6, 50, 50, 0, 0);
  fill(28, 0, 0);
  rect(tileWidth*14.5, tileWidth*7.5, tileWidth*3, tileWidth*5.5, 75, 75, 0, 0);
  stroke(0);
  strokeWeight(5);
  line(tileWidth*14.75, tileWidth*10.5, tileWidth*15.25, tileWidth*10.5);
  
  //Lamp
  fill(20);
  noStroke();
  arc(tileWidth*11, tileWidth*5, tileWidth*2, tileWidth*2, PI, PI*2, OPEN);
  
  //Light
  if (lightIsOn == true)  {
    fill(255, 220, 15, 50);
    quad(tileWidth*10, tileWidth*5, tileWidth*6, tileWidth*13, tileWidth*16, tileWidth*13, tileWidth*12, tileWidth*5);
    rect(tileWidth*6, tileWidth*13, tileWidth*10, tileWidth*1.65);
  }
  
  //Switch (Start simple(Square) and change later)
  fill(0);
  noStroke();
  rectMode(CENTER);
  rect(tileWidth*12.5, tileWidth*10.5, tileWidth/2, tileWidth/2, 5);
  fill(255, 0, 0);
  circle(tileWidth*12.5, tileWidth*10.5, tileWidth/3);
  
  grid();
}

void grid()  {
  stroke(1);
  strokeWeight(1);
  for (int i = 0; tileWidth < width; i++)  {
    line(tileWidth, 0, tileWidth, height);
    line(0, tileWidth, width, tileWidth);
    tileWidth += 40;
  }
  
  //Had to set tileWidth to 0 after adding up in the for loop
  tileWidth = width/tiles;
}

void mouseClicked()  {
  if (mouseX < tileWidth*12.75 && mouseX > tileWidth*12.25 && mouseY < tileWidth*10.75 && mouseY > tileWidth*10.25) {      
    lightIsOn = !lightIsOn;
  }
  if ( lightIsOn == true)  {
      println("Light is on");
    }
    else{
      println("Light is off");
    }
}
