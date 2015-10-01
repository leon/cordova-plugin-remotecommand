#import "MRemoteCommand.h"

@implementation MRemoteCommand

@synthesize callbackId;

- (void)pluginInitialize
{
	NSLog(@"RemoteCommand plugin init.");

	// Register all available commands

	MPRemoteCommandCenter *commandCenter = [MPRemoteCommandCenter sharedCommandCenter];

	[commandCenter.pauseCommand addTarget:self action:@selector(onPause:)];
	[commandCenter.playCommand addTarget:self action:@selector(onPlay:)];
	[commandCenter.stopCommand addTarget:self action:@selector(onStop:)];
	[commandCenter.togglePlayPauseCommand addTarget:self action:@selector(onTogglePlayPause:)];
	[commandCenter.enableLanguageOptionCommand addTarget:self action:@selector(onEnableLanguageOption:)];
	[commandCenter.disableLanguageOptionCommand addTarget:self action:@selector(onDisableLanguageOption:)];
	[commandCenter.nextTrackCommand addTarget:self action:@selector(onNextTrack:)];
	[commandCenter.previousTrackCommand addTarget:self action:@selector(onPreviousTrack:)];
	[commandCenter.seekForwardCommand addTarget:self action:@selector(onSeekForward:)];
	[commandCenter.seekBackwardCommand addTarget:self action:@selector(onSeekBackward:)];
}

- (void)onPause:(MPRemoteCommandHandlerStatus*)event { [self sendEvent:@"pause"]; }
- (void)onPlay:(MPRemoteCommandHandlerStatus*)event { [self sendEvent:@"play"]; }
- (void)onStop:(MPRemoteCommandHandlerStatus*)event { [self sendEvent:@"stop"]; }
- (void)onTogglePlayPause:(MPRemoteCommandHandlerStatus*)event { [self sendEvent:@"togglePlayPause"]; }
- (void)onEnableLanguageOption:(MPRemoteCommandHandlerStatus*)event { [self sendEvent:@"enableLanguageOption"]; }
- (void)onDisableLanguageOption:(MPRemoteCommandHandlerStatus*)event { [self sendEvent:@"disableLanguageOption"]; }
- (void)onNextTrack:(MPRemoteCommandHandlerStatus*)event { [self sendEvent:@"nextTrack"]; }
- (void)onPreviousTrack:(MPRemoteCommandHandlerStatus*)event { [self sendEvent:@"previousTrack"]; }
- (void)onSeekForward:(MPRemoteCommandHandlerStatus*)event { [self sendEvent:@"seekForward"]; }
- (void)onSeekBackward:(MPRemoteCommandHandlerStatus*)event { [self sendEvent:@"seekBackward"]; }


/**
 * Start listening for commands
 */
- (void)init: (CDVInvokedUrlCommand*)command
{
	self.callbackId = command.callbackId;
	NSLog(@"RemoteCommand init with callbackId: %@", self.callbackId);
}

/**
 * Will set now playing info based on what keys are sent into method
 */
- (void)enabled:(CDVInvokedUrlCommand*)command
{
	MPRemoteCommandCenter *remoteCenter = [MPRemoteCommandCenter sharedCommandCenter];

	NSString *cmd = [command.arguments objectAtIndex:0];
	bool enabled = [[command.arguments objectAtIndex:1] boolValue];

	NSLog(@"RemoteCommand enabled: %@ - %d", cmd, enabled);

	if ([cmd isEqual: @"@pause"]) {
		remoteCenter.pauseCommand.enabled = enabled;
	} else if ([cmd isEqual: @"play"]) {
		remoteCenter.playCommand.enabled = enabled;
	} else if ([cmd isEqual: @"stop"]) {
		remoteCenter.stopCommand.enabled = enabled;
	} else if ([cmd isEqual: @"togglePlayPause"]) {
		remoteCenter.togglePlayPauseCommand.enabled = enabled;
	} else if ([cmd isEqual: @"enableLanguageOption"]) {
		remoteCenter.enableLanguageOptionCommand.enabled = enabled;
	} else if ([cmd isEqual: @"disableLanguageOption"]) {
		remoteCenter.disableLanguageOptionCommand.enabled = enabled;
	} else if ([cmd isEqual: @"nextTrack"]) {
		remoteCenter.nextTrackCommand.enabled = enabled;
	} else if ([cmd isEqual: @"previousTrack"]) {
		remoteCenter.previousTrackCommand.enabled = enabled;
	} else if ([cmd isEqual: @"seekForward"]) {
		remoteCenter.seekForwardCommand.enabled = enabled;
	} else if ([cmd isEqual: @"seekBackward"]) {
		remoteCenter.seekBackwardCommand.enabled = enabled;
	}
}

/**
 * Send events if there is a registered event listener
 */
- (void)sendEvent:(NSString*)event
{
	NSLog(@"RemoteCommand: %@ calling: %@", event, self.callbackId);

	if (self.callbackId != nil) {
		CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:event];
		[pluginResult setKeepCallback:[NSNumber numberWithBool:YES]];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];
	}
}

@end
