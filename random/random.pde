/*
Random values are sometimes good for adding visual interest to your work.
 Other times you may want to have your form determined by a dataset or some combination of both.
 */

void setup() {
  size(768, 768);
}

//The draw function executes so many times per second
void draw() {

  //If we want to give the illusion of a single entity changing then we actually need to redraw the background on each frame.
  background(255);

  fill(64);
  noStroke();

  //Random numbers can be generated and stored inside of variables
  //A random number can be derived from a minimum and maximum
  float randomX = random(0, width/2);
  //When you give a random function a single value it assumes you want a value between 0 and the number
  float randomY = random(height);
  ellipse(randomX, randomY, 25, 25);

  //Noise is another type of random value. It's not so.... random... 
  //Actually noise is a random fluctuation of an existing value and sometimes it's what you're looking to use.
  //...it does require a little bit more work to use it though
  //The noise function only takes a point in time. It can then be multiplied or added to other values.
  //Here we'll set some initial variables for scale and range and use them below.
  //Tweak these and see what kind of impact it has.
  //What other attributes can you apply these variables to?
  float noiseScale = .01;
  float noiseRangeX = width/2;
  float noiseRangeY = height;
  noiseSeed(0);
  float noiseX = noise(frameCount * noiseScale) * noiseRangeX + width/2;
  //The seed value for the noise is how you can make it more distinct
  noiseSeed(1);
  float noiseY = noise(frameCount * noiseScale) * height;
  ellipse(noiseX, noiseY, 25, 25);

  //What happens when you deleter or comment the background command?
}