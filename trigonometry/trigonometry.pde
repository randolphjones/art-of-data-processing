/*
Trigonometry is an important part of drawing generative patterns.
 Circular designs and patterns usually require some use of trigonometry.
 */

//These "Global" values are set for the entire sketch
//These include the speed of the orbit and the radius
//Variables that are set outside of these function are important for organization but can then be shared across multiple functions
float SPEED = .02;
float RAD = 250;

void setup() {
  size(768, 768);
  background(255);
}

void draw() {
  //Every time that draw is called the frameCount is always augmented by 1
  //This value is very useful for transforming and drawing over time.
  //Here if we augment the angle, we can use that to draw in a circle
  float angle = frameCount * SPEED;
  //Use the sine of this angle multiplied by the radius to get the X coordinate
  float x = width/2 + sin(angle) * RAD;
  //Use the cosine of that same angle multiplied by the radius to get the Y coordinate
  float y = height/2 + cos(angle) * RAD;
  //Now you can use these values to place a new ellipse on each frame
  ellipse(x, y, 25, 25);
}