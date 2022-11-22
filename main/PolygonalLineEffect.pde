class PolygonalLineEffect extends VisualEffect {
	final float AMPLITUDE = height * 0.3 * SignalProcessor.BIAS;

	PolygonalLineEffect() {
		super();
	}

	public void apply(Renderer renderer, SignalProcessor sp) {
		float spectrum;

		noFill();
		strokeWeight(3);
		colorMode(RGB);
		blendMode(BLEND);
		beginShape();
		for(int i = 0, sampleSize = sp.getSampleSize(); i < sampleSize; i += 4) {
			spectrum = sp.getWaveform(i);
            stroke(128 + spectrum * 255);
			curveVertex(i * width / sampleSize, height * 0.5 + spectrum * AMPLITUDE);
		}
		endShape();
	}
}
