\a1f.toTail;
\b1f.toTail;
\a1f.fadeTime = 3;
\b1f.fadeTime = 3;

\a1.st.output = \a1.abus.index;
//:
{ Rogovos.playBuf(\airvik) } => \a1;
{ In.ar(\a1.abus) } => \a1f;

//: Now start panning;
{
	Out.ar(
		0,
		PanAz.ar(8, In.ar(\a1.abus), \pos.kr(2))
	)
}  => \a1f;
//: Now start panning;
{
	Out.ar(
		0,
		PanAz.ar(8, In.ar(\a1.abus),
			LFSaw.kr(10.reciprocal)
		)
	)
}  => \a1f;
//:
\a1.set(\rate, 0.5);
//:
//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\a1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 0.4)),
		Lag.kr(centroid / 4, 1), 0.1) * 0.01;
	pan = PanAz.ar(8, resynth, \pos.kr(0), \width.kr(2));
	Out.ar(0, pan);
} => \a1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\a1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 0.4)),
		Lag.kr(centroid / [4, 5], 1), 0.1) * 0.01;
	pan = PanAz.ar(8, Mix(resynth), \pos.kr(0), \width.kr(2));
	Out.ar(0, pan);
} => \a1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\a1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 0.4)),
		Lag.kr(centroid / [4, 5, 6], 1), 0.1) * 0.01;
	pan = PanAz.ar(8, Mix(resynth), \pos.kr(0), \width.kr(2));
	Out.ar(0, pan);
} => \a1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\a1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 0.4)),
		Lag.kr(centroid / [4, 5, 6, 7], 1), 0.1) * 0.01;
	pan = PanAz.ar(8, Mix(resynth), \pos.kr(0), \width.kr(2));
	Out.ar(0, pan);
} => \a1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\a1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 0.4)),
		Lag.kr(centroid + LFNoise0.kr(1).range(100, 2000) / [4, 5, 6, 7], 1), 0.1) * 0.01;
	pan = PanAz.ar(8, Mix(resynth), \pos.kr(0), \width.kr(2));
	Out.ar(0, pan);
} => \a1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\a1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 4.4)),
		Lag.kr(centroid + LFNoise0.kr(1).range(100, 2000) / [4, 5, 6, 7], 10), 0.1) * 0.01;
	pan = PanAz.ar(8, Mix(resynth), \pos.kr(0), \width.kr(2));
	Out.ar(0, pan);
} => \a1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\a1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 4.4)),
		Lag.kr(centroid / [4, 5, 6, 7], 10) + LFNoise0.kr(10).range(100, 2000), 0.1) * 0.01;
	pan = PanAz.ar(8, Mix(resynth), \pos.kr(0), \width.kr(2));
	Out.ar(0, pan);
} => \a1f;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\a1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	centroid = SpecCentroid.kr(fft);
	resynth = Ringz.ar(
		BrownNoise.ar(Lag.kr (feature, 4.4)),
		Lag.kr(centroid / [4, 5, 6, 7], 10) + LFNoise0.kr(10).range(10, 200), 0.1) * 0.01;
	pan = PanAz.ar(8, Mix(resynth), \pos.kr(0), \width.kr(2));
	Out.ar(0, pan);
} => \a1f;

//:

//:
Help.gui;