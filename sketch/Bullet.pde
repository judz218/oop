abstract class Bullet{
    float x,y;
    float dx,dy;
    int size = 10;
    
    Bullet(float x0, float y0,float dx0, float dy0) {
        x = x0;
        y = y0;
        dx = dx0;
        dy = dy0;
    }
    
    abstract void move();
    
    void display() {
        ellipse(x,y,size,size);
    }
    
    void calcDist(float x1,float y1) {
        float distX = pow(x1 - x,2);
        float distY = pow(y1 - y,2);
        float dist = pow(distX + distY,0.5);
        return dist;
    }
    
    void judgeHit(Player p) {
        if (p.invincibleTimer > 0) {
            return;
        }
        float dist = calcDist(p.x,p.y);
        if (dist <= (size + p.size) / 2) {
            p.takeDamage();
        }
    }
}