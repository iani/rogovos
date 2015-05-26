Help.gui;
//:
// \a1.set(\rate, 0.25);
// \b1.set(\rate, 0.25);
\r1.set(\rate, 0.2, \amp, 3, \out, \r1.abus);

\a1f.toTail;
\b1f.toTail;
\r1f.toTail;
\r1f2.toTail;
//:

{ Rogovos.playBuf(\rog) } => \r1;
\r1.set(\out, \r1.abus);

//:
{ Rogovos.playBuf(\rog) } => \r1;

//:
{ In.ar(\r1.abus) } => \r1f;

//:
{ PanAz.ar(8, In.ar(\r1.abus), \pos.kr(0)) } => \r1f;
//:
{ PanAz.ar(8, In.ar(\r1.abus),
	LFSaw.kr(2))
} => \r1f;
//:
{
	var lbuf, src, feature, fft, resynth;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\r1.abus);
	fft = FFT(lbuf, src);
	feature = SpecCentroid.kr(fft);
	resynth = SinOsc.ar(feature, 0, 0.1);
	Out.ar(0, [src, resynth]);
} => \r1f2;

//:
{
	var lbuf, src, feature, fft, resynth;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\r1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	resynth = WhiteNoise.ar(feature);
	Out.ar(0, [src, resynth]);
} => \r1f2;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\r1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	resynth = WhiteNoise.ar(feature);
	pan = PanAz.ar(8, resynth, \pos.kr(0), \width.kr(2));
	Out.ar(0, pan);
} => \r1f2;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\r1.abus);
	fft = FFT(lbuf, src);
	feature = Amplitude.kr(src, 0.1, 0.5);
	resynth = PinkNoise.ar(feature);
	pan = PanAz.ar(8, resynth, \pos.kr(0), \width.kr(2));
	Out.ar(0, pan);
} => \r1f2;

//:
{
	var lbuf, src, feature, fft, resynth, pan;
	lbuf = LocalBuf(1024, 1);
	src = In.ar(\r1.abus);
	fft = FFT(lbuf, src);
	// feature = FFTPower.kr(fft);
	// feature = FFTSlope.kr(fft);
	featuer = SpecCentroid.kr(fft);
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

