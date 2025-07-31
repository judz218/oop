class Effect {
    float x, y;
    int duration = 30;

    Effect(float x0, float y0) {
        x = x0;
        y = y0;
    }

    void update() {
        if (duration > 0) {
            fill(255, 150, 0, map(duration, 0, 30, 0, 255));
            ellipse(x, y, 40 - duration, 40 - duration);
            duration--;
        }
    }

    boolean isExpired() {
        return duration <= 0;
    }
}