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
        text("Clear!", width / 2, height / 2);
    }
    
    // ゲームクリア画面の描画
    void drawGameClearScreen() {
        
    }
    
    // ゲームオーバー画面の描画
    void drawGameOverScreen() {
        fill(0);
        textSize(24);
        textAlign(CENTER, CENTER);
        text("GAME OVER", width / 2, height / 2);
    }
}