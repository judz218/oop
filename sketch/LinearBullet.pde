class LinearBullet extends Bullet{
    LinearBullet(float x0,float y0,float dx0,float dy0) {
        super(x0,y0,dx0,dy0);
    }
    
    void move() {
        x += dx;
        y += dy;
    }
}