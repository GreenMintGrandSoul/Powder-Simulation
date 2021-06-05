import java.util.Random;

final int N = 100;
final int Scale = 6;

Particle[][] grid = new Particle[N][N];

Misc misc;

void settings() {
  size(N * Scale, N * Scale);
  misc = new Misc();
}

void setup() {
  
}

void draw() {
  grid[mouseX / Scale][mouseY / Scale] = new Sand();
  grid[30][0] = new Sand();
  grid[70][0] = new Sand();
  misc.step();
  misc.render();
}
