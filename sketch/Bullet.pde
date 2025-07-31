abstract class Bullet{
    float x,y;
    float dx,dy;
    int size = 10;
    boolean isDisplay = false;
 

    abstract void init(float x0, float y0);
    
    abstract void move();
    
    void display() {
        ellipse(x,y,size,size);
    }
    
    // judgeHit() で使用する距離計算
    float calcDist(float x1,float y1) {
        float distX = pow(x1 - x,2);
        float distY = pow(y1 - y,2);
        float dist = pow(distX + distY,0.5);
        return dist;
    }
    
    // 当たり判定をし，プレイヤーにダメージを与える
    void judgeHit(Player p, ArrayList<Effect> effects) {
        if (p.invincibleTimer > 0) {
            return;
        }

        float dist = calcDist(p.x,p.y);

        if (dist <= (size + p.size) / 2) {
            p.takeDamage(1);

            // エフェクト追加
            effects.add(new Effect(x, y));
        }

    }
}
