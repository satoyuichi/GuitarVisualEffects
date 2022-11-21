class WarpEffect extends VisualEffect {
	WarpEffect() {
		super();
	}

	public void apply(Renderer renderer, SignalProcessor sp) {
		blendMode(BLEND);
		imageMode(CENTER);
		tint(255, 255);
//		image(prevBg, width * 0.5, height * 0.5, width * 1.06, height * 1.06);
		image(renderer.getPrevBuffer(), width * 0.5, height * 0.5, width * 0.97, height * 0.97);
	}
}
