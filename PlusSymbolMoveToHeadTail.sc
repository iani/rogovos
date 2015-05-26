+ Symbol {
	toHead {
		var st;
		st = this.asSynthTree;
		st.addAction = \addToHead;
		st.synth !? { st.synth.moveToHead };
		^st
	}

	toTail {
		var st;
		st = this.asSynthTree;
		st.addAction = \addToTail;
		st.synth !? { st.synth.moveToTail };
		^st;
	}
}