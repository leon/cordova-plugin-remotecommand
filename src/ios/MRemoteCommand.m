#import "MNowPlaying.h"

@implementation MRemoteCommand

- (void)pluginInitialize
{
	NSLog(@"RemoteCommand plugin init.");
}

/**
 * Will set now playing info based on what keys are sent into method
 */
- (void)enabled:(CDVInvokedUrlCommand*)command
{
	MPRemoteCommandCenter *remoteCenter = [MPRemoteCommandCenter sharedCommandCenter];

	NSString *command = [command.arguments objectAtIndex:0];
	BOOL *enabled = [command.arguments objectAtIndex:1];

	switch (command) {
		case "@pause":
			remoteCenter.pauseCommand.enabled = enabled;
			break;
		case "@play":
			remoteCenter.playCommand.enabled = enabled;
			break;
		case "@stop":
			remoteCenter.stopCommand.enabled = enabled;
			break;
		case "@togglePlayPause":
			remoteCenter.togglePlayPauseCommand.enabled = enabled;
			break;
		case "@enableLanguageOption":
			remoteCenter.enableLanguageOptionCommand.enabled = enabled;
			break;
		case "@disableLanguageOption":
			remoteCenter.disableLanguageOptionCommand.enabled = enabled;
			break;
		case "@nextTrack":
			remoteCenter.nextTrackCommand.enabled = enabled;
			break;
		case "@previousTrack":
			remoteCenter.previousTrackCommand.enabled = enabled;
			break;
		case "@seekForward":
			remoteCenter.seekForwardCommand.enabled = enabled;
			break;
		case "@seekBackward":
			remoteCenter.seekBackwardCommand.enabled = enabled;
			break;
	}
}

/**
 * Start listening for commands
 */
- (void)onCommand(CDVInvokedUrlCommand*)command
{
	MPRemoteCommandCenter *remoteCenter = [MPRemoteCommandCenter sharedCommandCenter];

	[commandCenter.pauseCommand addTargetUsingBlock:^(MPRemoteCommandEvent *event) {
		[self sendEvent:@"pause" toCallbackId:command.callbackId];
	}
	[commandCenter.playCommand addTargetUsingBlock:^(MPRemoteCommandEvent *event) {
		[self sendEvent:@"play" toCallbackId:command.callbackId];
	}
	[commandCenter.stopCommand addTargetUsingBlock:^(MPRemoteCommandEvent *event) {
		[self sendEvent:@"stop" toCallbackId:command.callbackId];
	}
	[commandCenter.togglePlayPauseCommand addTargetUsingBlock:^(MPRemoteCommandEvent *event) {
		[self sendEvent:@"togglePlayPause" toCallbackId:command.callbackId];
	}
	[commandCenter.enableLanguageOptionCommand addTargetUsingBlock:^(MPRemoteCommandEvent *event) {
		[self sendEvent:@"enableLanguageOption" toCallbackId:command.callbackId];
	}
	[commandCenter.disableLanguageOptionCommand addTargetUsingBlock:^(MPRemoteCommandEvent *event) {
		[self sendEvent:@"disableLanguageOption" toCallbackId:command.callbackId];
	}
	[commandCenter.nextTrackCommand addTargetUsingBlock:^(MPRemoteCommandEvent *event) {
		[self sendEvent:@"nextTrack" toCallbackId:command.callbackId];
	}
	[commandCenter.previousTrackCommand addTargetUsingBlock:^(MPRemoteCommandEvent *event) {
		[self sendEvent:@"previousTrack" toCallbackId:command.callbackId];
	}
	[commandCenter.seekForwardCommand addTargetUsingBlock:^(MPRemoteCommandEvent *event) {
		[self sendEvent:@"seekForward" toCallbackId:command.callbackId];
	}
	[commandCenter.seekBackwardCommand addTargetUsingBlock:^(MPRemoteCommandEvent *event) {
		[self sendEvent:@"seekBackward" toCallbackId:command.callbackId];
	}
}

- (void)sendEvent:(NSString *event) toCallbackId:(NSString*)callbackId {
	CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:event];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

@end
