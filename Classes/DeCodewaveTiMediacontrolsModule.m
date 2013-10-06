/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import <MediaPlayer/MPNowPlayingInfoCenter.h>

#import "DeCodewaveTiMediacontrolsModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "DeCodewaveTiMediacontrolsView.h"
#import "DeCodewaveTiMediacontrolsNowPlayingInfoProxy.h"

@implementation DeCodewaveTiMediacontrolsModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"3b8e89ec-0e5b-406d-8ca0-aa4f620ba880";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"de.codewave.ti.mediacontrols";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Public API

-(void)clearNowPlaying:(id)args {
    NSLog(@"Clearing \"now playing\" information.")
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:nil];
}

@end
