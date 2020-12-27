class Direction {
  static final int up = 0;
  static final int right = 1;
  static final int down = 2;
  static final int left = 3;
  static final int endOrStart = 4;
  
  int returnRandomDirection(int prevDirection) {
    int result = 0;
    ArrayList<Integer> newNumber = new ArrayList<Integer>();
    
    
    switch(prevDirection) {
      case 0:
        newNumber.add(right);
        newNumber.add(up);
        newNumber.add(left);
        break;
      case 1: 
        newNumber.add(up);
        newNumber.add(down);
        newNumber.add(right);
        break;
       case 2: 
        newNumber.add(down);
        newNumber.add(right);
        newNumber.add(left);
        break;
       case 3: 
        newNumber.add(up);
        newNumber.add(left);
        newNumber.add(down);
        break;
       case 4:
         return endOrStart;
         
    }
    int index = floor(random(0, newNumber.size()));
    result = newNumber.get(index);
    
    return result;
  }
  
  
}
