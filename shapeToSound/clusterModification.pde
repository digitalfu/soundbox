boolean goUp(){
  if(mouseY < pmouseY){
    return true; 
  }else{
    return false; 
  }
}

boolean goDown(){
  if(mouseY > pmouseY){
    return true; 
  }else{
    return false; 
  }
}

boolean goLeft(){
  if(mouseX < pmouseX){
    return true; 
  }else{
    return false; 
  }
}

boolean goRight(){
  if(mouseX > pmouseX){
    return true; 
  }else{
    return false; 
  }
}

boolean mouseLeftTop(){
  if((mouseX <= (width/2)) && (mouseY <= (height/2))){
    return true;
  }else{
    return false; 
  }
}

boolean mouseRightTop(){
  if((mouseX > (width/2)) && (mouseY <= (height/2))){
    return true;
  }else{
    return false; 
  }
}

boolean mouseLeftBottom(){
  if((mouseX <= (width/2)) && (mouseY > (height/2))){
    return true;
  }else{
    return false; 
  }
}

boolean mouseRightBottom(){
  if((mouseX > (width/2)) && (mouseY > (height/2))){
    return true;
  }else{
    return false; 
  }
}


int getCloseVertex(PShape s){ 
  
  smallerDistance = distanceMouseVector; 
  for(int x = 0; x < s.getVertexCount(); x++){
    PVector v = s.getVertex(x);  
    distanceMouseVector = dist(v.x, v.y, mouseX, mouseY);
    if(distanceMouseVector < smallerDistance){
      smallerDistance = distanceMouseVector;
      closestVector = v; 
      vectorIndex = x; 
    }
  }   
  return vectorIndex; 
}

void changeShape(PShape shape)
{
  int index = getCloseVertex(shape);
  PVector v =  shape.getVertex(index);

  if(goUp() && goLeft()){
    v.x -= (pmouseX - mouseX) * changingFactor;
    v.y -= (pmouseY - mouseY) * changingFactor;
    shape.setVertex(index, v.x, v.y);
  }else if(goUp() && goRight()){
    v.x += (mouseX - pmouseX) * changingFactor; 
    v.y -= (pmouseY - mouseY) * changingFactor;
    shape.setVertex(index, v.x, v.y);
  }else if(goDown() && goLeft()){
    v.x -= (pmouseX - mouseX) * changingFactor; 
    v.y += (mouseY - pmouseY) * changingFactor;
    shape.setVertex(index, v.x, v.y);
  }else if (goDown() && goRight()){
    v.x += (mouseX - pmouseX) * changingFactor;
    v.y += (mouseY - pmouseY) * changingFactor; 
    shape.setVertex(index, v.x, v.y);
  }else if (goUp()){
    v.y -= (pmouseY - mouseY) * changingFactor;
    shape.setVertex(index, v.x, v.y);
  }else if (goDown()){
    v.y += (mouseY - pmouseY) * changingFactor;
    shape.setVertex(index, v.x, v.y);
  }else if (goLeft()){ 
    v.x -= (pmouseX - mouseX) * changingFactor;
    shape.setVertex(index, v.x, v.y);
  }else if (goRight()){
    v.x += (mouseX - pmouseX) * changingFactor;
    shape.setVertex(index, v.x, v.y);
  } 
}


//no used now but could be later. 
//void getCircumferance(PShape shape){
//   float[] vectorSizes = new float[shape.getVertexCount()];
//   float pastX = shape.getVertex(0).x; 
//   float pastY = shape.getVertex(0).y; 
//   float surface = 0;
   
//   for(int i = 1; i < shape.getVertexCount(); i++){
//    PVector v = shape.getVertex(i);  
//  //  println(i, ": ", v); 

//    float d = dist(pastX, pastY, shape.getVertex(i).x, shape.getVertex(0).y);
//    surface += d; 
//    pastX = shape.getVertex(i).x; 
//    pastY = shape.getVertex(i).y;    
//   }
//   println(surface); 
//}
