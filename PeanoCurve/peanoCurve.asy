settings.outformat = "pdf";
import geometry;
import palette;
unitsize(1.5cm);

void construct(pair[] pairs, real bold) {
    int count = 0;
    pen[] Palette = Rainbow();
    int rate = 16;
    int step = floor((rate * Palette.length) / pairs.length);
    for (int i = 0; i < pairs.length-1; i = i+1) {
        if (i % rate == 0) { 
            count = count + step;
            //write(count);
        }

        draw(pairs[i] -- pairs[i+1], Palette[count]+ linewidth(bold));
    }
}

pair[] q = {(-.5,-.5), (-.5,.5), (.5,.5), (.5,-.5)};

void peano(pair[] l, int n, real boldness) {
    if (n == 0) {
        construct(l, boldness);
        return;
    }
    pair[] quad1 = shift(left+down) * rotate(-90, (0,0)) * xscale(-1) * l;
    pair[] quad2 = shift(left+up) * l;
    pair[] quad3 = shift(right+up) * l;
    pair[] quad4 = shift(right+down) * rotate(90, (0,0)) * xscale(-1) * l;

    peano(scale(1/2) * concat(quad1, quad2, quad3, quad4), n - 1, boldness/2);    	  
}

peano(q, 5, 8);
