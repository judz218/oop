Stage st1;

void setup() {
    size(800, 800);
    st1 = new Stage(10, 1, 0.7); // ステージ1（時間：10秒，敵：1体, 確率:0.7）
}



void draw() {
    background(255);
    st1.stageManage();
}