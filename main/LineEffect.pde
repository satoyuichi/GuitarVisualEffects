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
    }
    
	public void apply(SignalProcesser sp) {
//		background(255);
		
		/* beginCamera(); { */
		/* 	camera( */
		/* 		width / 2.0, height / 2.0, 0.0, // eye */
		/* 		width / 2.0, height / 2.0, 0.0, // center */
		/* 		0.0, 1.0, 0.0 // up */
		/* 		); */
		/* } endCamera(); */

        setUniforms();
		shader(this.shader, LINES);
		beginShape(LINES); {
			for(int i = 0; i < vertexes.length; i++) {
 				vertex(vertexes[i].x, vertexes[i].y, 0.0, 1.0);
			}
		} endShape();
		resetShader();
	}
}
