class Entities {
  PVector position;
  PVector velocity;
  int diameter;
  int red;
  int blue;
  int green;
  int max_speed;
  int tile_x = 60;
  int tile_y = 60;
  
  void move(){
    //stores the position and velocity into the Pvector called position
    position = PVector.add(position, velocity);
  }
}
