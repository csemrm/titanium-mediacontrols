#import "DeCodewaveTiMediacontrolsView.h"

@implementation DeCodewaveTiMediacontrolsView

- (id)init {
    self = [super init];
    if (self) {
        [self becomeFirstResponder];
    }
    return self;
}


- (void)dealloc {
    [self resignFirstResponder];
    RELEASE_TO_NIL(view);
    [super dealloc];
}

- (UIView *)view {
    if (view == nil) {
        view = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return view;
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)remoteControlReceivedWithEvent:(UIEvent *)event {
    if (event.type == UIEventTypeRemoteControl) {
        switch (event.subtype) {
            case UIEventSubtypeRemoteControlPlay:
                NSLog(@"[INFO] Received event UIEventSubtypeRemoteControlPlay");
                [[self proxy] fireEvent:@"remoteControlPlay"];
                break;
            case UIEventSubtypeRemoteControlPause:
                NSLog(@"[INFO] Received event UIEventSubtypeRemoteControlPause");
                [[self proxy] fireEvent:@"remoteControlPause"];
                break;
            case UIEventSubtypeRemoteControlStop:
                NSLog(@"[INFO] Received event UIEventSubtypeRemoteControlStop");
                [[self proxy] fireEvent:@"remoteControlStop"];
                break;
            case UIEventSubtypeRemoteControlTogglePlayPause:
                NSLog(@"[INFO] Received event UIEventSubtypeRemoteControlTogglePlayPause");
                [[self proxy] fireEvent:@"remoteControlTogglePlayPause"];
                break;
            case UIEventSubtypeRemoteControlPreviousTrack:
                NSLog(@"[INFO] Received event UIEventSubtypeRemoteControlPreviousTrack");
                [[self proxy] fireEvent:@"remoteControlPreviousTrack"];
                break;
            case UIEventSubtypeRemoteControlNextTrack:
                NSLog(@"[INFO] Received event UIEventSubtypeRemoteControlNextTrack");
                [[self proxy] fireEvent:@"remoteControlNextTrack"];
                break;
            default:
                // pass unhandled event to super class
                [super remoteControlReceivedWithEvent:event];
                break;
        }
    } else {
        // pass unhandled event to super class
        [super remoteControlReceivedWithEvent:event];
    }
}

@end