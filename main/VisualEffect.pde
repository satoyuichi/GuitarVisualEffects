abstract class VisualEffect implements Effect {
	PShader shader;
    PMatrix3D l2w;      /* local2world */
    PMatrix3D w2v;      /* world2view */
    PMatrix3D v2p;      /* view2projection */
    PMatrix3D mvp;
    float nearClip = 0.01, farClip = 1000.0;
    

	VisualEffect() {
		loadShaders();
        initMatrixes();
	}

    abstract void loadShaders();

    void initMatrixes() {
        l2w = new PMatrix3D();
        l2w.reset();
        w2v = new PMatrix3D(
			1.0, 0.0, 0.0, 0.0,
			0.0, 1.0, 0.0, 0.0,
			0.0, 0.0, 1.0, -10.0,
			0.0, 0.0, 0.0, 1.0
			);
        v2p = new PMatrix3D(
            2.0 / width, 0.0, 0.0, -1.0,
            0.0, 2.0 / height, 0.0,  -1.0,
            0.0, 0.0, -1.0 / (farClip - nearClip), -nearClip / (farClip - nearClip),
            0.0, 0.0, 0.0, 1.0
            );
        mvp = new PMatrix3D();
        
        preMatrix();
    }

    void preMatrix() {
        mvp.reset();
        mvp.preApply(l2w);
        mvp.preApply(w2v);
        mvp.preApply(v2p);
    }

    void setUniforms() {
		this.shader.set("uTime", millis());
        this.shader.set("uWorld", l2w);
        this.shader.set("uCamera", w2v);
        this.shader.set("uProjection", v2p);
        this.shader.set("uMVP", mvp);
    }
}
