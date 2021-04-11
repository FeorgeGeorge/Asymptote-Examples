import geometry;
import palette;
settings.outformat = "pdf";
unitsize(3cm);

int n = 6;
pen[] Palette = Rainbow();
int step = floor(Palette.length / n);

void f(point A, point B, point C, int n, real width, int count) {
    if (n == 0) {
        return; 
    }
    point AmidB = (A + B) / 2;
    point BmidC = (B + C) / 2; 
    point CmidA = (C + A) / 2;
    
    point X = (AmidB + B + BmidC) / 3;
    point Y = (A + AmidB + CmidA) / 3;
    point Z = (BmidC + CmidA + C) / 3; 
    
    //draw(A -- B -- C -- cycle, dashed + linewidth(width));
    
    point Center = (A + B + C) / 3;
    pen thePen = Palette[count] + linewidth(width);


    draw(Center -- X, thePen); draw(Center -- Y, thePen);
    draw(Center -- Z, thePen);
    
    width /= 3;
    count += step;
    write(count);

    f(A, AmidB, CmidA, n-1, width, count);
    f(AmidB, B, BmidC, n-1, width, count);
    f(CmidA, BmidC, C, n-1, width, count);
    f(AmidB, BmidC, CmidA, n-1, width, count);
}
int size = 3;
point A = size * (0, 0);
point B = size * (0.5, sqrt(3) / 2);
point C = size * (1, 0);


f(A, B, C, n, .7, 0); 
	

