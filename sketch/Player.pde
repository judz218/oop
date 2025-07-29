class Player {
    int base_hp = 5;
    int hp = base_hp; // プレイヤーの体力
    int size = 50; // 自機のサイズ
    float x = width / 2; // 自機の x 座標
    float y = height - 200; // 自機の y 座標
    int invincibleTimer = 0; // 被弾後の無敵タイマー

    // プレイヤーの描画処理
    void display() {
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

    boolean isDead() {
        return hp <= 0;
    }
}
