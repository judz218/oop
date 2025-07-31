class EnemyMoving extends Enemy {
    float dx, dy;

    EnemyMoving(float x0, float y0, float linearBulletRatio0) {
        super(x0, y0, linearBulletRatio0);
        dx = random(-2, 2);
        dy = random(-2, 2);
    }

    // 移動処理：画面内をバウンド
    void move() {
        x += dx;
        y += dy;

        if (x < 0 || x > width - size) dx *= -1;
        if (y < 0 || y > height / 2 - size) dy *= -1;
    }

    void display() {
        move();
        super.display(); // 親の描画処理
    }
}