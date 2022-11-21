import processing.sound.*;

class SignalProcessor {
	Sound sound;
	FFT fft;
	Waveform waveform;
	Amplitude amp;

	AudioIn audioIn;
	SoundFile soundFile;

	final int SAMPLES = 512;

	float[] spectrum = new float[SAMPLES];
	float ampValue;

	SignalProcessor(PApplet parent) {
		Sound.list();
		sound = new Sound(parent);
		sound.inputDevice(0);

		initAnalyzer(parent);

		audioIn = new AudioIn(parent, 0);

//		audioIn.start();
//		fft.input(audioIn);

		soundFile = new SoundFile(parent, "strings.wav");
		soundFile.loop();
		soundFile.play();
		fft.input(soundFile);
		waveform.input(soundFile);
		amp.input(soundFile);
	}

	void initAnalyzer(PApplet parent) {
		fft = new FFT(parent, SAMPLES);
		waveform = new Waveform(parent, SAMPLES);
		amp = new Amplitude(parent);
	}

	void process() {
		fft.analyze(spectrum);
		waveform.analyze();
		ampValue = amp.analyze();
	}

	float getSpectrum(int i) {
		return spectrum[i];
	}

	float getWaveform(int i) {
		return waveform.data[i];
	}

	float getAmplitude() {
		return ampValue;
	}

	void tearDown() {
		audioIn.stop();
	}

	int getSampleSize() {
		return SAMPLES;
	}
}
