class TextScreen{
    
    // スタート画面の描画
    void drawStartScreen() {
        fill(0);
        textSize(24);
        textAlign(CENTER, CENTER);
        text("Mouse Click to Start!", width / 2, height -100);
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

    // 遊びかたページの描画
    void drawHowToPlayScreen() {
        fill(0);
        textSize(30);
        textAlign(CENTER, TOP);

        text("How to Play", width / 2, 100);
        textSize(20);
        text("Move the player with your mouse.", width / 2, 150);
        text("Avoid enemy bullets and survive until time runs out.", width / 2, 180);
        text("You lose 1 HP when hit by a bullet.", width / 2, 210);
        text("The game is over when your HP reaches 0.", width / 2, 240);
        text("If you survive until the timer hits 0, you clear the stage.", width / 2, 270);
    }
}