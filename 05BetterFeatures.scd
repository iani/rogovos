//: ================ EXTRAS ================
Help.gui;
//: ================ SOURCE + FX SETUP ================
// \a1.set(\rate, 0.25);
// \b1.set(\rate, 0.25);
\r1.set(\rate, 1, \amp, 3, \out, \r1.abus);
\r1.st.output = \r1.abus.index;

\a1f.toTail;
\b1f.toTail;
\r1f.toTail;
\r1f.fadeTime = 3;
\r1f2.toTail;
\r1f2.fadeTime = 3;
//:

//: START FIRST SOURCE, and immediately basic output;
{ Rogovos.playBuf(\rog) } => \r1;
{ In.ar(\r1.abus) } => \r1f;

\r1.set(\rate, 14, \amp, 0.02);

//: Now start panning;
{ PanAz.ar(8, In.ar(\r1.abus), \pos.kr(0)) } => \r1f;
//:
{ PanAz.ar(8, In.ar(\r1.abus) * 0.3,
	LFSaw.kr(30.reciprocal))
} => \r1f;

//: Now slowly slow the rate down
{
	(20..120) / 100 do: { | i |
		\r1.set(\rate, i);
		0.5.wait;
	};
}.fork;

//:
\r1f.set(\amp, 0.1);
//:
{
	var lbuf, src, feature, fft, resynth, pan;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\r1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	resynth = BrownNoise.ar(Lag.kr (feature, 0.4));
	pan = PanAz.ar(8, resynth, \pos.kr(0), \width.kr(2));
	Out.ar(0, pan * 0.2);
} => \r1f2;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\r1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	resynth = Ringz.ar(BrownNoise.ar(Lag.kr (feature, 0.4)), 1000, 0.1) * 0.1;
	pan = PanAz.ar(8, resynth, \pos.kr(0), \width.kr(2));
	Out.ar(0, pan);
} => \r1f2;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	var centroid;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\r1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	resynth = Ringz.ar(BrownNoise.ar(Lag.kr (feature, 0.4)),
		LFDNoise1.kr(10).range(500, 800), 0.1) * 0.1;
	pan = PanAz.ar(8, resynth, \pos.kr(0), \width.kr(2));
	Out.ar(0, pan);
} => \r1f2;
 => \r1f2;

//:
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
	Out.ar(0, pan);
} => \r1f2;

//:
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
		Lag.kr(centroid, 1), 0.1) * 0.1;
	pan = PanAz.ar(8, resynth, \pos.kr(5), \width.kr(2));
	Out.ar(0, pan);
} => \r1f2;

//:
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
		Lag.kr(centroid / 10, 1), 0.1) * 0.1;
	pan = PanAz.ar(8, resynth, \pos.kr(0), \width.kr(2));
	Out.ar(0, pan * 0.001);
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
	Out.ar(0, pan);
} => \r1f2;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\r1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 1);
	resynth = WhiteNoise.ar(feature);
	pan = PanAz.ar(8, resynth, \pos.kr(0), \width.kr(2));
	Out.ar(0, pan);
} => \r1f2;

//:
{
	var lbuf, src, feature, fft, resynth;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\r1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 1);
	resynth = PinkNoise.ar(feature);
	Out.ar(0, resynth);
} => \r1f2;

//:
{
	var lbuf, src, feature, fft, resynth;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\r1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 1);
	resynth = PinkNoise.ar(feature);
	Out.ar(0, resynth);
} => \r1f2;

//:
{
	var lbuf, src, feature, fft, resynth;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\r1.abus);
	fft = FFT(lbuf, src);
	feature = 
	resynth  = PinkNoise.ar();
	Out.ar(0, [src, resynth]);
} => \r1f2;

//:
\r1.set(\rate, 0.3);
//:

{ Rogovos.playBuf(\airvik) } => \a1;

//:

{ Rogovos.playBuf(\birdvik) } => \b1;

//:
\b1.set(\rate, 10);

