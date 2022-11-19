PolygonalLineEffect ple;
SignalProcesser sp;

void setup() {
	size(320, 240, P3D);
	
	sp = new SignalProcesser(this);
	ple = new PolygonalLineEffect();
}

void draw() {
	colorMode(HSB, 360, 100, 100);
	background(128);
	sp.process();
	ple.apply(sp);
}
