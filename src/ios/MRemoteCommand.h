#import <Cordova/CDVPlugin.h>
#import <MediaPlayer/MediaPlayer.h>

@interface MRemoteCommand : CDVPlugin {
    NSString *callbackId;
}

@property (nonatomic, copy) NSString *callbackId;

- (void)enabled:(CDVInvokedUrlCommand*)command;
- (void)init:(CDVInvokedUrlCommand*)command;

@end
