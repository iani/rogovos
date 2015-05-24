
//: Use mono files for analysis
Server.default.recChannels = 1;

//: Create a reference file for testing.

Server.default.prepareForRecord;
//:
~source = { SinOsc.ar(Line.kr(100, 1000, 10, doneAction: 2), 0, 0.1) }.play;
Server.default.record;
~source.onEnd(\source, {
	Server.default.stopRecording;
	"Stopped recording!".postln;
});
//: The analysis
~testscmir = SCMIRAudioFile("/Users/iani/Music/SuperCollider Recordings/SC_150522_203350.aiff",
	[[Loudness],[SpecCentroid]]
)
//: Get features
~testscmir.extractFeatures(false);
//: Plot
~testscmir.plotFeatures(800,600,100,true);
//: Save
~testscmir.save("/Users/iani/Desktop/test-scmir-saved.scmirZ");
//: Load
~testscmir2a = SCMIRAudioFile.newFromZ("/Users/iani/Desktop/test-scmir-saved.scmirZ");
//: Test
~testscmir2a.plotFeatures(800,600,100,true);
//: Look at features
~testscmir2a.featuredata.asCompileString;
//:
~testscmir2a.featuredata.size;
//:
~testscmir2a.featuredata.size;

//:
~loudness = nil;
~centroid = nil;

~testscmir.featuredata do: { | d i |
	if (i % 2 == 0) { ~loudness = ~loudness add: d } { ~centroid = ~centroid add: d }
};
//:
~loudness.plot;
//:
~centroid.plot;
//:
~centroid.maxItem;
//: ////////////////////////////////////////////////////////////////
// Features to try:

\ZCR,\RMS,\Loudness

//:

