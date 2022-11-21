class BarEqualizerEffect extends VisualEffect {
	final float AMPLITUDE = height * 0.8;

	BarEqualizerEffect() {
		super();
	}

	public void apply(Renderer renderer, SignalProcessor sp) {
		int sampleSize = sp.getSampleSize();
		int split = 8;
		int w = width / (sampleSize / split);
		
		colorMode(RGB);
		fill(0, 0, 128);
		strokeWeight(0);
		blendMode(ADD);
		rectMode(CORNER);
		
		for(int i = 0; i < (sampleSize / split); i++) {
			rect(i * w, height - sp.getSpectrum(i) * AMPLITUDE, w, sp.getSpectrum(i) * AMPLITUDE);
		}
	}
}
