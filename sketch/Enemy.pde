class Enemy {
    float x, y;
    int size = 50;
    Bullet[] bullet;
    int shootCooldown;

    Enemy(float x0, float y0) {
        x = x0;
        y = y0:
    }

    void display() {
        rect(x, y, size, size);
    }
}