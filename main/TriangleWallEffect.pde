class TriangleWallEffect extends VisualEffect {
	final int OFFSET = height / 16;
	final int H_OFFSET = OFFSET >> 1;
	final float Z_BIAS = 32.0;
	
	TriangleWallEffect() {
		super();
 	}

	private void drawTriangle(int x, int y, float r, float denominator) {
		int i = abs((int)(sp.getSampleSize() * (x * y) / denominator));
		float z = sp.getSpectrum(i) * sp.getBias() * Z_BIAS;

		if(z < 4.0) {
			return;
		}

		float f = z / Z_BIAS;
		stroke(176, 100, 100, 255.0 * f);

		pushMatrix(); {
			translate(x, y, z);
			scale(sp.getAmplitude() * sp.getBias() * 2.0);
			rotateZ(r);

			beginShape(); {
				vertex(0.0, OFFSET, 0.0);
				vertex(H_OFFSET, 0.0, 0.0);
				vertex(OFFSET, OFFSET, 0.0);
			} endShape(CLOSE);
		} popMatrix();
	}
	
	public void apply(Renderer renderer, SignalProcessor sp) {
		noFill();
		strokeWeight(2);
		colorMode(HSB, 360, 100, 100);

		beginCamera(); {
			perspective();
		} endCamera();

		float denominator = (height + OFFSET * 2) * (width + OFFSET * 2);
		for(int y = -OFFSET * 2; y < height + OFFSET * 2; y += OFFSET) {
			for(int x = -OFFSET * 2; x < width + OFFSET * 2; x += OFFSET) {
				drawTriangle(x, y, 0.0, denominator);
				drawTriangle(x + H_OFFSET, y, PI, denominator);
			}
		}
	}
}
