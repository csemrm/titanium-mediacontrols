#import <MediaPlayer/MPNowPlayingInfoCenter.h>
#import <MediaPlayer/MPMediaItem.h>
#import <ImageLoader.h>
#import <TiApp.h>
#import "DeCodewaveTiMediacontrolsNowPlayingInfoProxy.h"
#import "TiUtils.h"

@implementation DeCodewaveTiMediacontrolsNowPlayingInfoProxy {
    @private NSMutableDictionary *myDictionary;
}

-(void)setTitle:(id)title {
    NSLog(@"Now playing \"title\" = \"%@\".", title);
    [self replaceValue:title forKey:@"title" notification:NO];
    if ([title isEqual:@""]) {
        [[self getDict] removeObjectForKey:MPMediaItemPropertyTitle];
    } else {
        [[self getDict] setObject:[TiUtils stringValue:title] forKey:MPMediaItemPropertyTitle];
    }
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setAlbumTitle:(id)albumTitle {
    NSLog(@"Now playing \"albumTitle\" = \"%@\".", albumTitle);
    [self replaceValue:albumTitle forKey:@"albumTitle" notification:NO];
    if ([albumTitle isEqual:@""]) {
        [[self getDict] removeObjectForKey:MPMediaItemPropertyAlbumTitle];
    } else {
        [[self getDict] setObject:[TiUtils stringValue:albumTitle] forKey:MPMediaItemPropertyAlbumTitle];
    }
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setArtist:(id)artist {
    NSLog(@"Now playing \"artist\" = \"%@\".", artist);
    [self replaceValue:artist forKey:@"artist" notification:NO];
    if ([artist isEqual:@""]) {
        [[self getDict] removeObjectForKey:MPMediaItemPropertyArtist];
    } else {
        [[self getDict] setObject:[TiUtils stringValue:artist] forKey:MPMediaItemPropertyArtist];
    }
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setAlbumArtist:(id)albumArtist {
    NSLog(@"Now playing \"albumArtist\" = \"%@\".", albumArtist);
    [self replaceValue:albumArtist forKey:@"albumArtist" notification:NO];
    if ([albumArtist isEqual:@""]) {
        [[self getDict] removeObjectForKey:MPMediaItemPropertyAlbumArtist];
    } else {
        [[self getDict] setObject:[TiUtils stringValue:albumArtist] forKey:MPMediaItemPropertyAlbumArtist];
    }
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setGenre:(id)genre {
    NSLog(@"Now playing \"genre\" = \"%@\".", genre);
    [self replaceValue:genre forKey:@"genre" notification:NO];
    if ([genre isEqual:@""]) {
        [[self getDict] removeObjectForKey:MPMediaItemPropertyGenre];
    } else {
        [[self getDict] setObject:[TiUtils stringValue:genre] forKey:MPMediaItemPropertyGenre];
    }
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setComposer:(id)composer {
    NSLog(@"Now playing \"composer\" = \"%@\".", composer);
    [self replaceValue:composer forKey:@"composer" notification:NO];
    if ([composer isEqual:@""]) {
        [[self getDict] removeObjectForKey:MPMediaItemPropertyComposer];
    } else {
        [[self getDict] setObject:[TiUtils stringValue:composer] forKey:MPMediaItemPropertyComposer];
    }
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setDiscNumber:(id)discNumber {
    NSLog(@"Now playing \"discNumber\" = \"%@\".", discNumber);
    [self replaceValue:discNumber forKey:@"discNumber" notification:NO];
    [[self getDict] setObject:[TiUtils intValue:discNumber def:0] forKey:MPMediaItemPropertyDiscNumber];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setDiscCount:(id)discCount {
    NSLog(@"Now playing \"discCount\" = \"%@\".", discCount);
    [self replaceValue:discCount forKey:@"discCount" notification:NO];
    [[self getDict] setObject:[TiUtils intValue:discCount def:0] forKey:MPMediaItemPropertyDiscCount];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setAlbumTrackNumber:(id)albumTrackNumber {
    NSLog(@"Now playing \"albumTrackNumber\" = \"%@\".", albumTrackNumber);
    [self replaceValue:albumTrackNumber forKey:@"albumTrackNumber" notification:NO];
    [[self getDict] setObject:[TiUtils intValue:albumTrackNumber def:0] forKey:MPMediaItemPropertyAlbumTrackNumber];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setAlbumTrackCount:(id)albumTrackCount {
    NSLog(@"Now playing \"albumTrackCount\" = \"%@\".", albumTrackCount);
    [self replaceValue:albumTrackCount forKey:@"albumTrackCount" notification:NO];
    [[self getDict] setObject:[TiUtils intValue:albumTrackCount def:0] forKey:MPMediaItemPropertyAlbumTrackCount];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setPlaybackDuration:(id)playbackDuration {
    NSLog(@"Now playing \"playbackDuration\" = \"%@\".", playbackDuration);
    [self replaceValue:playbackDuration forKey:@"playbackDuration" notification:NO];
    [[self getDict] setObject:[TiUtils intValue:playbackDuration def:0] forKey:MPMediaItemPropertyPlaybackDuration];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setElapsedPlaybackTime:(id)elapsedPlaybackTime {
    NSLog(@"Now playing \"elapsedPlaybackTime\" = \"%@\".", elapsedPlaybackTime);
    [self replaceValue:elapsedPlaybackTime forKey:@"elapsedPlaybackTime" notification:NO];
    [[self getDict] setObject:[TiUtils intValue:elapsedPlaybackTime def:0] forKey:MPNowPlayingInfoPropertyElapsedPlaybackTime];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setPlaybackRate:(id)playbackRate {
    NSLog(@"Now playing \"playbackRate\" = \"%@\".", playbackRate);
    [self replaceValue:playbackRate forKey:@"playbackRate" notification:NO];
    [[self getDict] setObject:[TiUtils intValue:playbackRate def:1] forKey:MPNowPlayingInfoPropertyPlaybackRate];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setArtwork:(id)artwork {
    [self replaceValue:artwork forKey:@"artwork" notification:NO];
    NSLog(@"Now playing \"artwork\" = \"%@\".", artwork);
    if ([artwork isEqual:@""]) {
        [[self getDict] removeObjectForKey:MPMediaItemPropertyArtwork];
        [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
    } else {
        UIImage *image = [self toImage:artwork];
        if (image != nil) {
            NSLog(@"Now playing \"artwork\" image created from \"%@\".", artwork);
            [[self getDict] setObject:[[[MPMediaItemArtwork alloc] initWithImage:image] autorelease] forKey:MPMediaItemPropertyArtwork];
            [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
        } else {
            dispatch_queue_t loader = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            NSLog(@"Trying to load now playing \"artwork\" image from \"%@\" asynchronously.", artwork);
            dispatch_async(loader, ^{
                NSURL *imageUrl = [TiUtils toURL:artwork proxy:self];
                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
                if (image != nil) {
                    NSLog(@"Now playing \"artwork\" image created from \"%@\".", artwork);
                    [[self getDict] setObject:[[[MPMediaItemArtwork alloc] initWithImage:image] autorelease] forKey:MPMediaItemPropertyArtwork];
                    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
                } else {
                    NSLog(@"Now playing \"artwork\" image could not be created from \"%@\".", artwork);
                }
            });
        }
    }
}

-(void)clear {
    [[self getDict] removeAllObjects];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:nil];
}

-(UIImage*)toImage:(id)object {
    if ([object isKindOfClass:[TiBlob class]]) {
        return [(TiBlob *)object image];
    }
    if ([object isKindOfClass:[TiFile class]]) {
        TiFile *file = (TiFile*)object;
        UIImage *image = [UIImage imageWithContentsOfFile:[file path]];
        return image;
    }
    NSURL *urlAttempt = [TiUtils toURL:object proxy:self];
    return [[ImageLoader sharedLoader] loadImmediateImage:urlAttempt];
}

-(NSMutableDictionary *)getDict {
    if (myDictionary == nil) {
        myDictionary = [[NSMutableDictionary alloc] init];
    }
    return myDictionary;
}

@end

