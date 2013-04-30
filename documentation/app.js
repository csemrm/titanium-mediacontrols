// Background audio
Titanium.Media.audioSessionMode = Titanium.Media.AUDIO_SESSION_MODE_PLAYBACK;

// Window
var win = Titanium.UI.createWindow({backgroundColor:"#CCCCCC"});

// Label for audio player state
var label = Titanium.UI.createLabel({text:"state:",top:100,left:20});

// Audio player with sample MP3 URL
var audioPlayer = Titanium.Media.createAudioPlayer({bufferSize:4096,allowBackground:true,url:"http://robtowns.com/music/blind_willie.mp3"});
audioPlayer.addEventListener("change", function(e) {
	label.setText("state: " + e.state);
});

// Codewave Media Controls and dummy view
var mediaControls = require("de.codewave.ti.mediacontrols");
var mediaControlsView = mediaControls.createView({left:0,top:0,width:0,height:0});

// Event listeners
mediaControlsView.addEventListener("remoteControlPlay", function() {
	Titanium.API.info("Remote control 'play'.");
	audioPlayer.play();
}); 
mediaControlsView.addEventListener("remoteControlPause", function() {
	Titanium.API.info("Remote control 'pause'.");
	audioPlayer.pause();
}); 
mediaControlsView.addEventListener("remoteControlStop", function() {
	Titanium.API.info("Remote control 'stop'.");
	audioPlayer.stop();
}); 
mediaControlsView.addEventListener("remoteControlTogglePlayPause", function() {
	Titanium.API.info("Remote control 'toggle play/pause'.");
	if (audioPlayer.playing) {
		audioPlayer.pause();
	} else if (audioPlayer.paused) {
		audioPlayer.play();
	}
}); 
mediaControlsView.addEventListener("remoteControlPreviousTrack", function() {
	Titanium.API.info("Remote control 'previous track'.");
}); 
mediaControlsView.addEventListener("remoteControlNextTrack", function() {
	Titanium.API.info("Remote control 'next track'.");
}); 

// Adding views to window
win.add(mediaControlsView);
win.add(label);

// Opening window
win.open();

// And starting playback
audioPlayer.play();
