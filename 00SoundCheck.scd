//:
Server.default.queryAllNodes;
//:
ServerMeter(Server.default);
//:

~test = { | out = 2 | Out.ar(out, WhiteNoise.ar(0.01)) }.play;

//:
~test.set(\out, 1);
//:
~test.set(\out, 12);
//:
~test.set(\out, 13);
//:
~test.set(\out, 14);
//:
~test.set(\out, 15);
//:
~test.set(\out, 16);
//:
~test.set(\out, 17);
//:
~test.set(\out, 18);
//:
~test.set(\out, 19);
//:
~test.set(\out, 20);
//:
~test.set(\out, 22);
//:
~test.set(\out, 23);
//:
~test.set(\out, 21);
//:
~test.set(\out, 1);
//:
~test.set(\out, 15);

//:
~rate = 1;
r = {
	inf do: { | i |
 		~rate.wait;
		~test.set(\out, i % 12 + 12);
	};
	
}.fork;
//:
r.stop;
~test.free;
//:
Rogovos.rerouteSynth.set(\masterAmp, 0.1);
Rogovos.rerouteSynth.set(\wooferAmp, 12.1);
//:
ServerMeter(Server.default);
//:

Server.default.quit;

//:

Server.default.boot;
//:
Help.gui;
//:
Server.killAll;
//:
{ Rogovos.playBuf(\rog) } => \r1;

//:
\r1.fadeTime = 1;

//:
{ Rogovos.playBuf(\rog, startPos: 120) } => \r1;

//:
{ Rogovos.playBuf(\rog, startPos: 500) } => \r1;

//:
\r1 fadeOut: 5;
//:
{ Rogovos.playBuf(\airvik) } => \a1;
//:
\a1 fadeOut: 5;
//:
{ Rogovos.playBuf(\birdvik) } => \b1;
//:
\b1 fadeOut: 5;

//: ////////////////////////////////////////////////////////////////

//:
{
	PanAz.ar (
		8,
		Rogovos.playBuf(\rog),
	    LFSaw.kr(0.1)
	) * 4
} => \r1;

//:
{
	Out.ar(8,
		PanAz.ar (
			8,
			Rogovos.playBuf(\rog),
			LFSaw.kr(0.1)
		) * 4
	)
} => \r2;

//:
{
	Out.ar(16,
		PanAz.ar (
			8,
			Rogovos.playBuf(\rog),
			LFSaw.kr(0.1)
		) * 4
	)
} => \r3;

//:
{
	PanAz.ar (
		8,
		WhiteNoise.ar(0.01),
	    LFSaw.kr(0.1)
	) * 10
} => \r1;

//:
{ Out.ar(6, WhiteNoise.ar(0.02))}.play;

//:
{
	PanAz.ar (
		14,
		Rogovos.playBuf(\airvik, startPos: 200000),
	    4
	)
} => \r1;

//:
{
	PanAz.ar (
		14,
		Rogovos.playBuf(\birdvik),

	)
} => \r1;

//:
\r1.fadeTime = 1;

//:
\r1.set (\rate, 2);

//:
{
	PanAz.ar (
		14,
		Rogovos.playBuf(\rog, startPos: 200000),
	    4
	)
} => \r1;

//:

\r1.free;
\r2.free;
\r3.free;
//:

{ Out.ar(23, WhiteNoise.ar(0.01))}.play;