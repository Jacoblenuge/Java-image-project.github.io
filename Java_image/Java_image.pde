//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float topX, topY, topWidth, topHeight;
float bottomX, bottomY, bottomWidth, bottomHeight;
float picWidthAdjusted1=0.0, picHeightAdjusted1=0.0;
float picWidthAdjusted2=0.0, picHeightAdjusted2=0.0;
PImage pic1, pic2;
Boolean nightMode=false;
int tintDayMode=255, tintDayModeOpacity=50, tintRed=64, tintGreen=64, tintBlue=40, tintNightModeOpacity=85;
//
void setup()
{
  size(1200, 1000);
  appWidth = width;
  appHeight = height;
  //
  //Population
  pic1 = loadImage("../Images_used2/Portrait/data:image/jpeg;base64,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");
  pic2 = loadImage("../Images_used2/landscape/2wCEAAoHCBUVFBgVFRUZGRgaGhsbGxsbGxohGx0hGyEbGhoaHRsbIi0kGyEqHxobJjclKi4xNDQ0GyM6PzozPi0zNDEBCwsLEA8QHxISHTMqJCozMzMxMzUzMzMzNTMzPDMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzM");
  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  topX = appWidth * 1/4;
  topY = appHeight * 1/20;
  topWidth = appWidth * 1/2;
  topHeight = appHeight * 13/20;
  bottomX = appWidth *1/2;
  bottomY = appHeight * 3/4;
  bottomWidth = appWidth * 1/4;
  bottomHeight = appHeight * 4/20;
  //
  int picWidth1 = 200; 
  int picHeight1 = 252;
  int picWidth2 =  355;
  int picHeight2 = 142; 
  
  //
  float smallerDimension1, largerDimension1, imageWidthRatio1=0.0, imageHeightRatio1=0.0;
  float smallerDimension2, largerDimension2, imageWidthRatio2=0.0, imageHeightRatio2=0.0;
  
  if ( picWidth1 >= picHeight1 ) {
    largerDimension1 = picWidth1;
    smallerDimension1 = picHeight1;
    //
    picWidthAdjusted1 = backgroundImageWidth;
    imageHeightRatio1 = smallerDimension1 / largerDimension1;
    picHeightAdjusted1 = picWidthAdjusted1 * imageHeightRatio1;
    //
    if ( picHeightAdjusted1 > backgroundImageHeight ) {
    println(picHeightAdjusted1, backgroundImageHeight);
      println("STOP: image is too big for rectangle layout");
      exit();
    }
  } else {
    largerDimension1 = picHeight1;
    smallerDimension1 = picWidth1;
    //
    picHeightAdjusted1 = backgroundImageHeight;
    imageWidthRatio1 = smallerDimension1 / largerDimension1;
    picWidthAdjusted1 = picHeightAdjusted1 * imageWidthRatio1;
    if ( picWidthAdjusted1 > backgroundImageWidth ) {
      println("STOP: image is too big for rectangle layout");
      exit();
    }
  }
    if ( picWidth2 >= picHeight2 ) {
    largerDimension2 = picWidth2;
    smallerDimension2 = picHeight2;
    //
    picWidthAdjusted2 = topWidth;
    imageHeightRatio2 = smallerDimension2 / largerDimension2;
    picHeightAdjusted2 = picWidthAdjusted2 * imageHeightRatio2;
    //
    if ( picHeightAdjusted2 > topHeight ) {
      println("STOP: image is too big for rectangle layout");
      exit();
    }
  } else {
    largerDimension2 = picHeight2;
    smallerDimension2 = picWidth2;
    //
    picHeightAdjusted2 = topHeight;
    imageWidthRatio2 = smallerDimension2 / largerDimension2;
    picWidthAdjusted2 = picHeightAdjusted2 * imageWidthRatio2;
    if ( picWidthAdjusted2 > topWidth ) {
      println("STOP: image is too big for rectangle layout");
      exit();
    }
  }
  //
  rect( topX, topY, topWidth, topHeight );
  rect( bottomX, bottomY, bottomWidth, bottomHeight );
  //
  if ( nightMode == false ) tint(tintDayMode, tintDayModeOpacity); //Gray Scale, Day use: use 1/2 tint value for white (i.e. 128/256=1/2)
  if ( nightMode == true ) tint(tintRed, tintGreen, tintBlue, tintNightModeOpacity); //RGB: Night Mode
  image( pic1, backgroundImageX, backgroundImageY, picWidthAdjusted1, picHeightAdjusted1);
}//End setup
//
void draw()
{
  image(pic2, topX, topY, picWidthAdjusted2, picHeightAdjusted2);
}//End draw
//
void keyPressed() {
}//End keyPressed
//
void mousePressed() {
  //  
  if ( mouseButton == LEFT) {
    nightMode = true;
    rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
    tint(64, 64, 40, 85); //RGB: Night Mode
    image( pic1, backgroundImageX, backgroundImageY, picWidthAdjusted1, picHeightAdjusted1);
  }
  if ( mouseButton == RIGHT ) {
    nightMode = false;
    rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
    tint(255, 50);
    image(pic1, backgroundImageX, backgroundImageY, picWidthAdjusted1, picHeightAdjusted1);
  }
}//End mousePressed
//
//End Main Program
