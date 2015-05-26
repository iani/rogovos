+ Symbol {
	abus {
		^this.getBus(\audio) ?? { this.putBus(\audio) }
	}

	kbus {
		^this.getBus(\control) ?? { this.putBus(\control) }
	}

	getBus { | rate = \audio |
		^Library.at(\busses, rate, this);
	}

	putBus { | rate = \audio |
		var newbus;
		newbus = Bus.perform(rate, Server.default, 1);
		Library.put(\busses, rate, this, newbus);
		^newbus;
	}	
}