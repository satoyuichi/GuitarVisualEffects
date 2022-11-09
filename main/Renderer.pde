class Renderer {
	private SignalProcesser sp;
	
	Renderer(SignalProcesser aSp) {
		sp = aSp;
	}
	
	void render(EffectManager em) {
		for(int i = 0; i < em.size(); i++) {
			Effect ef = em.get(i);
			ef.apply(sp);
		}
	}
}
