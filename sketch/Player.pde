class Player {
    private int hp = 10; // プレイヤーの体力
    public int size = 50; // 自機のサイズ
    public float width / 2; // 自機の x 座標
    public float y = height - 200; // 自機の y 座標
    public int invincibleTimer = 0; // 被弾後の無敵タイマー

    // プレイヤーの描画処理
    private void display() {
        ellipse(x, y, size, size);
        if (invincibleTimer > 0) {
            invincibleTimer -= 1;
        }
    };

    // 操作入力に応じた移動
    private void move() {
        x = mouseX;
        y = mouseY;
    };

    // ダメージを受けた際の処理
    public void takeDamage(int amount) {
        hp -= 1;
        invincibleTimer = 60;
    };
}

