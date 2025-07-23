class Enemy {
    float x, y;
    int size = 50;
    int shootCooldown;
    int bulletNum = 100;
    int frameCount = 0;
    int bulletInterval = 10;
    int bulletIndex = 0;
    float linearBulletRatio;
    Bullet[] bullets = new Bullet[bulletNum];
    
    Enemy(float x0, float y0, float linearBulletRatio0) {
        x = x0;
        y = y0;
        linearBulletRatio = linearBulletRatio0;
        
        for (int i = 0; i < bulletNum; i++) {
            if (random(1) <= linearBulletRatio) {
                bullets[i] = new LinearBullet(x,y,0,0);
            } else{
                bullets[i] = new CurveBullet(x,y,0,0,0,0);
            }
        }
    }
    
    void display() {
        rect(x, y, size, size);
    }
    
    // 一定のフレーム間隔で弾を実体化
    void materializeBullets() {
        frameCount++;
        if (frameCount == bulletInterval) {
            bullets[bulletIndex].isDisplay = true;
            bulletIndex = (bulletIndex + 1) % bulletNum;
            frameCount = 0;
        }
    }
    
    // 弾が画面内にあるかどうか判定
    boolean isInside(float x, float y) {
        boolean isXOver0 = 0 <= x;
        boolean isXUnderWidth = x <= Width;
        boolean isYOver0 = 0 <= y;
        boolean isYUnderHeight = y <= Height;
        if (isXOver0 && isXUnderWidth && isYOver0 && isYUnderHeight) {
            return true;
        }
    }
    
    // bullets の管理
    void updateBullets(Player p) {
        for (int i = 0; i < bulletNum; i++) {
            // isDisplay が false の場合，bullets の処理しない
            if (!bullets[i].isDisplay) {
                continue;
            }

            bullets[i].display();
            bullets[i].judgeHit(p);
            bullets[i].move();
            
            // 画面外に行ったら isDisplay を false にする
            if (!isInside(bullet[i].x,bullet[i].y)) {
                bullet[i].isDisplay = false;
            }
        }
    }
}