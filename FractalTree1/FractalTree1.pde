float theta;
float alpha;
float xoff = 0.0;

void setup() {
  size(300, 200);
}

void draw() {
 
  background(255);
  
   xoff = xoff + .01;
  float n = noise(xoff) * width;
  
  stroke(0);
  line(n, 0, n, height);
   
  
  // Pick an angle according to
  // the mouse location.
  theta = map(mouseX,0,width,0,PI/2);
  theta += map(n,0,1,0,PI/6) / 1000;

  // The first branch starts at the
  // bottom of the window.
  translate(width/2, height);
  stroke(0);
  branch(60);
  
  
}

void branch(float len) {
 
  int thikness = round(len/10 +1); 
  //println("len:" + len);
  //println("thikness:" + thikness);  
  strokeWeight(thikness);
  line(0, 0, 0, -len);
  translate(0, -len);
 

  //Each branch’s length shrinks by two-thirds.

  len *= 0.66;
 
  if (len > 2) {
    pushMatrix();
    rotate(theta);

    //Subsequent calls to branch() include the length argument.

    branch(len);
    popMatrix();
 
    pushMatrix();
    rotate(-theta);
    branch(len);
    popMatrix();
  }
}
