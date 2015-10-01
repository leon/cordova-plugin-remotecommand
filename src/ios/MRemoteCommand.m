#import "MRemoteCommand.h"

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

	NSString *cmd = [command.arguments objectAtIndex:0];
    bool enabled = [[command.arguments objectAtIndex:1] boolValue];

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
 * Start listening for commands
 */
- (void)onCommand: (CDVInvokedUrlCommand*)command
{
	MPRemoteCommandCenter *commandCenter = [MPRemoteCommandCenter sharedCommandCenter];

    //[commandCenter.pauseCommand addTarget:self action:@selector(onPlayCommand:)]

    [commandCenter.pauseCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
        [self sendEvent:@"pause" :command.callbackId];
        return MPRemoteCommandHandlerStatusSuccess;
    }];
    [commandCenter.pauseCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
        [self sendEvent:@"pause" :command.callbackId];
        return MPRemoteCommandHandlerStatusSuccess;
	}];
    [commandCenter.playCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
		[self sendEvent:@"play" :command.callbackId];
        return MPRemoteCommandHandlerStatusSuccess;
	}];
    [commandCenter.stopCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
		[self sendEvent:@"stop" :command.callbackId];
        return MPRemoteCommandHandlerStatusSuccess;
	}];
    [commandCenter.togglePlayPauseCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
		[self sendEvent:@"togglePlayPause" :command.callbackId];
        return MPRemoteCommandHandlerStatusSuccess;
	}];
    [commandCenter.enableLanguageOptionCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
		[self sendEvent:@"enableLanguageOption" :command.callbackId];
        return MPRemoteCommandHandlerStatusSuccess;
	}];
    [commandCenter.disableLanguageOptionCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
		[self sendEvent:@"disableLanguageOption" :command.callbackId];
        return MPRemoteCommandHandlerStatusSuccess;
	}];
    [commandCenter.nextTrackCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
		[self sendEvent:@"nextTrack" :command.callbackId];
        return MPRemoteCommandHandlerStatusSuccess;
	}];
    [commandCenter.previousTrackCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
		[self sendEvent:@"previousTrack" :command.callbackId];
        return MPRemoteCommandHandlerStatusSuccess;
	}];
    [commandCenter.seekForwardCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
		[self sendEvent:@"seekForward" :command.callbackId];
        return MPRemoteCommandHandlerStatusSuccess;
	}];
    [commandCenter.seekBackwardCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *event) {
		[self sendEvent:@"seekBackward" :command.callbackId];
        return MPRemoteCommandHandlerStatusSuccess;
	}];
}

- (void)sendEvent:(NSString*)event :(NSString*)callbackId {
	CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:event];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

@end
