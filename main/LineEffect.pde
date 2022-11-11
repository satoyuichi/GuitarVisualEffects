class LineEffect extends VisualEffect {

	LineEffect() {
		super();
	}

    void loadShaders() {
		shader = loadShader("./shaders/frag/basic_frag.glsl",
                            "./shaders/vert/basic_vert.glsl");
    }
    
	public void apply(SignalProcesser sp) {
        shader(shader, LINES);
	}
}
