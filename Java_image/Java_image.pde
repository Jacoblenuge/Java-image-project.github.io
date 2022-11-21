//Global Variables
//Note proplem with secondary images fading away a couple seconds after program start
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float ImageX2, ImageY2, ImageWidth2, ImageHeight2;
float textX1, textY1, textX2, textY2;
float topX, topY, topWidth, topHeight,pic2topX, pic2topY, pic2topWidth,pic2topHeight;
float bottomX, bottomY, bottomWidth, bottomHeight,pic2bottomX, pic2bottomY, pic2bottomWidth, pic2bottomHeight;
float picWidthAdjusted1=0.0, picHeightAdjusted1=0.;
PImage pic1, pic2;
int  noWidth, noHeight;
Boolean nightMode=false;
PFont titleFont; 
color Red=#FF3F0A, resetDefaultInk=#FFFFFF; //Not night mode friendly
int tintDayMode=255, tintDayModeOpacity=50, tintRed=64, tintGreen=64, tintBlue=40, tintNightModeOpacity=85;
PFont font;
//
void setup()
{
  size(1200, 800);
  appWidth = width;
  appHeight = height;
  //
  //Population

  pic1 = loadImage("../Images Used/necron background.jpg");
  pic2 = loadImage("../Images Used/Newimages.jpg");
  
  
  
  //
//Text Setup, single executed code
//Font from OS (Operating System)
String[] fontList = PFont.list(); //To list all fonts available on OS
printArray(fontList); //For listing all possible fonts
titleFont = createFont("Vladimir Script",66); //Verify the font exists in Processing.JAVA
// Tools / Create Font / Find Font / Do not press "OK", known bug
//

 


  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  ImageWidth2 = appWidth * 9/20;
  ImageHeight2 = appHeight * 8/20;
  bottomX =pic2bottomX= appWidth * 11/20;
  bottomY =  pic2bottomY= appHeight * 0/20;
  bottomWidth = pic2bottomWidth= appWidth * 9/20;
  bottomHeight =pic2bottomHeight= appHeight * 8/20;
  topX = pic2topX= appWidth * 1/20;
  topY = pic2topY= appHeight * 4/6;
  topWidth = pic2topWidth= appWidth * 6/20;
  topHeight = pic2topHeight= appHeight * 6/20;
  textX1 = appWidth * 2/20;
  textY1 = appHeight * 13/20;
  textX2 = appWidth *13/20;
  textY2 = appHeight * 9/20;
  noWidth = 0;
  noHeight = 0;
  appWidth = width;
  appHeight = height;
  //

  int picWidth1 = 200 ;
  int picHeight1 = 252 ;
  //int picWidth2 = 355 ;
  //int picHeight2 = 142 ;
  //
  float smallerDimension1, largerDimension1, imageWidthRatio1=0.0, imageHeightRatio1=0.0;
  //float smallerDimension2, largerDimension2, imageWidthRatio2=0.0, imageHeightRatio2=0.0;

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
      println("STOP: image #1 width is too big for rectangle layout");
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
      println("STOP: image #1 height is too big for rectangle layout");
      exit();
    }
  }

 
  //
 rect( topX, topY, topWidth, topHeight);
 image(pic2,pic2topX, pic2topY, pic2topWidth,pic2topHeight);
  rect( bottomX, bottomY, bottomWidth, bottomHeight );
  image(pic2,pic2bottomX, pic2bottomY, pic2bottomWidth, pic2bottomHeight);
  //
  if ( nightMode == false ) tint(tintDayMode, tintDayModeOpacity); //Gray Scale, Day use: use 1/2 tint value for white (i.e. 128/256=1/2)
  if ( nightMode == true) tint(tintRed, tintGreen, tintBlue, tintNightModeOpacity); //RGB: Night Mode
  
}//End setup
//
void draw()
{
 
  
 fill(Red); //Ink
  
  text("Without Aspect Ratio", textX2, textY2);
  fill(0);
  textSize(30);
  fill(Red); //Ink
  text("With Aspect Ratio", textX1, textY1);
  image(pic1,noWidth,noHeight,appWidth,appHeight);
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
