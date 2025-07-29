Stage st1;

TextScreen textScreen; // テキスト描画用クラスのインスタンス
boolean isStart = false; // 開始しているかを表す変数

void setup() {
    size(800, 800);
    textScreen = new TextScreen();
    st1 = new Stage(10, 1); // ステージ1（時間：10秒，敵：1体）
}



void draw() {
    background(255);
    
    // スタート画面の描画
    if (!isStart) {
        textScreen.drawStartScreen();
        
        // マウスをクリックしたらスタート
        if (mousePressed) {
            isStart = true;
        }
    } else {
        st1.stageManage();
    }
}