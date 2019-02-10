float angle = 2 * PI;
float offset = 20;

boolean simpleGraphs = true;
boolean extendedGraphs = true;
boolean sin = true;
boolean cos = true;
boolean tan = true;
boolean sec = true;
boolean csc = true;
boolean cot = true;

static final int WIDTH = 1000;
static final int HEIGHT = WIDTH;

static final int r = WIDTH / 4;

ArrayList< PVector > sinGraph = new ArrayList< PVector >();
ArrayList< PVector > cosGraph = new ArrayList< PVector >();
ArrayList< PVector > tanGraph = new ArrayList< PVector >();
ArrayList< PVector > secGraph = new ArrayList< PVector >();
ArrayList< PVector > cscGraph = new ArrayList< PVector >();
ArrayList< PVector > cotGraph = new ArrayList< PVector >();

void setup(){

  PImage icon = loadImage("res/icon/icon.png");
  surface.setIcon(icon);
  surface.setTitle("A visualization of sin, cos and tan by D3PSI");
  size(1000, 1000);

}

void draw(){

  background(0);
  stroke(255);
  strokeWeight(3);
  ellipse(WIDTH / 2, HEIGHT / 2, WIDTH / 2, HEIGHT / 2);    // Circle
  strokeWeight(1);
  line(0, HEIGHT / 2, WIDTH, HEIGHT / 2);                   // Y-Axis
  line(WIDTH / 2, 0, WIDTH / 2, HEIGHT);                    // X-Axis
  stroke(23, 166, 255);
  strokeWeight(20);
  fill(255);
  ellipse(WIDTH / 2 + r * cos(angle), HEIGHT / 2 + r * sin(angle), 10, 10);    // Point on circle
  stroke(255);
  strokeWeight(3);
  stroke(255, 0, 0);
  line(WIDTH / 2 + r * cos(angle), HEIGHT / 2, WIDTH / 2, HEIGHT / 2);      // Cosine
  stroke(0, 255, 0);
  line(WIDTH / 2, HEIGHT / 2 + r * sin(angle), WIDTH / 2, HEIGHT / 2);      // Sine
  strokeWeight(10);
  stroke(23, 166, 255);
  line(WIDTH / 2, HEIGHT / 2, (WIDTH / 2) + r * cos(angle), (HEIGHT / 2) + r * sin(angle));    // line from (0, 0) to moving point on circle
  strokeWeight(1);
  stroke(255);
  line((WIDTH / 2) * 1, ((HEIGHT / 2) + r * (1 / sin(angle))) * 1, ((WIDTH / 2) + r * (1 / cos(angle))) * 1, (HEIGHT / 2) * 1);    // Tangent to circle on point
  stroke(200, 100, 50);
  strokeWeight(3);
  if(sin(angle) < 0) {    // Cotangent
  
    line(WIDTH / 2, HEIGHT / 2 - r, WIDTH / 2 - r * 1 / tan(angle), HEIGHT / 2 - r);
    
  } else if(sin(angle) > 0 ) {
  
    line(WIDTH / 2, HEIGHT / 2 + r, WIDTH / 2 + r * 1 / tan(angle), HEIGHT / 2 + r);
  
  }
  stroke(0, 0, 255);
  strokeWeight(3);
    
  if(cos(angle) > 0) {        // Tangent
      
    line((WIDTH / 2) + r, HEIGHT / 2, (WIDTH / 2) + r, (HEIGHT / 2) + r * tan(angle));
      
  } else if (cos(angle) < 0){
    
    line((WIDTH / 2) - r, HEIGHT / 2, (WIDTH / 2) - r, (HEIGHT / 2) - r * tan(angle));
      
  }
  
  stroke(121, 121, 212);
  strokeWeight(3);
  
  line(WIDTH / 2 + r * cos(angle), HEIGHT / 2, WIDTH / 2 + r * 1 / cos(angle), HEIGHT / 2);    // Secant  
  stroke(212, 121, 121);
  line(WIDTH / 2, HEIGHT / 2 + r * sin(angle), WIDTH / 2, HEIGHT / 2 + r * 1 / sin(angle));    // Cosecant
  
  strokeWeight(1);
  stroke(255);
  
  line(WIDTH / 2, (HEIGHT / 2) + r * sin(angle), (WIDTH / 2) + r * cos(angle), (HEIGHT / 2) + r * sin(angle));
  line(WIDTH / 2 + r * cos(angle), HEIGHT / 2, (WIDTH / 2) + r * cos(angle), (HEIGHT / 2) + r * sin(angle));
  
  if(abs((1 / tan(angle))) - abs(tan(angle)) < 0) {
  
    if(cos(angle) > 0) {
      
      line(WIDTH / 2, HEIGHT / 2, (WIDTH / 2) + r, (HEIGHT / 2) + r * tan(angle));
      
    } else if(cos(angle) < 0) {
    
      line(WIDTH / 2, HEIGHT / 2, (WIDTH / 2) - r, (HEIGHT / 2) - r * tan(angle));
    
    }
  
  } else if(abs((1 / tan(angle))) - abs(tan(angle)) > 0) {
  
    if(sin(angle) > 0) {
      
      line(WIDTH / 2, HEIGHT / 2, WIDTH / 2 + r * 1 / tan(angle), HEIGHT / 2 + r);
      
    } else if(sin(angle) < 0) {
    
      line(WIDTH / 2, HEIGHT / 2, WIDTH / 2 - r * 1 / tan(angle), HEIGHT / 2 - r);
    
    }
  
  }
  
  strokeWeight(3);
  stroke(0, 255, 0);
  fill(255);
  
  sinGraph.add(0, new PVector(WIDTH / 2 - offset, HEIGHT / 2 + r * sin(angle)));
  
  for(int i = 0; i < sinGraph.size(); i++) {
    
    PVector vec = sinGraph.get(i);
    if(i + 1 < sinGraph.size()) {
      
      PVector next = sinGraph.get(i + 1);
      if(simpleGraphs || sin) {
      
        line(vec.x + offset, vec.y, next.x + offset, next.y);
      
      }
      
    }
  
  }
  
  if(sinGraph.size() > WIDTH) {
  
    sinGraph.remove(WIDTH);
  
  }
 
  cosGraph.add(0, new PVector(WIDTH / 2 + r * cos(angle), HEIGHT / 2 + offset));
  
  stroke(255, 0, 0);
  
  for(int i = 0; i < cosGraph.size(); i++) {
    
    PVector vec = cosGraph.get(i);
    if(i + 1 < cosGraph.size()) {
      
      PVector next = cosGraph.get(i + 1);
      if(simpleGraphs || cos) {
      
        line(vec.x, vec.y - offset, next.x, next.y - offset);
      
      }
      
    }
  
  }
  
  if(cosGraph.size() > HEIGHT) {
  
    cosGraph.remove(HEIGHT);
  
  }
    
  tanGraph.add(0, new PVector(WIDTH / 2 - offset, (HEIGHT / 2) + (r * tan(angle))));

  stroke(0, 0, 255);
  
  for(int i = 0; i < tanGraph.size(); i++) {
    
    PVector vec = tanGraph.get(i);
    if(i + 1 < tanGraph.size()) {
      
      PVector next = tanGraph.get(i + 1);
      if(!((vec.y < 0 && next.y > 0) || (vec.y > 0 && next.y < 0))) {
        
        if(simpleGraphs || tan) {
        
          line(vec.x + offset, vec.y, next.x + offset, next.y);
        
        }
        
      } else {
      
        if(simpleGraphs || tan) {
        
          line(next.x + offset, next.y, next.x + offset, -10);
        
        }
      
      }
      
    }
  
  }
    
  if(tanGraph.size() > WIDTH) {
  
    tanGraph.remove(WIDTH);
  
  }
  
  stroke(255);
  strokeWeight(1);
  
  if(cos(angle) > 0) {
    
    line(WIDTH / 2, (HEIGHT / 2) + r * tan(angle), WIDTH / 2 + r, (HEIGHT / 2) + r * tan(angle));
    
  } else if (cos(angle) < 0){
  
    line(WIDTH / 2, (HEIGHT / 2) + r * tan(angle), WIDTH / 2 - r, (HEIGHT / 2) - r * tan(angle));
    
  }
  
  if(sin(angle) > 0) {
  
    line(WIDTH / 2 + r * 1 / tan(angle), HEIGHT / 2, WIDTH / 2 + r * 1 / tan(angle), HEIGHT / 2 + r);
    
  } else if(sin(angle) < 0 ) {
  
    line(WIDTH / 2 + r * 1 / tan(angle), HEIGHT / 2, WIDTH / 2 - r * 1 / tan(angle), HEIGHT / 2 - r);
  
  }
  
  secGraph.add(0, new PVector(WIDTH / 2 + (r * 1 / cos(angle)), (HEIGHT / 2) + offset));
 
  strokeWeight(3);
  stroke(121, 121, 212);
  
  for(int i = 0; i < secGraph.size(); i++) {
    
    PVector vec = secGraph.get(i);
    
    if(i + 1 < secGraph.size()) {
      
      PVector next = secGraph.get(i + 1);
      if(!((vec.x < WIDTH / 2 && next.x > WIDTH / 2) || (vec.x > WIDTH / 2 && next.x < WIDTH / 2))) {
      
        if(extendedGraphs || sec) {
        
          line(vec.x, vec.y - offset, next.x, next.y - offset);
        
        }
      
      } else if((vec.x < WIDTH / 2 && next.x > WIDTH / 2)) {
      
        if(extendedGraphs || sec) {
        
          line(vec.x, vec.y - offset, -10, vec.y - offset);
        
        }
      
      } else if((vec.x > WIDTH / 2 && next.x < WIDTH / 2)) {
      
        if(extendedGraphs || sec) {
        
          line(next.x, next.y - offset, -10, vec.y - offset);
        
        }
      
      }
      
    }
  
  }
 
  if(secGraph.size() > WIDTH) {
  
    secGraph.remove(WIDTH);
  
  }
  
  cscGraph.add(0, new PVector(WIDTH / 2  - offset, (HEIGHT / 2) + (r * 1 / sin(angle))));
 
  strokeWeight(3);
  stroke(212, 121, 121);
  
  for(int i = 0; i < cscGraph.size(); i++) {
    
    PVector vec = cscGraph.get(i);
    
    if(i + 1 < cscGraph.size()) {
      
      PVector next = cscGraph.get(i + 1);
      if(!((vec.y < HEIGHT / 2 && next.y > HEIGHT / 2) || (vec.y > HEIGHT / 2 && next.y < HEIGHT / 2)) && !(sin(angle) == 0)){
      
        if(extendedGraphs || csc) {
        
          line(vec.x + offset, vec.y, next.x + offset, next.y);
        
        }
      
      } else {
      
        if(extendedGraphs || csc) {
        
          line(next.x + offset, next.y, vec.x + offset - 100000, -10);
        
        }
      
      }
      
    }
  
  }
 
  if(cscGraph.size() > WIDTH) {
  
    cscGraph.remove(WIDTH);
  
  }
  
  cotGraph.add(0, new PVector(WIDTH / 2 + r * 1 / tan(angle), (HEIGHT / 2) + offset));

  stroke(200, 100, 50);
  
  for(int i = 0; i < cotGraph.size(); i++) {
    
    PVector vec = cotGraph.get(i);
    if(i + 1 < cotGraph.size()) {
      
      PVector next = cotGraph.get(i + 1);
      if(!((vec.x < 0 && next.x > 0) || (vec.x > 0 && next.x < 0))) {
        
        if(extendedGraphs || cot) {
        
          line(vec.x, vec.y - offset, next.x, next.y - offset);
        
        }
        
      } else {
      
        if(extendedGraphs  || cot) {
        
          line(vec.x, vec.y - offset, -1000, next.y - offset);
        
        }
      
      }
      
    }
  
  }
    
  if(cotGraph.size() > WIDTH) {
  
    cotGraph.remove(WIDTH);
  
  }
 
  fill(0);
  stroke(255);
  strokeWeight(1);
  
  angle -= 0.0075 * PI * 0.5;
  offset += 0.5;

}
