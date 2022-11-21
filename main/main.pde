SignalProcesser sp;
EffectManager em;
Renderer renderer;

void setup() {
	size(320, 240, P3D);
	//	fullScreen(P3D);

	sp = new SignalProcesser(this);
	renderer = new Renderer(this);
	em = new EffectManager();
	em.add(new PolygonalLineEffect());
	em.add(new PolarEffect());
	em.add(new BarEqualizerEffect());
}

void draw() {
	renderer.render(sp, em);
}
