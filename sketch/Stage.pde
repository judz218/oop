class Stage {
    float time; // 制限時間
    int base_time = 0;
    int enemyNum; // ステージに登場する敵の数
    Player p; // プレイヤー
    Enemy[] enemies; // 敵を格納しておく配列

    Stage(float l, int n, float p0) {
        time = l;
        base_time = millis();
        enemyNum = n;
        bulletPer = p0; // 弾の割合
        p = new Player();
        enemies = new Enemy[enemyNum];
        for (int i = 0; i < enemyNum; i++) {
            // 画面の上半分のランダムな位置に出現，linearBullet の確率は一旦100%
            enemies[i] = new Enemy(random(width), random(height / 2), bulletPer);
        }
        print(width, height);
    }
    void stageManage() {
        // ステージ処理
        countDown();
        drawLimit();
        drawHP();
        // ゲームクリア
        if ((!p.isFinished()) && isFinished()) {
            fill(0);
            textSize(24);
            textAlign(CENTER, CENTER);
            text("Clear", width / 2, height / 2);
            return;
        } else {
            // ゲームオーバー
            if (p.isFinished()) {
                fill(0);
                textSize(24);
                textAlign(CENTER, CENTER);
                text("GAME OVER", width / 2, height / 2);
                return;
            }
            // ゲームオーバー時の時間表示どうしようね
        }

        // プレイヤー処理
        p.display();
        p.move();

        // 敵処理
        for (int i = 0; i < enemyNum; i++) {
            enemies[i].display();
            enemies[i].materializeBullets();
            enemies[i].updateBullets(p);
        };
    };

    // 時間を一秒ずつ減らす
    void countDown() {
        int currentTime = millis();
        float dTime = (currentTime - base_time) / 1000.0;
        time -= dTime;
        base_time = currentTime;

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
        rect(rect_x, rect_y, hp_rect*p.hp, rect_H);

        // 数値
        fill(0);
        textSize(30);
        textAlign(RIGHT, BOTTOM);
        text(p.hp, width-15, height-50);
    }

    boolean isFinished() {
        return time <= 0;
    }
}