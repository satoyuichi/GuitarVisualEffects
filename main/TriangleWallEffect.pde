class TriangleWallEffect extends VisualEffect {
	final int OFFSET = 32;
	final int H_OFFSET = OFFSET >> 1;
	
	TriangleWallEffect() {
		super();
 	}

	public void apply(Renderer renderer, SignalProcessor sp) {
		noFill();
		strokeWeight(2);
		stroke(255, 255);

		beginCamera(); {
			perspective();
		} endCamera();

		boolean isShift = false;
		for(int y = -100; y < height + 100; y += OFFSET) {
			for(int x = -100 + (isShift ? 0 : H_OFFSET); x < width + 100; x += OFFSET) {
				beginShape();
				vertex(x, y + OFFSET, 0);
				vertex(x + H_OFFSET, y, 0);
				vertex(x + OFFSET, y + OFFSET, 0);
				endShape(CLOSE);
			}
			isShift = !isShift;
		}
	}
}
