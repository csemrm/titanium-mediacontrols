# MediaControls Module

## Description

Simple module for creating an invisible view which receives remote control events. This is useful for background
audio playback. Please note that this module does not enable your application to play audio in the background. It
just enables your application to receive the remote control events.

## Accessing the MediaControls Module

To access this module from JavaScript, you would do the following:

	var MediaControls = require("de.codewave.ti.mediacontrols");

The MediaControls variable is a reference to the Module object.	

## Reference

There is only one API method.

### MediaControls.createView{left:0,top:0,width:0,height:0}

Creates an invisible, zero-sized view which receives remote control events. Even though the view is invisible it
will receive touch events when added to your view. So please always create it with the above dimensions. The view
supports the following events: remoteControlPlay, remoteControlPause, remoteControlStop, remoteControlTogglePlayPause,
remoteControlPreviousTrack and remoteControlNextTrack.

## Usage

Simple example for receiving events:

var MediaControls = require("de.codewave.ti.mediacontrols");
var view = MediaControls.createView{left:0,top:0,width:0,height:0};
view.addEventListener("remoteControlTogglePlayPause", function() {
    // handle the play/pause toggle event
});

## Author

Codewave Software
info@codewave.de
http://www.codewave.de
