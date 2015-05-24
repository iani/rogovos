Rogovos {
	classvar <samplePath = "/Users/iani/Music/sounds/150524Rogovos/";
	classvar <rog, <airvik, <birdvik;
	
	*initClass {
		StartUp add: {
			Server.default doWhenBooted: {
				"Loading samples for Rogovos".postln;
				rog = this.loadBuf("rog");
				airvik = this.loadBuf("airvik");
				birdvik = this.loadBuf("birdvik");
				// { [rog, airvik, birdvik] do: _.updateInfo; } defer: 3;
				{ [rog, airvik, birdvik] do: _.postln; } defer: 3.5;
			};
			Server.default.options.numOutputBusChannels = 14;
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
			\startPos.kr (startPos),
			\loop.kr (loop),
			doneAction: 2
		)
	}
}