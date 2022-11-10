abstract class VisualEffect implements Effect {
	PShader shader;
	final String fragSource = "";
	final String vertSource = "";

	VisualEffect() {
		shader = loadShader(fragSource, vertSource);
	}
}
