class Apple extends Entities {
  Apple(int _x, int _y) {
    position = new PVector(_x, _y);
    diameter = 60;
    red = 255;
    green = 0;
    blue = 0;
  }
  void run() {
    //when code runs, it creates a red ball
    fill(red, green, blue);
   
    ellipse(position.x * tile_x, position.y * tile_y, diameter, diameter);
  }
}
