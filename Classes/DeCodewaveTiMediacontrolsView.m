#import "DeCodewaveTiMediacontrolsView.h"

@implementation DeCodewaveTiMediacontrolsView

- (id)init {
    self = [super init];
    if (self) {
        NSLog(@"[INFO] Becoming first responder.");
        [self becomeFirstResponder];
    }
    return self;
}


- (void)dealloc {
    NSLog(@"[INFO] Resigning first responder.");
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
                [[self proxy] fireEvent:@"remoteControlPlay"];
                break;
            case UIEventSubtypeRemoteControlPause:
                [[self proxy] fireEvent:@"remoteControlPause"];
                break;
            case UIEventSubtypeRemoteControlStop:
                [[self proxy] fireEvent:@"remoteControlStop"];
                break;
            case UIEventSubtypeRemoteControlTogglePlayPause:
                [[self proxy] fireEvent:@"remoteControlTogglePlayPause"];
                break;
            case UIEventSubtypeRemoteControlPreviousTrack:
                [[self proxy] fireEvent:@"remoteControlPreviousTrack"];
                break;
            case UIEventSubtypeRemoteControlNextTrack:
                NSLog(@"[INFO] Next track remote control event received.");
                [[self proxy] fireEvent:@"remoteControlNextTrack"];
                break;
            default:
                break;
        }
    }
}

@end