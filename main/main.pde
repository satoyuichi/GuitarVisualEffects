PolygonalLineEffect ple;
PolarEffect pe;
SignalProcesser sp;

void setup() {
	//	fullScreen(P3D);
	size(320, 240, P3D);
	
	sp = new SignalProcesser(this);
	ple = new PolygonalLineEffect();
	pe = new PolarEffect();
}

void draw() {
	colorMode(HSB, 360, 100, 100);
	background(0);
	sp.process();
	ple.apply(sp);
	pe.apply(sp);
}
