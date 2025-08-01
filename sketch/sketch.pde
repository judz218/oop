int st_index = 0;
int st_num = 3;
boolean isFirst = true;

Stage st[] = new Stage[st_num];

TextScreen textScreen; // テキスト描画用クラスのインスタンス
boolean isStart = false; // 開始しているかを表す変数
Button backButton;

void setup() {
    size(800, 800);
    textScreen = new TextScreen();
    
    for (int i = 0; i < st_num; i++) {
        // ステージ（秒数，敵の数, まっすぐ飛ぶ弾の確率, 動く敵の割合）
        st[i] = new Stage(10 + 5 * i, i + 1, 0.7 - 0.1 * i, 0.5);    
    }
    
    backButton = new Button(width / 2 - 60, height / 2 + 40, 120, 40, "Back to Title");
}

void draw() {
    background(255);
    
    // 遊び方画面の描画
    if (isFirst) {
        textScreen.drawHowToPlayScreen();
    }
    // スタート画面の描画
    if (!isStart) {
        textScreen.drawStartScreen();
    } else {
        // ステージ処理の実行とステージの状態の取得
        // 0: ゲーム中，1: ゲームクリア，2: ゲームオーバー
        int status = st[st_index].stageManage();
        if (status == 1) { // クリア時
            if (st_index != st_num - 1) { // ステージクリア処理
                textScreen.drawStageClearScreen();
            } else { // ゲームクリア処理
                textScreen.drawGameClearScreen();
            }
        } else if (status == 2) { // ゲームオーバー
            textScreen.drawGameOverScreen();
        }
    }
}

void mousePressed() {
    if (isFirst) {
        isFirst = false;
        isStart = true;
        return;
    }

    if(!isStart) {
        isStart = true;
        return;
    }

    int status = st[st_index].stageManage();
    if (status == 2 && backButton.isMouseOver()) {
        isStart = false;  // タイトル画面に戻す
        resetStages();
        st_index = 0;     // ステージを最初に戻す
    }

    if (status == 1 && st_index != st_num - 1) {
        st_index++;
    }
}

void resetStages() {
    st = new Stage[st_num];
    for (int i = 0; i < st_num; i++) {
        st[i] = new Stage(10 + 5 * i, i + 1, 0.7 - 0.1 * i, 0.5); 
    }
}