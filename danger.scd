//: DANGER
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\r1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 0.4)),
		centroid, 0.1) * 0.1;
	pan = PanAz.ar(8, resynth, \pos.kr(0), \width.kr(2));
	Out.ar(12, pan );
} => \r1f2;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\r1.abus);
	fft = FFT(lbuf, src);
	// feature = FFTPower.kr(fft);
	// feature = FFTSlope.kr(fft);
	feature = SpecCentroid.kr(fft);
	resynth = PinkNoise.ar(feature / 100);
	pan = PanAz.ar(8, resynth, \pos.kr(0), \width.kr(2));
	Out.ar(12, pan);
} => \r1f2