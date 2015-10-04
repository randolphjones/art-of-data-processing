/*
Working with images and pixel data.
 Sometimes you may want to reach pixel data from an image and reinterpret it with geometry.
 Other times, you may want to manipulate the existing pixel values
 */


void setup() {

  size(512, 512);
  strokeWeight(4);

  //To begin working with an image you need to load the image by its name and then store that image data into a variable.  
  PImage globe = loadImage("globe_image.jpg");
  //Use the image command to render your image. Supply the PImage as well as the X and Y coordinates.
  image(globe, 0, 0);

  //Now that the image is laid out, load the pixel values in
  loadPixels();

  //The pixels are now loaded into an array: pixels[]
  //Use a for loop to iterate over the pixels and transform them
  for (int i = 0; i < pixels.length; i++) {
    //We're going to use this expression to find and store the x coordinate of the pixel 
    int x = i % width;
    //Now we're going to use an if statement to find pixels that we can want to change the color of
    //If the x coordinate is between 200 and 300, only show the red channel
    if (x > 200 && x < 300) {
      //save that pixel's color value
      color current = pixels[i];
      //Now rewrite it's color value with red values only, giving a small boost when writing back to red
      pixels[i] = color(red(current) + 35, red(current), red(current));
    }
  }
  //Now that you've tinkered with the pixels, update the going screen with the new pixels
  updatePixels();

  //Pixel values are sometimes read from a base image and then rewritten as geometry
  //now pick 3 random spots on image and place circles there that are the same color
  for (int i = 0; i < 3; i++) {
    //This chooses a random pixel
    int randomIndex = int(random(pixels.length));
    //These expressions re-interpret the X and y values
    int x = randomIndex % width;
    int y = int(randomIndex / width);
    //This sets the color of the geometry from the pixels
    fill(pixels[randomIndex]);
    //Finally, draw the ellipse;
    ellipse(x, y, 75, 75);
  }
}