class PolygonalLineEffect extends VisualEffect {
	PolygonalLineEffect() {
		super();
	}

	public void apply(SignalProcesser sp) {
		noFill();
		beginShape();
		for(int i = 0; i < sp.getBandSize(); i++) {
			colorMode(HSB);
			stroke(sp.getSpectrum(i) * 3600.0, sp.getSpectrum(i) * 3600.0, 100);
			vertex(i * width / sp.getBandSize(), height * 0.5 - sp.getSpectrum(i) * 1000.0);
		}
		endShape();
	}
}
