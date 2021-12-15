class Snake extends Entities {
  int score;
  boolean alive = true;
  Snake(int _x, int _y) {
    position = new PVector(_x, _y);
    velocity = new PVector(0, 0);
    blue = 255;
    diameter = 60;
    max_speed = 1;
  }
  void run() {
    fill(red, green, blue);
    move();
    rect(position.x * tile_x, position.y * tile_y, diameter, diameter);
  }
  void move() {
    //position and velocity are added and then stored in position
    position = PVector.add(position, velocity);
  }
}
