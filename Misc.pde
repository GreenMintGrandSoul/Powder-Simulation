public class Misc {
  void step() {
    Particle[][] next = new Particle[N][N];
    for (int i = 0; i < N; i++) {
      for (int j = N - 1; j > -1; j--) {
        Particle p = grid[i][j];
        if (p != null) {
          switch (p.type) {
            case POWDER: p.updatePowder(i, j, next); break;
          }
        }
      }
    }
    grid = next;
  }

  void render() {
    for (int i = 0; i < N; i++) {
      for (int j = 0; j < N; j++) {
        Particle p = grid[i][j];
        if (p != null) {
          fill(p.col);
        } else fill(0);
        rect(i * Scale, j * Scale, Scale, Scale);
      }
    }
  }
}
