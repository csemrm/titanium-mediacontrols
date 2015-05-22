# MediaControls Module

## Description

Simple module for creating an invisible view which receives remote control events. This is useful for background
audio playback. Please note that this module does not enable your application to play audio in the background. It
just enables your application to receive the remote control events.

Also allows setting the "now playing" information, e.g. in the iOS 7 lock screen.

## Accessing the MediaControls Module

To access this module from JavaScript, you would do the following:

```javascript
var MediaControls = require("de.codewave.ti.mediacontrols");
```

The MediaControls variable is a reference to the Module object.

## Reference

### MediaControls.createView({left:0,top:0,right:0,bottom:0})

Creates an invisible, full-sized view which receives remote control events. Even though the view is invisible it
will receive touch events when added to your window. Please add this view to your window first. Then add all your
other views and controls to the media controls view instead of the window. This makes the media controls view the
parent of all other views. So no matter which view is the first responder for events, as long as the remote control
events are not handled (which is true for the Titanium views and controls) the events are passed up the view
hierarchy up to the media controls view. If your application has multiple windows, you have to add a media controls
view to all of them to make the remote control events work in any case.

The view supports the following events:

* remoteControlPlay
* remoteControlPause
* remoteControlStop
* remoteControlTogglePlayPause
* remoteControlPreviousTrack
* remoteControlNextTrack

In certain situations the media control view can still lose the first responder role. For example
if you have a window with a media control view and open another window with its own media control view,
the new window's media control view will become the first responder. Now when you close the seconds
window the media control view in the first window won't become the first responder again automatically.
For such cases the MediaControlView has a method becomeFirstResponder which makes it the first responder
again. Here is a small sample which calls the method. Please note that this is just a sample. You need not
call the becomeFirstResponder right after creating the view since the createView method automatically makes
the new view the first responder.

```javascript
var MediaControls = require("de.codewave.ti.mediacontrols");
var view = MediaControls.createView({left:0,top:0,right:0,bottom:0});
view.becomeFirstResponder();
```

### MediaControls.createNowPlayingInfo()

Creates a now playing information proxy. The following methods on the proxy set the now playing information
on the device. You can clear the string values or the artwork by setting it to an empty string. You can clear
all fields at once with the clear-method. Creating a new object or destroying the current object does not change
anything in the already set information on the device. You have to call the clear-method to remove all now
playing information from the device.

The **elapsedPlaybackTime** and **playbackRate** are somewhat special as iOS automatically advances the playback position
according to the playback rate. If the playback rate it set to **1** (which means normal playback speed) it advances
the playback position by one second each second. If you set it to **2** for example the position is advanced by two seconds
each second. Since you never know if playback gets delayed, e.g. by buffering pauses if you are streaming, it is
probably a good idea to set the **elapsedPlaybackTime** every now and then but not every second. If you are implementing
an audio player you could for example set the **playbackRate** to **0** on pause and to **1** on play/resume.

Since iOS works with a complete block of now playing information when setting them you have to keep in mind that you
always set all previously set values again when setting a single value. For example if you have set the title and then
set the artist, both - the title and the artist - will be set internally. This is no problem for all static information
but if you set the **playbackRate** to anything but **0** iOS will start advancing the playback position automatically. It
will however not update the last set **elapsedPlaybackTime**. So if you set the **elapsedPlaybackTime** to **0** and the
**playbackRate** to **1**, wait 10 seconds and then set the **playbackRate** to **0**, you will also set the **elapsedPlaybackTime**
to **0** again. So once you start playback you should set the **elapsedPlaybackTime** whenever you change anything else.

**setTitle**  
Track title (set to empty string to clear).

**setAlbumTitle**  
Album title (set to empty string to clear).

**setArtist** 
Artist name (set to empty string to clear).

**setAlbumArtist**  
Album artist name (set to empty string to clear).

**setGenre**  
Genre (set to empty string to clear).

**setComposer**  
Composer name (set to empty string to clear).

**setPlaybackDuration**  
Playback duration in seconds.

**setAlbumTrackNumber**  
Track number.

**setAlbumTrackCount**  
Total track count.

**setDiscNumber**  
Disc number.

**setDiscCount**  
Total disc count.

**setArtwork**  
Album artwork URI, TiFile or TiBlob  (set to empty string to clear).

**setElapsedPlaybackTime**  
The elapsed playback time in seconds.

**setPlaybackRate**  
The playback rate (0 = stopped, 1 = normal, 2 = double speed, etc).

**clear**  
Clears all now playing information.

## Usage

Simple example for receiving events:

```javascript
var MediaControls = require("de.codewave.ti.mediacontrols");
var view = MediaControls.createView({left:0,top:0,right:0,bottom:0});
view.addEventListener("remoteControlTogglePlayPause", function() {
    // handle the play/pause toggle event
});
```

Simple example for setting "now playing" info:

```javascript
var MediaControls = require("de.codewave.ti.mediacontrols");  
var info = MediaControls.createNowPlayingInfo();  
info.setTitle("Hells Bells");  
info.setAlbum("Best of Rock");  
info.setArtist("AC/DC");  
info.setAlbumArtist("Various Artists");  
info.setPlaybackDuration(235);  
info.setAlbumTrackNumber(2);  
info.setAlbumTrackCount(14);  
info.setDiscNumber(1);  
info.setDiscCount(2);
```

For a working sample app please see the included "app.js" file. Read the comment
in the file for short documentation of how to use it.

## Author

**Codewave Software**  
info@codewave.de  
http://www.codewave.de
