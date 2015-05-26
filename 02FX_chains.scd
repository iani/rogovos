Help.gui;
//:
Server.killAll;

//:
Rogovos.stopReroute;
//:
\r1.abus;
//:
Server.default.queryAllNodes;
//:

{ Rogovos.playBuf(\rog) } => \r1;

//:

{ Out.ar(1, Rogovos.playBuf(\rog)) }.play;

//:

{ Rogovos.playBuf(\airvik) } => \a1;

//:
\a1.toTail;

//:

\r1.set(\rate, 0.1);
//:

\a1.set(\rate, 0.1);

//:
\a1.set(\amp, 3);

//:

{ In.ar(1) }.play(addAction: \addToTail);

{ Out.ar(\r1.abus, Rogovos.playBuf(\rog)) } => \r1;

//:
\r1.toHead;
//:
\r1.toTail;
//:




//:

{ In.ar(\r1.abus) }.play => \r1monitor;

//:
Server.default.queryAllNodes;
//:
\r1.fadeTime = 1;

//:
{
	var lbuf, src, onsets, fft, resynth;
	lbuf = LocalBuf(1024, 1);
	src = Rogovos.playBuf(\rog);
	fft = FFT(lbuf, src);
	onsets = Onsets.kr(fft, MouseX.kr(0, 1), \rcomplex);
	resynth = WhiteNoise.ar(EnvGen.kr(Env.perc(0.001, 0.1, 0.2), onsets));
	Out.ar(0, [src, resynth]);

} => \r1;
//:
{
	var lbuf, src, onsets, fft, resynth;
	lbuf = LocalBuf(1024, 1);
	src = Rogovos.playBuf(\rog);
	fft = FFT(lbuf, src);
	onsets = Onsets.kr(fft, 0.1, \rcomplex);
	resynth = WhiteNoise.ar(EnvGen.kr(Env.perc(0.001, 0.1, 0.2), onsets));
	Out.ar(0, [src, resynth]);
} => \r1;

//:
{
	var lbuf, src, onsets, fft, resynth, centroid;
	lbuf = LocalBuf(1024, 1);
	src = Rogovos.playBuf(\rog);
	fft = FFT(lbuf, src);
	onsets = Onsets.kr(fft, 0.1, \rcomplex);
	centroid = SpecCentroid.kr(fft);
	resynth = SinOsc.ar(
		centroid * \cmul.kr(1),
		0, EnvGen.kr(Env.perc(0.001, 0.1, 0.2), onsets));
	Out.ar(0, [src, resynth]);
} => \r1;

//:
{
	var lbuf, src, onsets, fft, resynth, centroid;
	lbuf = LocalBuf(1024, 1);
	src = Rogovos.playBuf(\rog);
	fft = FFT(lbuf, src);
	onsets = Onsets.kr(fft, 0.1, \rcomplex);
	centroid = SpecCentroid.kr(fft);
	resynth = LFDNoise1.ar(
		centroid * \cmul.kr(1),
		EnvGen.kr(Env.perc(0.1, 2.1, 0.2), onsets));
	Out.ar(0, [src, resynth]);
} => \r1;

//:
{
	var lbuf, src, onsets, fft, resynth, centroid, mix;
	lbuf = LocalBuf(1024, 1);
	src = Rogovos.playBuf(\rog);
	fft = FFT(lbuf, src);
	onsets = Onsets.kr(fft, 0.1, \rcomplex);
	centroid = SpecCentroid.kr(fft);
	mix = Mix(src, )

	resynth = LFDNoise1.ar(
		centroid * \cmul.kr(1),
		EnvGen.kr(Env.perc(0.1, 2.1, 0.2), onsets));
	
	Out.ar(0, [src, resynth]);
} => \r1;

//:
\r1.set(\rate, 0.2);


//:
{
	var lbuf, src, onsets, fft, centroid;
	var sin, lfn1, lfn0, psin;
	var smear;
	var mix, pan;

	
	lbuf = LocalBuf(1024, 1);
	src = Rogovos.playBuf(\rog);
	fft = FFT(lbuf, src);
	onsets = Onsets.kr(fft, 0.1, \rcomplex);
	centroid = SpecCentroid.kr(fft);
	mix = Mix([
		src * \srcv.kr(1),
		SinOsc.ar(
			centroid * \sinf.kr(1),
			0,
			\sinv.kr(0) * EnvGen.kr(Env.perc(0.001, 0.1, 0.2), onsets)),
		SinOsc.ar(
			centroid * \lsinf.kr(1),
			0,
			\lsinv.kr(0) * EnvGen.kr(Env.perc(0.1, 1, 0.2), onsets)),
		LFDNoise1.ar(
			Lag.kr(centroid, 1) * \lfn1f.kr(0),
			\lfn1v.kr(0), EnvGen.kr(Env.perc(0.1, 0.5, 0.2), onsets)
		
		)]);
	Out.ar(0, mix);
} => \r1;

//:
\r1.set(\rate, 0.2);
//:
\r1.set(\lfn1v, 0.02);
//:

\r1.set(\sinv, 0, \lsinv, 0);
//;

\r1.set(\cmul, 0.1
);//:

\r1.set(\cmul, 0.1
);