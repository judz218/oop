class LinearBullet extends Bullet{
    LinearBullet(x0,y0,dx0,dy0) {
        super(x0,y0,dx0,dy0);
    }
    
    void move() {
        x += dx;
        y += dy;
    }
}