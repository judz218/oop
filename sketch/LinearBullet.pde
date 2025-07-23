class LinearBullet extends Bullet{
    void init(float x0,float y0) {
        x = x0;
        y = y0;
        dx = random(-1, 1);
        dy = random(-1, 1);
    }
    
    void move() {
        x += dx;
        y += dy;
    }
}