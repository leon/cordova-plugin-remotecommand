#import <Cordova/CDVPlugin.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MediaPlayer/MPNowPlayingInfoCenter.h>
#import <MediaPlayer/MPMediaItem.h>

@interface MNRemoteCommand : CDVPlugin {
}

- (void)enabled:(CDVInvokedUrlCommand*)command;
- (void)onCommand(CDVInvokedUrlCommand*)command;

@end
