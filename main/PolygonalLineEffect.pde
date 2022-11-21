class PolygonalLineEffect extends VisualEffect {
	final float AMPLITUDE = height * 0.5;

	PolygonalLineEffect() {
		super();
	}

	public void apply(Renderer renderer, SignalProcesser sp) {
		float spectrum;

		noFill();
		strokeWeight(2);
		colorMode(HSB);
		blendMode(BLEND);
		beginShape();
		for(int i = 0, sampleSize = sp.getSampleSize(); i < sampleSize; i++) {
			spectrum = sp.getWaveform(i);
			stroke(spectrum * 3600.0, spectrum * 3600.0, 100);
			vertex(i * width / sampleSize, height * 0.5 + spectrum * AMPLITUDE);
		}
		endShape();
	}
}
