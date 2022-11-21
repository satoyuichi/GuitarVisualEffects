class PolygonalLineEffect extends VisualEffect {
	final float AMPLITUDE = height * 0.6 * 5.0;

	PolygonalLineEffect() {
		super();
	}

	public void apply(SignalProcesser sp) {
		float spectrum;

		noFill();
		strokeWeight(2);
		colorMode(HSB);
		blendMode(BLEND);
		beginShape();
		for(int i = 0, bandSize = sp.getBandSize(); i < bandSize; i++) {
			spectrum = sp.getSpectrum(i);
			stroke(spectrum * 3600.0, spectrum * 3600.0, 100);
			vertex(i * width / bandSize, height * 0.5 - spectrum * AMPLITUDE);
		}
		endShape();
	}
}
