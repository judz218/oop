class Button {
  float x, y, w, h;
  String label;
  
  Button(float x0, float y0, float w0, float h0, String label0) {
    x = x0;
    y = y0;
    w = w0;
    h = h0;
    label = label0;
  }
  
  // ボタンの描画
  void display() {
    fill(200);
    stroke(0);
    rect(x, y, w, h, 10);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(16);
    text(label, x + w / 2, y + h / 2);
  }
  
  // マウスがボタン上にあるかどうか
  boolean isMouseOver() {
    return mouseX >= x && mouseX <= x + w &&
           mouseY >= y && mouseY <= y + h;
  }
  
  // マウスが押されたときの反応
  boolean isClicked() {
    return isMouseOver() && mousePressed;
  }
}
