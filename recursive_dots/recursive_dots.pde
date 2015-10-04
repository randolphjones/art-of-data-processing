/*  //<>// //<>// //<>// //<>//
In this sketch we create a rather complex looking form from something very basic dots.
Simple forms iterated en masse can give the illusion of complexity.
An algorithm like this can be used to create a custom drawing brush or component.
*/

//diameter of the base form
float MASS = 50;
//how many levels of depth for the while form?
int DEPTH = 4;
//how many dots per branch?
int BRANCHES = 3;
//how much is size reduced between branches?
float REDUCTION = .65;
//how widespread are our dots?
float diffusion = 1.6;

//these two colors can be offsets
//colors can be expressed as RGB values i.e. color(100, 35, 128)
//a single value will paint a shade of grey
color COLOR1 = color(255);
color COLOR2 = color(32);
//this can be used to adjust the background color
color BGCOLOR = color(255);

//this block of code only runs once and set the project up
void setup() {
  //set the canvas size
  size(768, 768);
  //set the initial background color
  background(BGCOLOR);
  //global setting so circles are drawn from the center
  ellipseMode(CENTER);
  //global setting do that we draw forms without strokes
  noStroke();
}

//this block of code runs on every frame
void draw() {
  //the block of code here only runs when the mouse button is down
  if (mousePressed) {
    //here we call out to a more complex function that's defined below
    //we give it four values
    renderUnit(mouseX, mouseY, MASS, DEPTH);
  }
}

//this is where we can set keyboard controls while we draw
void keyPressed() {
  //spacebar clears the canvas
  if (key == ' ') {
    background(BGCOLOR);
  }
  //pressing the up and down errors makes the next form more or less diffuse
  if (keyCode == UP) {
    diffusion+=.05;
    println("diffusion is now " + diffusion);
  }
  if (keyCode == DOWN) {
    diffusion-=.05;
    println("diffusion is now " + diffusion);
  }
}

//this is where most of the logic happens
//this turns four values into a recusive dot cloud
void renderUnit(float x, float y, float diameter, int level) {
  
  //let's set the drawing color first
  //if the level we're on is odd then let's pick one color, if it's even pick another
  if (isOdd(level)) {
    fill(COLOR1);
  } else {
    fill(COLOR2);
  }
  
  //this actually draws a dot for us
  ellipse(x, y, diameter, diameter);

  //this is where the magic happens
  //we check to see if this is the lowest level.
  //...and if it isn't then we keep branching the form but we do it with changed values
  //This is called recursion. It means that this function calls itself over and over again.
  if (level > 0) {
    for (int i = 0; i < BRANCHES; i++) {
      //we rely on a random angle to spread our dots out
      float randomAngle = random(TWO_PI);
      renderUnit(x + sin(randomAngle) * diameter/2 * diffusion, y + cos(randomAngle) * diameter/2 * diffusion, diameter * REDUCTION, level-=1);
    }
  }
}

//this is a small utility function that determines if a number is even or odd
boolean isOdd(int value) {
  return (value % 2) > 0;
}