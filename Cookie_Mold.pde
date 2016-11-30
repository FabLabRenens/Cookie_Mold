// by Les Hall - started Fri Jul 4 2014
// ---
// FabLab Chene20 par RT Mars 2016


int d = 1;  // pixels averaged in a square, set to 1 for no decimation
float largeur = 100 ;
float hauteur = 100 ;
float ep_dale=10;
float depth = 20; // (mm)  
String filename = "visage_gray.png";     // input image file
String filescad = "visage.scad";    // output src openscad

PImage img;
String lines[] = {"module dale() { \n "};


void setup() {
  size(512, 256, P3D);
lines = append(lines, "cube([" + largeur + "," + hauteur +"," + ep_dale +"]);");
  img = loadImage(filename);
  img.loadPixels();
  
  for (int i=0; i<=img.height; i+=d)
  {
    for (int j=0; j<img.width; j+=d)
    {
      float b = 0;
      for (int ii=0; ii<d; ++ii)
        for (int jj=0; jj<d; ++jj)
          b += brightness(img.get(j+jj, i+ii));
          b /= d*d*25;
  

      float x= j * largeur/img.width ;
      float y= i * hauteur/img.height ;
      float z = b ;
      if(b>0) {
      
      lines = append(lines, "translate([" + x + ","+ y + "," + ep_dale + "]) cube([1.5,1.5," + z +"]);");
    }
     
    }
  }
  // End Append
 	
  
   lines = append(lines, "\n}");
  
   lines = append(lines, "dale();");
  
 
  
  
  // save and exit
  saveStrings(filescad, lines);
  exit();
}

void draw()
{
  image(img, 0, 0);
}