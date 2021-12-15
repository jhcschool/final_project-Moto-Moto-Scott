Snake snake;
Apple apple;
void setup() {
  frameRate(60);
  size (600, 480);
  //sets the spawning point for the snake and apple
  snake = new Snake(1, 1);
  apple = new Apple((int)Math.floor(random(0, 9)), ((int)Math.floor(random(0, 7))));
  ellipseMode(CORNER);
}
int framecounter = 0;
void draw() {
  framecounter++;
  int originalPosition_x;
  int originalPosition_y;
  int lightGreen = 175;
  //sets the score on screen
  textSize(30);
  fill(0);
  text("Score: " + snake.score, 40, 40);
  if (framecounter > 20) {
    framecounter = 0;
    //when program starts, it draws the snake and apple because i called on them
    background (0, lightGreen, 0);
    fill (0);
    //these loops make the grid
    for (int i =0; i < 11; i++) {
      line(60*i, 0, 60*i, 480);
    }
    for (int j = 0; j <11; j++) {
      line (0, 60*j, 600, 60*j);
    }
 //as long as the snake is alive, the code will run
    if(snake.alive){
      snake.run();
    }
    //if the snake and apple touch each other(on the same grid spot) the apple will change spots
    if (snake.position.x == apple.position.x && snake.position.y == apple.position.y) {
      snake.score++;
      originalPosition_x = (int)apple.position.x;
      originalPosition_y = (int)apple.position.y;
      apple.position = new PVector((int)Math.floor(random(0, 9)), ((int)Math.floor(random(0, 7))));
      while (originalPosition_x ==apple.position.x && originalPosition_y == apple.position.y) {
        apple.position = new PVector((int)Math.floor(random(0, 9)), ((int)Math.floor(random(0, 7))));
      }
    }
    apple.run();
     //if the position of the snake goes past the set borders it will die 
    if (snake.position.x < 0 || snake.position.x > 9) {
      snake.alive = false;
      background(0);
      fill(255,0,0);
      textSize(75);
      text("you died bozo", 100, 220);
    }
    if (snake.position.y < 0 || snake.position.y > 7) {
      snake.alive = false;
      background(0);
    }
  }
  
}
//this is how the character/snake moves
//listener method
void keyPressed() {
  if (keyCode == UP) {
    snake.velocity.y = -1*snake.max_speed;
    snake.velocity.x = 0;
  }
  if (keyCode == DOWN) {
    snake.velocity.y = 1*snake.max_speed;
    snake.velocity.x = 0;
  }
  if (keyCode == LEFT) {
    snake.velocity.x = -1*snake.max_speed;
    snake.velocity.y = 0;
  }
  if (keyCode == RIGHT) {
    snake.velocity.x = 1*snake.max_speed;
    snake.velocity.y = 0;
  }
}
