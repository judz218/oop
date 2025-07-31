int st_index = 0;
int st_num = 3;
int mode = 0;

Stage st[] = new Stage[st_num];

TextScreen textScreen; // テキスト描画用クラスのインスタンス
boolean isStart = false; // 開始しているかを表す変数

void setup() {
    size(800, 800);
    textScreen = new TextScreen();
    for (int i = 0; i < st_num; i++) {
        // ステージ（秒数，敵の数, まっすぐ飛ぶ弾の確率, 動く敵の割合）
        st[i] = new Stage(10 + 5 * i, i + 1, 0.7 - 0.1 * i, 1);    
    }
    
}

void draw() {
    background(255);
    
    if (mode == 0) {
        textScreen.drawHowToPlayScreen();
        if (mousePressed) {
            mode = 1;
        }
    }
    // スタート画面の描画
    if (!isStart) {
        textScreen.drawStartScreen();
        
        if (mousePressed) { // マウスをクリックしたらスタート
            isStart = true;
        }
    } else {
        // ステージ処理の実行とステージの状態の取得
        // 0: ゲーム中，1: ゲームクリア，2: ゲームオーバー
        int status = st[st_index].stageManage();
        
        if (status == 1) { // クリア時
            if (st_index != st_num - 1) { // ステージクリア処理
                textScreen.drawStageClearScreen();
                if (mousePressed) {
                    st_index++;
                }
            } else { // ゲームクリア処理
                textScreen.drawGameClearScreen();
            }
        } else if (status == 2) { // ゲームオーバー
            textScreen.drawGameOverScreen();
        }
    }
}