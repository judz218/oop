class Player {
    int base_hp = 5;
    int hp = base_hp; // プレイヤーの体力
    int size = 50; // 自機のサイズ
    float x = width / 2; // 自機の x 座標
    float y = height - 200; // 自機の y 座標
    int invincibleTimer = 0; // 被弾後の無敵タイマー

    // プレイヤーの描画処理
    void display() {
        applyColorByState();
        ellipse(x, y, size, size);
        if (invincibleTimer > 0) {
            invincibleTimer -= 1;
        }
    };

    // 操作入力に応じた移動
    void move() {
        x = mouseX;
        y = mouseY;
    }

    // ダメージを受けた際の処理
    void takeDamage(int amount) {
        hp -= amount;
        invincibleTimer = 60;
    }

    // 体力が0になったとき（死んだとき）
    boolean isDead() {
        return hp <= 0;
    }

    // 無敵時間のみ色を変更
    void applyColorByState() {
        if (invincibleTimer > 0) {
            if (frameCount % 10 < 5) {
                fill(255, 100, 100);
            } else {
                // 点滅
                fill(255);
            }
        } else {
            fill(0);
        }
    }
}
