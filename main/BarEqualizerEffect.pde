class BarEqualizerEffect extends VisualEffect {
	final float AMPLITUDE = height * 0.8;
	final int SPLIT = 4;
	
	BarEqualizerEffect() {
		super();
	}

	public void apply(Renderer renderer, SignalProcessor sp) {
		int sampleSize = sp.getSampleSize();
		int w = width / (sampleSize / SPLIT);
		
		colorMode(RGB);
		strokeWeight(0);
		blendMode(ADD);
		rectMode(CORNER);

		float bias = AMPLITUDE * sp.getBias();
		for(int i = 0; i < (sampleSize / SPLIT); i++) {
			fill(lerpColor(color(32, 32, 64), color(32, 32, 255), min(0.2, sp.getSpectrum(i))));
			rect(i * w, height - sp.getSpectrum(i) * bias, w, sp.getSpectrum(i) * bias);
		}
	}
}
