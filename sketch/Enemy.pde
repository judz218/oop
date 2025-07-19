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

    void shootLinear(float x0,float y0,float dx0,float dy0) {
        bullets.add(new LinearBullet(x0, y0, dx0, dy0));
    }

    void shootCurve(float x0,float y0,float dx0,float dy0, float ddx0, float ddy0) {
        bullets.add(new CurveBullet(x0, y0, dx0, dy0, ddx0, ddy0));
    }
}