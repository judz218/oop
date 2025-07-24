class Stage {
    int time;
    int base_time = 0;
    int enemyNum; // ステージに登場する敵の数
    Player p; // プレイヤー
    Enemy[] enemies; // 敵を格納しておく配列

    Stage(int l, int n) {
        time = l;
        base_time = millis();
        enemyNum = n;
        p = new Player();
        enemies = new Enemy[enemyNum];
        for (int i = 0; i < enemyNum; i++) {
            enemies[i] = new Enemy(random(width), random(height / 2), 1.0); // 画面の上半分のランダムな位置に出現，linearBullet の確率は一旦100%
        }
        print(width, height);
    }
    void stageManage() {
        // ステージ処理
        countDown();
        drawLimit();
        if (isFinished()) {
            fill(0);
            textSize(24);
            textAlign(CENTER, CENTER);
            text("Clear", width / 2, height / 2);
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
        if (millis() - base_time >= 1000) {
            time--;
            base_time = millis();
        }
    }

    // 残り時間を画面に表示
    void drawLimit() {
        fill(0);
        textSize(24);
        textAlign(RIGHT, TOP);
        if (time <= 0) {
            text("0", 20, 20);
        } else {
            text(time, 20, 20);
        }
    }

    boolean isFinished() {
        return time <= 0;
    }
}