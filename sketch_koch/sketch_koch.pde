

ArrayList<KochLine> lines;
 
void setup() {
  size(800, 600);
  background(255);
  

  lines = new ArrayList<KochLine>();
  PVector start = new PVector(0, 400);
  PVector end   = new PVector(width, 400);
  lines.add(new KochLine(start, end));
 

  //Arbitrarily apply the Koch rules five times.

  for (int i = 0; i < 8; i++) {
    generate();
  }

  
}

void draw() {
  
  for (KochLine l : lines) {
    l.display();
  }
  
}


void generate() {
  ArrayList next = new ArrayList<KochLine>();
  for (KochLine l : lines) {
 

    //The KochLine object has five functions, each of which return a PVector according to the Koch rules.

    PVector a = l.kochA();
    PVector b = l.kochB();
    PVector c = l.kochC();
    PVector d = l.kochD();
    PVector e = l.kochE();

 
    next.add(new KochLine(a, b));
    next.add(new KochLine(b, c));
    next.add(new KochLine(c, d));
    next.add(new KochLine(d, e));
  }
 
  lines = next;
}
