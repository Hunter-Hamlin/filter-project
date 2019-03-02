PImage img;
float r, g, b;
void setup()
{ 
  img = loadImage("");
  surface.setSize(img.width, img.height);
}

void draw()
{
  image(img, 0, 0);
  loadPixels();
  int pl = 0; // represents length of pixel array/index of pixel in the while loop
  color[] tempArray = new color[pixels.length];

  int i; // represents length of pixel array/index in the for loops
  
  while (pl < pixels.length)
  {
    tempArray[pl] = pixels[pl];
    pl++;
  }
  
 if (keyPressed) 
  {
    if(key == 'd') 
  
 for (i = 0; i < width*height/2; i++) // deals with upper half 
 { 
  if  (i % width < width/2) // flips first quarter to fourth quarter
  {
    pixels[i] = tempArray[i + width*height/2]; 
  }
   if  (i % width > width/2) // flips second quarter to third quarter
  {
    pixels[i] = tempArray[i + width*height/2];
  }
 }
 for (i = width*height/2; i < width*height; i++) 
 { 
  if  (i % width < width/2)
  {
    pixels[i] = (tempArray[i - width*height/2]);
  }
   if  (i % width > width/2)
  {
    pixels[i] = tempArray[i - width*height/2];  
  }
 }

  
 updatePixels();
  } 
}
