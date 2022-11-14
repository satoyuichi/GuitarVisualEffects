LineEffect le;
SignalProcesser sp;

void setup() {
//    fullScreen(P3D);
	size(320, 240, P3D);

    le = new LineEffect();
    sp = new SignalProcesser();
}

void draw() {
    le.apply(sp);
}
