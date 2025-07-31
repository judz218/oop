class CurveBullet extends Bullet {
    float angle, speed, dAngle;
    
    void init(float x0, float y0) {
        x = x0;
        y = y0;
        
        // 初期角度
        angle = random(0, TWO_PI);
        
        // 初速
        speed = random(3, 6);
        
        // 曲がり方
        dAngle = random( -0.02, 0.02);
    }
    
    void move() {
        x += cos(angle) * speed;
        y += sin(angle) * speed;
        angle += dAngle;
    }
}
