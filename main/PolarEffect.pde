class PolarEffect extends VisualEffect {
	final float R = height * 0.2;
	final float AMPLITUDE = height * 0.6 * SignalProcessor.BIAS;
	
	PolarEffect() {
		super();
	}

	public void apply(Renderer renderer, SignalProcessor sp) {
		float spectrum;
		
		noFill();
		strokeWeight(5);
		colorMode(HSB, 360, 100, 100);
		blendMode(ADD);
		beginShape();
		for(int i = 0, sampleSize = sp.getSampleSize(); i < sampleSize; i++) {
			spectrum = sp.getSpectrum(i);
			stroke(22, max(40, spectrum * 3600.0), 100);
			float theta = i * TWO_PI / (float)sampleSize;
			float rOffset = sp.getAmplitude() * 16.0 * SignalProcessor.BIAS * 0.5;
            rOffset *= rOffset;
			vertex((R + rOffset + spectrum * AMPLITUDE) * cos(theta) + width * 0.5,
				   (R + rOffset + spectrum * AMPLITUDE) * sin(theta) + height * 0.5);
		}
		endShape(CLOSE);
	}
}
