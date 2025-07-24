Stage st1;

void setup() {
    size(800, 800);
    st1 = new Stage(10, 1); // ステージ1（時間：10秒，敵：1体）
}



void draw() {
    background(255);
    st1.stageManage();
}
