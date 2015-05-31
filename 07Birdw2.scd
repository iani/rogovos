\b1f.toTail;
\b1f.toTail;
\b1f.fadeTime = 3;
\b1f.fadeTime = 3;

\b1.st.output = \b1.abus.index;
//:
{ Rogovos.playBuf(\birdvik) } => \b1;
{ In.ar(\b1.abus) } => \b1f;

//: Now start panning;
{
	Out.ar(
		24,
		PanAz.ar(8, In.ar(\b1.abus), \pos.kr(2))
	)
}  => \b1f;
//: Now start panning;
{
	Out.ar(
		24 + 8,
		PanAz.kr(4, In.ar(\b1.abus),
			LFSaw.kr(20.reciprocal) * -1
		) * 0.5
	)
}  => \b1f;
//:
\b1.set(\rate, 0.25725);
//:
//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\b1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 0.4)),
		Lag.kr(centroid / 4, 1), 0.1) * 0.01;
	pan = PanAz.kr(8, resynth, LFSaw.kr(10.reciprocal), \width.kr(2));
	Out.ar(24, pan * 0.5);
} => \b1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\b1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 0.4)),
		Lag.kr(centroid / [4, 5], 1), 0.1) * 0.01;
	pan = PanAz.kr(8, Mix(resynth), \pos.kr(0), \width.kr(2));
	Out.ar(24, pan);
} => \b1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\b1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 0.4)),
		Lag.kr(centroid / [4, 5, 6], 1), 0.1) * 0.04;
	pan = PanAz.kr(4, Mix(resynth), \pos.kr(0), \width.kr(2));
	Out.ar(24 + 8, pan);
} => \b1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\b1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 0.4)),
		Lag.kr(centroid / [4, 5, 6, 7], 1), 0.1) * 0.04;
	pan = PanAz.kr(4, Mix(resynth), \pos.kr(0), \width.kr(2));
	Out.ar(24 + 8, pan);
} => \b1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\b1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 0.4)),
		Lag.kr(centroid + LFNoise0.kr(1).range(100, 2000) / [4, 5, 6, 7], 1), 0.1) * 0.01;
	pan = PanAz.kr(4, Mix(resynth), \pos.kr(0), \width.kr(2));
	Out.ar(24 + 8, pan);
} => \b1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\b1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 4.4)),
		Lag.kr(centroid + LFNoise0.kr(01).range(100, 2000) / [4, 5, 6, 7], 10), 0.1) * 0.01;
	pan = PanAz.kr(4, Mix(resynth), \pos.kr(0), \width.kr(2));
	Out.ar(24 + 8, pan);
} => \b1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\b1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 4.4)),
		Lag.kr(centroid / [4, 5, 6, 7], 10) + LFNoise0.kr(10).range(100, 2000), 0.1) * 0.01;
	pan = PanAz.kr(8, Mix(resynth), \pos.kr(0), \width.kr(2));
	Out.ar(24, pan);
} => \b1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\b1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 4.4)),
		Lag.kr(centroid / [4, 5, 6, 7], 10) + LFNoise0.kr(10).range(10, 200), 0.1) * 0.01;
	pan = PanAz.kr(4, Mix(resynth), \pos.kr(0), \width.kr(2));
	Out.ar(24 + 8, pan * 0.05);
} => \b1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\b1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 4.4)),
		Lag.kr(centroid / [4, 5, 6, 7], 10) + LFNoise0.kr(10).range(10, 200), 0.1) * 0.01;
	pan = PanAz.ar(8, Mix(resynth), \pos.kr(0), \width.kr(2));
	Out.ar(24, pan * 0.45);
} => \b1f;

//:

//:
Help.gui;