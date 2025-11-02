/*****
 Point class
 *****/
public class Point extends Object {
  float xCoord;
  float yCoord;

  public Point(float xC, float yC) {
    xCoord = xC;
    yCoord = yC;
  }

  /* returns true if this is an interior point */
  Boolean isInteriorPoint() {
    
    if (vertices.length == 0) return false;

    int ct = 0;

    for (int k = 0; k < vertices.length-1; k++) {
      Segment seg = new Segment(vertices[k], vertices[k+1]);
      ct += signedNumberOfPointAndSegment(this, seg);
    }

    if (vertices.length != 0) {
      Segment seg = new Segment(vertices[vertices.length-1], vertices[0]);
      ct += signedNumberOfPointAndSegment(this, seg);
    }

    if (1 == abs(ct % 2)) return true && !isBoundaryPoint();
    else return false;
  }

  /* returns true if this is a boundary point */
  Boolean isBoundaryPoint() {

    if (vertices.length == 0) return false;

    for (int k = 0; k < vertices.length-1; k++) {
      Segment seg = new Segment(vertices[k], vertices[k+1]);
      if (this.onLineSegment(seg)) return true;
    }

    Segment seg = new Segment(vertices[vertices.length-1], vertices[0]);
    if (this.onLineSegment(seg)) return true;

    return false;
  }

  /* returns true if point is on seg */
  Boolean onLineSegment(Segment seg) {
    
    //println("onlineSegment() called");

    Point p1 = seg.startPoint;
    Point p2 = seg.endPoint;

    float m1 = (p1.yCoord - p2.yCoord)/(p1.xCoord - p2.xCoord);
    float b1 = p1.yCoord - m1*p1.xCoord;

    if (p1.xCoord - p2.xCoord == 0) {
      // vertical line

      if (xCoord - p1.xCoord != 0) return false;

      if (yCoord < min(p1.yCoord, p2.yCoord) || yCoord > max(p1.yCoord, p2.yCoord)) return false;

      return true;
    }

    if (yCoord != m1*xCoord + b1) return false;

    // this is on line, but is it one line segment?
    if (xCoord >= min(p1.xCoord, p2.xCoord) && xCoord <= max(p1.xCoord, p2.xCoord)) return true;


    return false;
  }



  void showIntersections() {
    
    if(vertices.length == 0) return;
    
    for (int k = 0; k < vertices.length-1; k++) {
      Segment seg = new Segment(vertices[k], vertices[k+1]);
      signedNumberOfPointAndSegment(this, seg, true);
    }

    Segment seg = new Segment(vertices[vertices.length-1], vertices[0]);
    signedNumberOfPointAndSegment(this, seg, true);
    
  }
}







int signedNumberOfPointAndSegment(Point pt, Segment seg) {
  return signedNumberOfPointAndSegment(pt, seg, false);
}

int signedNumberOfPointAndSegment(Point pt, Segment seg, Boolean showIntersections) {

  Point p1 = seg.startPoint;
  Point p2 = seg.endPoint;

  float m1 = (p1.yCoord - p2.yCoord)/(p1.xCoord - p2.xCoord);
  float b1 = p1.yCoord - m1*p1.xCoord;

  // other line is line through pt and (-PI,-20*PI)
  float m2 = (pt.yCoord+PI)/(pt.xCoord+20*PI);
  float b2 = pt.yCoord - m2*pt.xCoord;

  float intX = (b1-b2)/(m2-m1);
  float intY = m2*intX + b2;

  if (p1.xCoord - p2.xCoord == 0) {
    intX = p1.xCoord;
    intY = m2*intX + b2;
  }

  /* draw intersections */
  if (showIntersections) {
    fill(255, 255, 255);
    ellipse(coordinatesForPointWithCoordinates(intX, intY).xCoord, coordinatesForPointWithCoordinates(intX, intY).yCoord, 10, 10);
  }

  if (intX > pt.xCoord) return 0; // pt is before the line segment

  /* determine if this is on the line segment */

  float minX = min(p1.xCoord, p2.xCoord);
  float maxX = max(p1.xCoord, p2.xCoord);
  float minY = min(p1.yCoord, p2.yCoord);
  float maxY = max(p1.yCoord, p2.yCoord);

  if (intX >= minX && intX <= maxX && intY >= minY && intY <= maxY) {
  }
  else {
    return 0;
  }

  /*******
   Determine the sign of the intersection 
   *******/

  // Determine if angles are in same or different quadrants

  float angle1 = atan2(pt.yCoord-intY, pt.xCoord-intX);
  float angle2 = atan2(p1.yCoord-intY, p1.xCoord-intX);

  int quadrant1 = floor(angle1/PI/2.0);
  int quadrant2 = floor(angle2/PI/2.0);

  if (quadrant1 == quadrant2) {
    if (angle1 - angle2 > 0) return 1;
    else return -1;
  }

  if (quadrant1 + 1 == quadrant2 % 4) {
    return -1;
  }
  else {
    return 1;
  }
}

