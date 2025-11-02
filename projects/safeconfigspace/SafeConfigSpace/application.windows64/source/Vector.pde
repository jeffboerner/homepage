public class Vector extends Object {
  float x;
  float y;
  float z;

  public Vector(float xC, float yC, float zC) {
    x = xC;
    y = yC;
    z = zC;
  }
  
  public Vector sum(Vector v){
    Vector outputVector = new Vector(x + v.x, y + v.y, z + v.z);
    
    return outputVector;
  }
  
    public Vector scalarMultiple(float scalar){
    Vector outputVector = new Vector(x*scalar, y*scalar, z*scalar);
    
    return outputVector;
  }
  
  public void printVector(){
   println("Vector is (" + x + "," + y + "," + z + ")");
  }
}

