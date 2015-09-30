# Install

```bash
cordova plugin add cordova-plugin-remotecommand
```

Requires linking of `MediaPlayer.framework` from XCode project settings under `General` -> `Linked Framework and Libraries`

Then from javascript you will be able to call:

> More info at https://developer.apple.com/library/prerelease/ios/documentation/MediaPlayer/Reference/MPRemoteCommand_Ref/index.html#//apple_ref/occ/cl/MPRemoteCommand

```javascript

// Disable buttons
RemoteCommand.enabled('nextTrack', false);
RemoteCommand.enabled('previousTrack', false);

// Start listening to remote commands
RemoteCommand.onCommand(function (command) {
	console.log('command being fired', command);
});

```
