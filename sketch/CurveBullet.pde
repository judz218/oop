class CurveBullet extends Bullet {
    float angle, speed, dAngle;
    
    void init(float x0, float y0) {
        x = x0;
        y = y0;
        
        // 弾の向きを「下以外」にする：PI〜2PI（180°〜360°）
        angle = random(0, TWO_PI);
        
        // 弾速
        speed = random(3, 6);
        
        // カーブ方向（正負ランダム）
        dAngle = random( -0.02, 0.02);
    }
    
    void move() {
        x += cos(angle) * speed;
        y += sin(angle) * speed;  // ← Y方向を反転
        angle += dAngle;
    }
}
