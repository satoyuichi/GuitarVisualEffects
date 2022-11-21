PolygonalLineEffect ple;
PolarEffect pe;
BarEqualizerEffect bef;
SignalProcesser sp;

void setup() {
	//size(320, 240, P3D);
	fullScreen(P3D);
	
	sp = new SignalProcesser(this);
	ple = new PolygonalLineEffect();
	pe = new PolarEffect();
	bef = new BarEqualizerEffect();
}

void draw() {
	colorMode(HSB, 360, 100, 100);
	background(0);
	sp.process();

	ple.apply(sp);
	pe.apply(sp);
	bef.apply(sp);
}
