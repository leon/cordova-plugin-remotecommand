# Info
This plugin allows you to control all the remote commands in iOS such as play pause from the lock screen, command center or headset.

This project has a sibling project that allows you to control what is displayed in the now playing info shown in the lock screen and in the command center. Check it out!

https://github.com/Muntligt/cordova-plugin-nowplaying

# Install

```bash
cordova plugin add cordova-plugin-remotecommand
```

Then from javascript you will be able to call:

> More info at https://developer.apple.com/library/prerelease/ios/documentation/MediaPlayer/Reference/MPRemoteCommand_Ref/index.html#//apple_ref/occ/cl/MPRemoteCommand

```javascript

// Disable buttons
RemoteCommand.enabled('nextTrack', false);
RemoteCommand.enabled('previousTrack', false);

// Start listening to all the remote commands
RemoteCommand.on('command', function (command) {
	console.log('command being fired', command);
	switch(command) {
		"play":
			audio.play();
			break;
		"pause":
			audio.pause();
			break;
	}
});

// or listen to them seperatly
RemoteCommand.on('play', function () {
	audio.play();
});

RemoteCommand.on('pause', function () {
	audio.pause();
});

// Available events are:
// *  pause
// *  play
// *  stop
// *  togglePlayPause
// *  enableLanguageOption
// *  disableLanguageOption
// *  nextTrack
// *  previousTrack
// *  seekForward
// *  seekBackward

```
