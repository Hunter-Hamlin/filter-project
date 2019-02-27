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
  int i;
  
 if (keyPressed) 
  {
    if(key == 'd') 
  
 for (i = 0; i < width*height/2; i++) 
 { 
  if  (i % width < width/2)
  {
    r = red(pixels[i]);
    b = blue(pixels[i]);
    g = green(pixels[i]);
    pixels[i] =color(r+(.00001*i), g/i, b);
  }
   if  (i % width > width/2)
  {
    r = red(pixels[i]);
    b = blue(pixels[i]);
    g = green(pixels[i]);
    pixels[i] =color(r, g/i, b+i);
  }
 }
 for (i = width*height/2; i < width*height; i++) 
 { 
  if  (i % width < width/2)
  {
    r = red(pixels[i]);
    b = blue(pixels[i]);
    g = green(pixels[i]);
    pixels[i] =color(r/i, g-i, b);
  }
   if  (i % width > width/2)
  {
    r = red(pixels[i]);
    b = blue(pixels[i]);
    g = green(pixels[i]);
    pixels[i] =color(r, b, g);
  }
 }

  
 updatePixels();
  } 
}
