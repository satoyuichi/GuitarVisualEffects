abstract class VisualEffect implements Effect {
	PShader shader;

	VisualEffect() {
		loadShaders();
	}

    abstract void loadShaders();
}
