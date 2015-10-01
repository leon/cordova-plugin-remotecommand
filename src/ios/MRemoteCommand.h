#import <Cordova/CDVPlugin.h>
#import <MediaPlayer/MediaPlayer.h>

@interface MRemoteCommand : CDVPlugin {
}

- (void)enabled:(CDVInvokedUrlCommand*)command;
- (void)onCommand:(CDVInvokedUrlCommand*)command;

@end
