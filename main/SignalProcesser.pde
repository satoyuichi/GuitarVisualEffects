import processing.sound.*;

class SignalProcessor {
    float bias = 1.0;

	PApplet parent;
	
	Sound sound;
	FFT fft;
	Waveform waveform;
	Amplitude amp;

	AudioIn audioIn;
	SoundFile soundFile;

	final int SAMPLES = 256;

	float[] spectrum = new float[SAMPLES];
	float ampValue;

	boolean isDebug = false;

	SignalProcessor(PApplet app) {
		parent = app;
		
		Sound.list();
		sound = new Sound(parent);

		initAnalyzer(parent);
	}

	void setDebugMode(boolean mode) {
		isDebug = mode;
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

	void setInputDevice(int i) {
		sound.inputDevice(i);

		if(isDebug) {
			soundFile = new SoundFile(parent, "strings.wav");
			soundFile.loop();
			soundFile.play();
			fft.input(soundFile);
			waveform.input(soundFile);
			amp.input(soundFile);
		}
		else {
			audioIn = new AudioIn(parent, 0);
			audioIn.start();
			fft.input(audioIn);
			waveform.input(audioIn);
			amp.input(audioIn);
		}
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

	void setBias(float b) {
		bias = b;
	}

	float getBias() {
		return bias;
	}
	
	int getSampleSize() {
		return SAMPLES;
	}
}
