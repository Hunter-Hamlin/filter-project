PImage img;
float r, g, b;
void setup()
{ 
  img = loadImage("https://thehill.com/sites/default/files/mcconnellmitch_062618gn3_lead.jpg");
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
    pixels[i] =color(r+i, g, b);
  }
   if  (i % width > width/2)
  {
    r = red(pixels[i]);
    b = blue(pixels[i]);
    g = green(pixels[i]);
    pixels[i] =color(r, g+i, b);
  }
 }
 for (i = width*height/2; i < width*height; i++) 
 { 
  if  (i % width < width/2)
  {
    r = red(pixels[i]);
    b = blue(pixels[i]);
    g = green(pixels[i]);
    pixels[i] =color(r, g, b+(2*i));
  }
   if  (i % width > width/2)
  {
    r = red(pixels[i]);
    b = blue(pixels[i]);
    g = green(pixels[i]);
    pixels[i] =color(r, b+1000*i, g+1000*i);
  }
 }

  
 updatePixels();
  } 
}
