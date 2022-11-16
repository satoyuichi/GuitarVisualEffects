class LineEffect extends VisualEffect {
	PVector[] vertexes = new PVector[2];
	
	LineEffect() {
		super();

		vertexes[0] = new PVector(-width, height * 0.5f, 0.0);
		vertexes[1] = new PVector(width, height * 0.5f, 0.0);
	}

    void loadShaders() {
		this.shader = loadShader("./shaders/frag/basic_frag.glsl",
								 "./shaders/vert/basic_vert.glsl");
        this.shader.bind();
    }
    
	public void apply(SignalProcesser sp) {
//		background(255);

		preMatrix();
        setUniforms();
		shader(this.shader);
//        beginShape(LINES);
		for(int i = 0; i < vertexes.length; i++) {
			vertex(vertexes[i].x, vertexes[i].y, 0.0);
//			line(vertexes[i].x, vertexes[i].y, vertexes[i + 1].x, vertexes[i + 1].y);
		}
//        box(300);
//        endShape();
		resetShader();
	}
}
