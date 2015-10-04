/*
  In Processing you may wish to read and visualize a CSV
 This is commonly called a table in Processing.
 While this example primarily deals with CSV, you can also read JSON data into processing.
 */

//Note, you must have the csv file in your sketch folder inside of a data folder

void setup() {
  size(1024, 512);
  background(255);
  
  //When a color is specified as two values, it's greyscale with an alpha channel
  fill(64, 200);
  noStroke();
  //Draw rectangles from the center
  rectMode(CENTER);
  
  //This loads in the table from our data folder.
  //Yes, it includes a header row
  Table table = loadTable("2012_or_baby_names_100.csv", "header");
  //Let's store the total number of rows so we can use it later
  int rowCount = table.getRowCount();
  //Let's loop over the rows and draw a rectangle for each
  for (int i = 0; i < rowCount; i++) {
    //Store the current row in a variable
    TableRow row = table.getRow(i);
    //Grab the frequency column and use that to determine the height of the rectangle
    float rectHeight = row.getInt("Frequency");
    //The map function allows us to scale one range of values to another
    float x = map(i, 0, rowCount, 10, width-10);
    //Draw the appropriately sized rectangle in the correct location
    rect(x, height/2, 4, rectHeight);
  }
}