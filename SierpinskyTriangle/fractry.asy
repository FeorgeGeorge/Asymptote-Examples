import geometry;
unitsize(1cm);


void f(point A, point B, point C, int n, real width) {
    if (n == 0) {
        return; 
    }
    point AmidB = (A + B) / 2;
    point BmidC = (B + C) / 2;
    point CmidA = (C + A) / 2;
   
    draw(A -- B -- C -- cycle, linewidth(width));
    width /= 3;
    f(A, AmidB, CmidA, n-1, width);
    f(AmidB, B, BmidC, n-1, width);
    f(CmidA, BmidC, C, n-1, width);
    
}

int n = 3;
int size = 3; 

point A = size * (0, 0);
point B = size * (0.5, sqrt(3) / 2);
point C = size * (1, 0);

f(A,B,C, 8, .7); 
	
