
ArrayList<Integer> recordIntervals = new ArrayList<Integer>();
ArrayList<Integer> intervals = new ArrayList<Integer>();
boolean recording = true;
boolean activated = false;
int t = 0;
int maxT = 60;
float maxDiff = 5;

void setup() {
  size(600,600);  
}

void draw() {
  background(152, 172, 236);
  if (activated) {t++;}
  if (t > maxT) {
    t = 0; 
    activated = false; 
    
    print("\nCODE:" +recordIntervals +"\nENTERED:" +intervals);
    if (!recording) {
      if (compareSequence(recordIntervals, intervals) == 1) {
        background(0,255,0);
      } else {
        background(255,0,0);
      }
    } else {
      background(0,0,255); 
      recording = false;
    }
    
    
    
    intervals.clear();
    
  }
}

void mouseClicked() {
  background(105, 135, 233);
  activated = true;
  if (recording) {
    addKnock();
  } else {
    tryKnock();
  }
  t = 0;
}

void keyPressed() {
  if (key == ' ') {
    if (recording) {recording = false;}
    else {recording = true;}
  }
}

void addKnock() {
  recordIntervals.add(t);
}

void tryKnock() {
  intervals.add(t);
}


int compareSequence(ArrayList<Integer> c, ArrayList<Integer> r) {
  float avgDiff = 0;
  if (c.size() != r.size()) {return 0;}
  else {
    for (int i = 0; i < c.size(); i++) {
      avgDiff += abs(r.get(i) - c.get(i));
    }
    if (avgDiff / r.size() < maxDiff) {return 1;}
    return 0;
  }
}
