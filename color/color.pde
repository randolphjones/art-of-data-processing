/*
 Manipulating fill color, stroke, and background are key to building form in Processing.
 */

void setup() {
  size(768, 768);

  //The colorMode defaults to RGB so this is typically how you specify colors for things such as fills and background
  //RGB colors are specified as three values 0-255

  background(214, 35, 78);

  //You usually set the fill color for a shape right before it's draw however you can set a single fill color and draw several shapes.
  fill(180, 190, 12);

  rectMode(CENTER);
  rect(width/2, height/2, 400, 400);

  //You may want to store a color (or several) inside of a variable to be used later
  color orangish = color(225, 75, 6);
  fill(orangish);
  rect(width/2, height/2, 300, 300);

  //You may want to manipulate the stroke weight and color
  strokeWeight(4);
  stroke(45, 78, 212);
  //Note: A single value for a color represents a greyscale color
  fill(128);
  rect(width/2, height/2, 250, 250);

  //...or you may want to remove the stroke completely
  noStroke();
  fill(orangish);
  rect(width/2, height/2, 175, 175);

  //Finally, you can choose a different color mode. 
  //A different color mode can be used to specify a color in a different way. 
  //My personal favorite is HSB: Hue Saturation Brightness. It's a much more intuitive way to specify color.
  colorMode(HSB, 360);
  fill(214, 300, 180);
  rect(width/2, height/2, 50, 50);
}