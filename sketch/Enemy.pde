class Enemy {
    float x, y;
    int size = 50;
    ArrayList<Bullet> bullets;
    int shootCooldown;

    Enemy(float x0, float y0) {
        x = x0;
        y = y0:
        bullets = new ArrayList<Bullet>();
    }

    void display() {
        rect(x, y, size, size);
    }

}