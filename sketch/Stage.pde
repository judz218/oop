class Stage {
    float time; // 制限時間
    int baseTime = -100; // そのステージをスタートした時間を入れる
    int enemyNum; // ステージに登場する敵の数
    Player p; // プレイヤー
    Enemy[] enemies; // 敵を格納しておく配列
    float bulletPer;
    float movingEnemyPer;
    ArrayList<Effect> effects = new ArrayList<Effect>();
    
    Stage(float l, int n, float p0, float m0) {
        time = l;
        enemyNum = n;
        bulletPer = p0; // 弾の割合
        movingEnemyPer = m0; //動く敵の割合
        p = new Player();
        enemies = new Enemy[enemyNum];
        // 敵を画面の上半分，左右を1/8ずつ空けてのランダムな位置に出現
        for (int i = 0; i < enemyNum; i++) {
            if (random(1) <= movingEnemyPer) {
                enemies[i] = new EnemyMoving(random(width), random(height / 2), bulletPer);
            } else {
                enemies[i] = new Enemy(random(width), random(height / 2), bulletPer);
        }
    }
    }
    
    int stageManage() {
        // ゲームクリア
        if ((!p.isDead()) && isFinished()) {
            return 1;
        } else {
            // ゲームオーバー
            if (p.isDead()) {
                return 2;
            }
        }
        
        // 始めて呼び出されたときに時間をセット
        if (baseTime < 0) {
            baseTime = millis();
        }
        
        // ステージ処理
        countDown();
        drawLimit();
        drawHP();
        
        // プレイヤー処理
        p.display();
        p.move();
        
        // 敵処理
        for (int i = 0; i < enemyNum; i++) {
            enemies[i].display();
            enemies[i].materializeBullets();
            enemies[i].updateBullets(p, effects);
        };
        
        // エフェクトの描画・更新
        for (int i = effects.size() - 1; i >= 0; i--) {
            effects.get(i).update();
            if (effects.get(i).isExpired()) {
                effects.remove(i);
            }
        }
        
        return 0;
    };
    
    // 時間を一秒ずつ減らす
    void countDown() {
        int currentTime = millis();
        float dTime = (currentTime - baseTime) / 1000.0;
        time -= dTime;
        baseTime = currentTime;
        
        if (time <= 0) {
            time = 0;
        }
    }
    
    // 残り時間を画面に表示
    void drawLimit() {
        fill(0);
        textSize(24);
        textAlign(LEFT, TOP);
        text(nf(time, 2, 2), 20, 20);
    }
    
    // HPの表示
    void drawHP() {
        // バー
        float base_rect_W = width - 100;
        float rect_H = 40;
        int rect_x = 50;
        int rect_y = height - 100;
        float hp_rect = base_rect_W / p.base_hp;
        
        fill(255);
        rect(rect_x, rect_y, base_rect_W, rect_H);
        fill(#99ff99);
        rect(rect_x, rect_y, hp_rect * p.hp, rect_H);
        
        // 数値
        fill(0);
        textSize(30);
        textAlign(RIGHT, BOTTOM);
        text(p.hp, width - 15, height - 50);
    }
    
    boolean isFinished() {
        return time <= 0;
    }
}