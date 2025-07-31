class TextScreen{
    
    // スタート画面の描画
    void drawStartScreen() {
        fill(0);
        textSize(24);
        textAlign(CENTER, CENTER);
        text("Mouse Click to Start!", width / 2, height / 2);
    }
    
    // ステージクリア画面の描画
    void drawStageClearScreen() {
        fill(0);
        textSize(24);
        textAlign(CENTER, CENTER);
        text("Stage Clear!\n\nMouse Click to Next Stage", width / 2, height / 2);
    }
    
    // ゲームクリア画面の描画
    void drawGameClearScreen() {
        fill(0);
        textSize(24);
        textAlign(CENTER, CENTER);
        text("Game Clear!", width / 2, height / 2);
    }
    
    // ゲームオーバー画面の描画
    void drawGameOverScreen() {
        fill(0);
        textSize(24);
        textAlign(CENTER, CENTER);
        text("GAME OVER", width / 2, height / 2);
    }
}