

Rogovos {
	classvar <samplePath = "/Users/iani/Music/sounds/150524Rogovos/";
	classvar <rog, <airvik, <birdvik;
	classvar <rerouteSynth;
	
	*initClass {
		StartUp add: {
			Server.default doWhenBooted: {
				// Rerouting to jump over disconnected MOTU outputs
				// This is Andre Bartetzki's fix, because setting
				// outpuStreamsEnabled makes the Server unable to boot.
				// Disabled for Corfu
				this.startReroute;
				"Loading samples for Rogovos".postln;
				rog = this.loadBuf("rog");
				airvik = this.loadBuf("airvik");
				birdvik = this.loadBuf("birdvik");
				// { [rog, airvik, birdvik] do: _.updateInfo; } defer: 3;
				{ [rog, airvik, birdvik] do: _.postln; } defer: 3.5;
			};
			Server.default.options.numOutputBusChannels = 46;
			// Server.default.options.outputStreamsEnabled = "100111";
			// Server.default.options.inputStreamsEnabled = "111111";

			// Server does not boot with outputStreamsEnabled set!
			// MOTU driver <-> SC problem?
			// Server.default.options.outputStreamsEnabled = "010011";
			if (Server.default.serverRunning.not) { Server.default.boot };
		}
	}


	*startReroute {
		if (rerouteSynth.isNil) {
			rerouteSynth = SynthDef("reroute", { | wooferAmp = 1, masterAmp = 1 |
				var sig;
				// sig = In.ar(0, 11);
				// ReplaceOut.ar(0, sig[0..7] * masterAmp);

				// ReplaceOut.ar(12, sig[8..10] * masterAmp);
				// ReplaceOut.ar(16, Mix(sig) * wooferAmp);
				ReplaceOut.ar(0, masterAmp * In.ar(24 + 0));
				ReplaceOut.ar(2, masterAmp * In.ar(24 + 1));
				ReplaceOut.ar(1, masterAmp * In.ar(24 + 2));
				ReplaceOut.ar(4, masterAmp * In.ar(24 + 3));
				ReplaceOut.ar(7, masterAmp * In.ar(24 + 4));
				ReplaceOut.ar(5, masterAmp * In.ar(24 + 5));
				ReplaceOut.ar(6, masterAmp * In.ar(24 + 6));
				ReplaceOut.ar(3, masterAmp * In.ar(24 + 7));
				ReplaceOut.ar(12, masterAmp * In.ar(24 + 8));
				ReplaceOut.ar(13, masterAmp * In.ar(24 + 9));
				ReplaceOut.ar(14, masterAmp * In.ar(24 + 11));
				ReplaceOut.ar(15, masterAmp * In.ar(24 + 10));



				
				ReplaceOut.ar(8, Silent.ar);
				ReplaceOut.ar(9, Silent.ar);
				ReplaceOut.ar(10, Silent.ar);
				ReplaceOut.ar(11, Silent.ar);				

				
				// ReplaceOut.ar(22, sig[16..23]);
			}).play(Server.default, nil, \addAfter);
			rerouteSynth.onEnd (this, {
				rerouteSynth = nil;
				"Reroute synth was stopped".postln;
			});
			"Reroute started".postln;
		}{
			"Reroute synth still running. Try Rogovos.stopReroute".postln;
		}
	}

	*stopReroute {
		if (rerouteSynth.isNil) {
			"No reroute synth is running. Doing nothing".postln;
		}{
			rerouteSynth.free;
			rerouteSynth = nil;
			"Stopped rerouting".postln;
		};
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