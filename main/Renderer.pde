class Renderer {
	PImage prevBB;
	PApplet parent;
	
	Renderer(PApplet app) {
		parent = app;
	}
	
	void render(SignalProcesser sp, EffectManager em) {
		loadPixels();
		prevBB = new PImage(width, height, pixels, true, parent);

		colorMode(HSB, 360, 100, 100);
		background(0, 0);

		sp.process();

		for(int i = 0; i < em.size(); i++) {
			Effect ef = em.get(i);
			ef.apply(this, sp);
		}
	}

	PImage getPrevBuffer() {
		return prevBB;
	}
}
