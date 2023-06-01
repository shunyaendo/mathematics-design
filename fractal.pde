int w = 800; // ウィンドウの幅
int h = 800; // ウィンドウの高さ

void settings() {
  size(w, h);
}

void setup() {
  noLoop();
}

void draw() {
  background(255);
  smooth();
  drawYinYang(w/2, h/2, w/4, 7);
}

void drawYinYang(float x, float y, float radius, int level) {
  if (level == 0) return;

  ellipseMode(RADIUS);
  noStroke();

  // 大円
  fill(0);
  arc(x, y, radius, radius, HALF_PI, PI + HALF_PI);
  fill(255);
  arc(x, y, radius, radius, PI + HALF_PI, HALF_PI);

  // 小円
  float smallRadius = radius / 2;
  fill(255);
  ellipse(x - smallRadius, y, smallRadius, smallRadius);
  fill(0);
  ellipse(x + smallRadius, y, smallRadius, smallRadius);

  // 中心の小円
  float tinyRadius = radius / 8;
  fill(0);
  ellipse(x - smallRadius, y, tinyRadius, tinyRadius);
  fill(255);
  ellipse(x + smallRadius, y, tinyRadius, tinyRadius);

  // 再帰的に陰陽マークを描画
  drawYinYang(x - smallRadius, y, smallRadius / 2, level - 1);
  drawYinYang(x + smallRadius, y, smallRadius / 2, level - 1);
}
