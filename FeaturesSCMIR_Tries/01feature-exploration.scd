//: Create test file

Server.default.prepareForRecord;

//:

~test = { SinOsc.ar(Line.kr(2, 10, 10, doneAction: 2), 0, 0.1) }.play;
~test.onEnd(\tester, {
	Server.default.stopRecording;
	"Done".postln;
});
Server.default.record;

//:
~buffer = Buffer.read(Server.default, "/Users/iani/Music/SuperCollider Recordings/SC_150522_193517.aiff");
~buffer.plot;
//:
f = SCMIRAudioFile(Platform.resourceDir +/+ "sounds/a11wlk01.wav", [[Loudness], [SpecCentroid], [SpecPcile, 0.95], [SpecPcile, 0.8], [SpecFlatness], [FFTCrest], [FFTCrest, 0, 2000], [FFTCrest, 2000, 10000], [FFTSpread], [FFTSlope], [SensoryDissonance]]);


//:
f = SCMIRAudioFile(Platform.resourceDir +/+ "sounds/a11wlk01.wav", [[Loudness], [SpecCentroid], [SpecPcile, 0.95], [SensoryDissonance]]);


//:
f = SCMIRAudioFile(Platform.resourceDir +/+ "sounds/a11wlk01.wav", [[Loudness]]);


//:

(
f.extractFeatures(); 
f.extractOnsets();
)
//:
f.onsetdata;
//:
f.numonsets;
//:
f.gatherFeaturesByOnsets; //after this operation, featuredata will be onset locked; if referencing specific frames, must use onsetdata to get (starting) times
//:
f.featuresbysegments; //this flag has now been set to true
//:
//should now be same:
f.featuredata.size/f.numfeatures;
//:
f.numonsets;

////////////////////////////////////////////////////////////////
//:
f.featuredata.inspect;
//:
f.featuredata.size;
//:
f.numfeatures;
//:
f.featuredata.size * 14;

//:
2 ** (0..12)
//:
Help.gui;
//: //////////////////////////////////////////////////////////////

f.plotFeatures;

f.inspect;

//:

~tests = [[Loudness], [SpecCentroid], [SpecPcile, 0.95], [SpecPcile, 0.8], [SpecFlatness], [FFTCrest], [FFTCrest, 0, 2000], [FFTCrest, 2000, 10000], [FFTSpread], [FFTSlope], [SensoryDissonance]] collect: { | f |
	 SCMIRAudioFile(Platform.resourceDir +/+ "sounds/a11wlk01.wav", [f])
};
//:
~tests do: _.extractFeatures;
//:

~tests collect: { | f | f.featuredata.size };

//:

z = Buffer.read(Server.default, Platform.resourceDir +/+ "sounds/a11wlk01.wav" );

z.numFrames / 184;

