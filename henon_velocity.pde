int w = 10000;
int h = 5000;
int xScale = w/3;
int yScale = h*2/3;
int dScale = 150;

float x = 0;
float y = 0;
float a = 1.4;
float b = 0.3;

size(w, h);

PGraphics g = createGraphics(w, h, P2D);
g.beginDraw();
g.background(255);
g.smooth();
g.noFill();

for (int t = 0; t < 100000; t++) {
    float x0 = x;
    float y0 = y;
    x = y0 + 1 - a * x0 * x0;
    y = b * x0;
    float x1 = w/2 + xScale * x;
    float y1 = h/2 + yScale * y; 
    float d = dScale * sqrt(sq(x-x0) + sq(y-y0));
    if (x-x0 >= 0) {
        g.stroke(48, 121, 171, 10);
    } else {
        g.stroke(158, 67, 62, 10);
    }
    g.ellipse(x1, y1, d, d);
}

g.endDraw();

g.save("henon.png");
