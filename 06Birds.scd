//:

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
		24 + 8,
		PanAz.ar(4, In.ar(\a1.abus), \pos.kr(2))
	)
}  => \a1f;
//: Now start panning;
{
	Out.ar(
		24 + 8,
		PanAz.ar(4, In.ar(\a1.abus),
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
	Out.ar(24, pan);
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
	Out.ar(24, pan);
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
	Out.ar(24, pan);
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
	Out.ar(24, pan);
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
	Out.ar(24, pan);
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
	Out.ar(24, pan);
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
	Out.ar(24, pan);
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
	Out.ar(24 + 8, pan);
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
		Lag.kr(centroid / 4 / [4, 5, 6, 7], 10) + LFNoise1.kr(0.1).range(250, 2000), 0.1) * 0.01;
	pan = PanAz.ar(8, Mix(resynth), \pos.kr(0), \width.kr(2));
	Out.ar(24, pan);
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
		BrownNoise.ar(Lag.kr (feature, 14.4)),
		Lag.kr(centroid / 0.5 / [4, 5, 6, 7], 10) + LFNoise0.kr(0.5).range(10, 200), 0.1) * 0.01;
	pan = PanAz.ar(8, Mix(resynth), \pos.kr(0), \width.kr(2));
	Out.ar(24, pan);
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
		BrownNoise.ar(Lag.kr (feature, 14.4)),
		Lag.kr(centroid / 0.5 / [4, 5, 6, 7], 10) + LFNoise1.kr(0.5).range(10, 1200), 0.1) * 0.01;
	pan = PanAz.ar(8, Mix(resynth), \pos.kr(0), \width.kr(2));
	Out.ar(24, pan);
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
		BrownNoise.ar(Lag.kr (feature, 14.4)),
		Lag.kr(centroid / 0.5 / [4, 5, 6, 7], 10) + LFNoise1.kr(0.5).range(10, 1200), 0.1) * 0.01;
	pan = PanAz.ar(8, Mix(resynth), \pos.kr(0), \width.kr(2));
	Out.ar(24, pan * 0.1);
} => \a1f;

//:


//:
Help.gui;

{ Rogovos.playBuf(\airvik, rate: 0.01) } => \a1;
{ Rogovos.playBuf(\airvik, rate: 2.01) } => \a1;
