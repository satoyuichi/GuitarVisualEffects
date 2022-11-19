import processing.sound.*;

class SignalProcesser {
	Sound sound;
	FFT fft;
	AudioIn audioIn;
	SoundFile soundFile;
	Waveform waveform;

	final int BANDS = 1024;

	float[] spectrum = new float[BANDS];

	SignalProcesser(PApplet parent) {
		Sound.list();
		sound = new Sound(parent);
		sound.inputDevice(0);

		fft = new FFT(parent, BANDS);
		audioIn = new AudioIn(parent, 0);

//		audioIn.start();
//		fft.input(audioIn);

		soundFile = new SoundFile(parent, "strings.wav");
		soundFile.loop();
		soundFile.play();
		fft.input(soundFile);
	}

	void process() {
		fft.analyze(spectrum);
	}

	float getSpectrum(int i) {
		return spectrum[i];
	}

	void tearDown() {
		audioIn.stop();
	}

	int getBandSize() {
		return BANDS;
	}
}
