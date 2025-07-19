class CurveBullet extends Bullet{
    float ddx,ddy;
    CurveBullet(float x0, float y0,float dx0, float dy0,float ddx0,float ddy0) {
        super(x0,y0,dx0,dy0);
        ddx = ddx0;
        ddy = ddy0;
    }
    
    void move() {
        x += dx;
        y += dy;
        dx += ddx;
        dy += ddy;
    }
}