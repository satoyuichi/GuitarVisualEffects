class PolarEffect extends VisualEffect {
	final float R = height * 0.4;
	final float AMPLITUDE = height * 0.6;
	
	PolarEffect() {
		super();
	}

	public void apply(SignalProcesser sp) {
		float spectrum;
		
		noFill();
		strokeWeight(4);
		colorMode(HSB);
		blendMode(ADD);
		beginShape();
		for(int i = 0, bandSize = sp.getBandSize(); i < bandSize; i++) {
			spectrum = sp.getSpectrum(i);
			stroke(22, max(40, spectrum * 3600.0), 100);
			float theta = i * TWO_PI / (float)bandSize;
			vertex((R + spectrum * AMPLITUDE) * cos(theta) + width * 0.5,
				   (R + spectrum * AMPLITUDE) * sin(theta) + height * 0.5);
		}
		endShape(CLOSE);
	}
}

