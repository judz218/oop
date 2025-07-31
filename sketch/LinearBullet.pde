class LinearBullet extends Bullet{
    void init(float x0,float y0) {
        x = x0;
        y = y0;
        dx = random( -5, 5);
        dy = random( -5, 5);
    }
    
    void move() {
        x += dx;
        y += dy;
    }
}