/*
  Think of Processing as a set of instructions you give the computer in sequence that you would like for it to draw.

  Drawing shapes is one basic component of working with processing.
  Tweak some of the values below so you can get a feel for what each setting does. 
  Many complex designs you see are actually built from a few basic components.
  
*/


//The setup function is run once when your processing sketch starts.
//This function can be used to create static images.
void setup() {
  //Use the size function to set the size of the canvas in pixels
  size(768, 768);
  
  //Uou can create an ellipse by specifying an x, y, width, and height
  ellipse(100, 100, 90, 45);
  
  //You can draw a rectangle with those same 4 coordinate but a different function name
  rect(200, 75, 90, 45);
  
  //Straight lines are created by providing x and y coordinates for two connected points
  line(75, 300, 300, 300);
  
  //Other geometry is available as well.
  //Check out the Reference at processing.org for lots of fun options
  arc(150, 180, 100, 100, 0, HALF_PI);
  triangle(150, 320, 200, 320, 175, 400);
  
}