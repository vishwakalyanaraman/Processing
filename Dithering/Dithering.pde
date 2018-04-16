PImage audrey;

void setup() {
  size(1024, 512);
  audrey = loadImage("audrey.jpg");
  audrey.filter(GRAY);
  image(audrey, 0, 0);
}

int index(int x, int y) {
  return x + y * audrey.width; // Finds the current pixel as a 1D array
}

void errColor(int x,int y,float errR,float errG,float errB,float part){
  int index = index(x,y);
  color c = audrey.pixels[index];
  
  float r = red(c);
  float g = green(c);
  float b = blue(c);
  
  r = r + errR * part;
  g = g + errG * part;
  b = b + errB * part;
  
  audrey.pixels[index] = color(r,g,b);
}


void draw(){
  audrey.loadPixels();
  for (int y = 0; y < audrey.height-1; y++){
    for (int x = 0; x < audrey.width-1; x++){
      color pix = audrey.pixels[index(x,y)];
      
      float oldR = red(pix);
      float oldG = green(pix);
      float oldB = blue(pix);
      
      int factor = 3; // Sets quantizing factor for newRGB
      
      //Limiting the newRGB values based on factor
      float newR = round(factor * oldR/255) * (255/factor);
      float newG = round(factor * oldG/255) * (255/factor);
      float newB = round(factor * oldB/255) * (255/factor);
      
      
      float errR = oldR - newR;
      float errG = oldG - newG;
      float errB = oldB - newB;
      
     //Main Algorithm for displacing errors
      
     //pixel[x + 1][y    ] := pixel[x + 1][y    ] + quant_error * 7 / 16
     //pixel[x - 1][y + 1] := pixel[x - 1][y + 1] + quant_error * 3 / 16
     //pixel[x    ][y + 1] := pixel[x    ][y + 1] + quant_error * 5 / 16
     //pixel[x + 1][y + 1] := pixel[x + 1][y + 1] + quant_error * 1 / 16
     
      errColor(x+1,y  ,errR,errG,errB,7/16.0);
      errColor(x-1,y+1,errR,errG,errB,5/16.0);
      errColor(x  ,y+1,errR,errG,errB,3/16.0);
      errColor(x+1,y+1,errR,errG,errB,1/16.0);
      
      audrey.pixels[index(x,y)] = color(newR, newG, newB);
    }
  }
   audrey.updatePixels();
   image(audrey, 512, 0);
}
