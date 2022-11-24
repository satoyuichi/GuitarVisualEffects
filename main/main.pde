SignalProcessor sp;
EffectManager em;
Renderer renderer;

void setup() {
	size(320, 240, P3D);
	// fullScreen(P3D);

	sp = new SignalProcessor(this);
	sp.setDebugMode(true);
	sp.setBias(1.0);
	sp.setInputDevice(7);
	
	renderer = new Renderer(this);
	em = new EffectManager();
	em.add(new PolygonalLineEffect());
	em.add(new WarpEffect());
	em.add(new PolarEffect());
	em.add(new BarEqualizerEffect());
}

void draw() {
	renderer.render(sp, em);
}
