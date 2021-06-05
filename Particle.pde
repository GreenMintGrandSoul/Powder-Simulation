enum Type {
  GAS, LIQUID, POWDER, SOLID
}

enum Id {
  SAND, WATER, STONE
}

class Particle {
  private Id id;
  private Type type;
  private color col;
  private boolean updated = false;
  Particle(Id id, Type type, color col) {
    this.id = id;
    this.type = type;
    this.col = col;
  }

  void updatePowder(int x, int y, Particle[][] next) {
    if (y < N - 1) {
      //Check below
      if (grid[x][y + 1] == null || !grid[x][y + 1].updated) {
        next[x][y + 1] = grid[x][y];
      } else if (x < N - 1 && (grid[x + 1][y + 1] == null || !grid[x + 1][y + 1].updated)) {
        next[x + 1][y + 1] = grid[x][y];
      } else if (x > 0 && (grid[x - 1][y + 1] == null || !grid[x - 1][y + 1].updated)) {
        next[x - 1][y + 1] = grid[x][y];
      } else {
        next[x][y] = grid[x][y];
        next[x][y].updated = true;
      }
    } else { //Stay
      next[x][y] = grid[x][y];
      next[x][y].updated = true;
    }
  }
}

class Sand extends Particle {
  Sand() {
    super(Id.SAND, Type.POWDER, color(255, 255, 0));
  }
}

class Water extends Particle {
  Water() {
    super(Id.WATER, Type.LIQUID, color(0, 0, 255));
  }
}

class Stone extends Particle {
  Stone() {
    super(Id.STONE, Type.SOLID, color(120, 120, 120));
  }
}
