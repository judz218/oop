abstract class Stage() {
    int time;
    int base_time = 0;
    Stage(int l) {
        time = l;
        base_time = millis();
    }

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
        textAllign(RIGHT, TOP);
        text(time, 20, 20);
    }

    boolean isFinished() {
        return time <= 0;
    }
}