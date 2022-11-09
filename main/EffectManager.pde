class EffectManager {
	private ArrayList<Effect> effects;

	EffectManager() {
		effects = new ArrayList<Effect>();
	}

	public void add(Effect e) {
		effects.add(e);
	}

	public Effect get(int i) {
		return effects.get(i);
	}

	public int size() {
		return effects.size();
	}
}
