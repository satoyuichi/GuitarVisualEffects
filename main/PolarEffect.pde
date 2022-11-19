class PolarEffect extends VisualEffect {
	final int R = 100;
	
	PolarEffect() {
		super();
	}

	public void apply(SignalProcesser sp) {
		float spectrum;
		
		noFill();
		strokeWeight(4);
		colorMode(HSB);
		beginShape();
		for(int i = 0, bandSize = sp.getBandSize(); i < bandSize; i++) {
			spectrum = sp.getSpectrum(i);
			stroke(22, spectrum * 3600.0, 100);
			float theta = i * TWO_PI / (float)bandSize;
			vertex((R + spectrum * 100.0) * cos(theta) + width * 0.5, (R + spectrum * 100.0) * sin(theta) + height * 0.5);
		}
		endShape(CLOSE);
	}
}

