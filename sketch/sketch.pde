Stage st1;

TextScreen textScreen; // テキスト描画用クラスのインスタンス
boolean isStart = false; // 開始しているかを表す変数

void setup() {
    size(800, 800);
    textScreen = new TextScreen();
    st1 = new Stage(10, 1, 0.7); // ステージ1（時間：10秒，敵：1体, 確率:0.7）
}



void draw() {
    background(255);
    
    // スタート画面の描画
    if (!isStart) {
        textScreen.drawStartScreen();
        
        if (mousePressed) { // マウスをクリックしたらスタート
            isStart = true;
        }
    } else {
        // ステージ処理の実行とステージの状態の取得
        int status = st1.stageManage();
        
        if (status == 1) { // クリア時
            textScreen.drawStageClearScreen();
        } else if (status == 2) { // ゲームオーバー
            textScreen.drawGameOverScreen();
        }
    }
}