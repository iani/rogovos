

Rogovos {
	classvar <samplePath = "/Users/iani/Music/sounds/150524Rogovos/";
	classvar <rog, <airvik, <birdvik;
	
	*initClass {
		StartUp add: {
			Server.default doWhenBooted: {
				// Rerouting to jump over disconnected MOTU outputs
				// This is Andre Bartetzki's fix, because setting
				// outpuStreamsEnabled makes the Server unable to boot.
				SynthDef("reroute", {
					var sig;
					sig = In.ar(0, 23);
					ReplaceOut.ar(2, sig[0..7]);
					ReplaceOut.ar(14, sig[8..15]);
					ReplaceOut.ar(22, sig[16..23]);
				
				}).play(Server.default, nil, \addAfter);
				"Loading samples for Rogovos".postln;
				rog = this.loadBuf("rog");
				airvik = this.loadBuf("airvik");
				birdvik = this.loadBuf("birdvik");
				// { [rog, airvik, birdvik] do: _.updateInfo; } defer: 3;
				{ [rog, airvik, birdvik] do: _.postln; } defer: 3.5;
			};
			Server.default.options.numOutputBusChannels = 30;
			// Server does not boot with outputStreamsEnabled set!
			// MOTU driver <-> SC problem?
			//Server.default.options.outputStreamsEnabled = "010011";
			if (Server.default.serverRunning.not) { Server.default.boot };
		}
	}

	*loadBuf { | sampname |
		(samplePath ++ sampname ++ ".wav").postln;
		^Buffer.read(Server.default, samplePath ++ sampname ++ ".wav");
	}

	*playBuf { | buf = \rog startPos = 0 loop = 0 rate = 1 |
		buf = this.perform (buf).bufnum;
		^PlayBuf.ar(
			// numChannels, bufnum: 0, rate: 1, trigger: 1, startPos: 0, loop: 0, doneAction: 0
			1,
			buf,
			BufRateScale.ir (buf) * \rate.kr (rate),
			\trigger.kr (1),
			\startPos.kr (startPos) * 44100,
			\loop.kr (loop),
			doneAction: 2
		)
	}
}