/**   DM Filter Project Starter Code
/*    v3.5
/*    Original code by: Bradley Beth
/*    Update by: Erik Dillaman, January 2016
**/

// changelog:
// 3.1  added e*Pressed switches and noLoop(); 
// 3.2  added img.resize() to line 132, for students with more advanced filters
// 3.25  possible fix for the double-click bug
// 3.5  double-click bug squashed  [Shout out to Mr. Purdy for the squashing!]

boolean PicLoaded = false;
boolean Grayscale = false;
boolean Effect1 = false;
boolean Effect2 = false;
boolean Effect3 = false;
boolean gPressed = false;
boolean e1Pressed = false;
boolean e2Pressed = false;
boolean e3Pressed = false;
int picWidth = 0;
int picHeight = 0;
PImage img, resetImg;

/***********************************/

void setup() 
{
  noLoop();
  size(592,578);
  PImage bg = loadImage("bg.JPG");
  background(bg); 
  textAlign(LEFT);
  textSize(16);
}

void draw()
{

  //background(185);
  fill(0);
  //rect(0, 0, 649, 480);
  noStroke();
  int picStart = 0;
  int picEnd = 0;


  /* draw buttons */

  stroke(0);
  fill(0);
  textSize(16);
  text("File Operations -", 6, 38);
  line(650, 0, 650, 480);
  noStroke();

  fill(0);
  text("Load Picture", 215, 38);

  fill(0);
  text("Save Picture", 315, 38);

  stroke(0);
  line(650, 150, 800, 150);
  noStroke();

  stroke(0);
  fill(0);
  textSize(16);
  text("Filter Effects", 265, 517);
  line(650, 0, 650, 480);
  noStroke();

  if (Grayscale)
    fill(#FFFF7D);    //Effect on means a yellow lighted button
  else
    fill(255);
  rect(660, 200, 130, 40, 10);
  fill(55);
  text("Grayscale", 680, 225);

  if (Effect1)
    fill(#FFFF7D);    //Effect on means a yellow lighted button
  else
    fill(255);
  rect(660, 250, 130, 40, 10);
  fill(55);
  text("Effect One", 400, 540);

  if (Effect2)
    fill (#FFFF7D);     //Effect on means a yellow lighted button 
  else
    fill(255); 
  rect(660, 300, 130, 40, 10);
  fill(55);
  text("Effect Two", 680, 325);

  if (Effect3)
    fill (#FFFF7D);    //Effect on means a yellow lighted button
  else
    fill(255);   
  rect(660, 350, 130, 40, 10);
  fill(55);
  text("Effect Three", 680, 375);

  fill(185, 0, 203);
  rect(693, 400, 65, 40, 10);
  fill(255);
  text("Reset", 703, 425);

  noStroke();
  textSize(16);

  //The following loads and displays an image file.
  //The image is resized to best fit in a 640x480 frame.
  if (PicLoaded)
  {     
    picWidth = img.width;
    picHeight = img.height;

    if (picWidth > 490)
    {
      picHeight = (int)(picHeight*(490.0/picWidth));
      picWidth = 490;
    }
    if (picHeight > 420)
    {
      picWidth = (int)(picWidth*(420.0/picHeight));
      picHeight = 420;
    }
    img.resize(picWidth, picHeight);
    //  (640-picWidth)/2, (480-picHeight)/2    to CENTER
    picStart = 0;
    picEnd = picStart+img.width*img.height;


    /***** Effects Code *****/
    /* This sample grayscale code may serve as an example */
    if (Grayscale && !gPressed)
    {
      img.loadPixels();
      int i = picStart;
      while (i < picEnd) 
      {
        color c = img.pixels[i];
        float gray = (red(c)+green(c)+blue(c))/3.0;  //average the RGB colors
        img.pixels[i] = color(gray, gray, gray);
        i = i + 1;
      }
      gPressed = true;
    }

    if (Effect1 && !e1Pressed)
    {
      //**  Your first filter effect code goes here  **//
      
      e1Pressed = true;
    }

    if (Effect2 && !e2Pressed)
    {
      //**  Your second filter effect code goes here  **//

      e2Pressed = true;
    }

    if (Effect3 && !e3Pressed)
    {
      //**  Your third filter effect code goes here  **//

      e3Pressed = true;
    }

    img.updatePixels(); 
    redraw();
  }
  
  if (img != null) image(img, (640-picWidth)/2, (480-picHeight)/2, picWidth, picHeight);
  fill(255);
  noStroke();
}

void mouseClicked() {
  println(mouseX + " " + mouseY);
  redraw();
}

void mousePressed()
{
  //The following define the clickable bounding boxes for any buttons used.
  //Note that these boundaries should match those drawn in the draw() function.

  if (mouseX>212 && mouseX<300 && mouseY>24 && mouseY<40)
  {
    selectInput("Select a file to process:", "infileSelected");
  }

  if (mouseX>314 && mouseX<405 && mouseY>24 && mouseY<40)
  {
    selectOutput("Select a file to write to:", "outfileSelected");
  }

  if (mouseX>0 && mouseX<0 && mouseY>0 && mouseY<0 && PicLoaded)
  {
    Grayscale = true;
    redraw();
  }   

  if (mouseX>660 && mouseX<790 && mouseY>250 && mouseY<290 && PicLoaded)
  {
    Effect1 = true;
    redraw();
  } 

  if (mouseX>660 && mouseX<790 && mouseY>300 && mouseY<340 && PicLoaded)
  {
    Effect2 = true;
    redraw();
  }  

  if (mouseX>660 && mouseX<790 && mouseY>350 && mouseY<390 && PicLoaded)
  {
    Effect3 = true;
    redraw();
  }

  if (mouseX>693 && mouseX<758 && mouseY>400 && mouseY<440 && PicLoaded)
  {
    resetTheImage();
    redraw();
  }


}

void resetTheImage()
{
  Grayscale = false;
  Effect1 = false;
  Effect2 = false;
  Effect3 = false;
  gPressed = false;
  e1Pressed = false;
  e2Pressed = false;
  e3Pressed = false;
  if (PicLoaded) img = resetImg.get();
}

void infileSelected(File selection) 
{
  if (selection == null) 
  {
    println("IMAGE NOT LOADED: Window was closed or the user hit cancel.");
  } else 
  {
    resetTheImage();    
    println("IMAGE LOADED: User selected " + selection.getAbsolutePath());
    img = loadImage(selection.getAbsolutePath());
    resetImg = loadImage(selection.getAbsolutePath());
    PicLoaded = true;
    redraw();
  }
}

void outfileSelected(File selection) 
{
  if (selection == null) 
  {
    println("IMAGE NOT SAVED: Window was closed or the user hit cancel.");
  } else 
  {
    println("IMAGE SAVED: User selected " + selection.getAbsolutePath());
    //    updatePixels();
    //    redraw();
    img.save(selection.getAbsolutePath());
    redraw();
  }
}
