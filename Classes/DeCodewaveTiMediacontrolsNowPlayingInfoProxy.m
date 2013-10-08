#import <MediaPlayer/MPNowPlayingInfoCenter.h>
#import <MediaPlayer/MPMediaItem.h>
#import <ImageLoader.h>
#import <TiApp.h>
#import "DeCodewaveTiMediacontrolsNowPlayingInfoProxy.h"

@implementation DeCodewaveTiMediacontrolsNowPlayingInfoProxy {
    NSMutableDictionary *_dict;
}

-(id)init {
    if (self = [super init]) {
        _dict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void)setTitle:(id)title {
    NSLog(@"Now playing \"title\" = \"%@\".", title);
    [self replaceValue:title forKey:@"title" notification:NO];
    if ([title isEqual:@""]) {
        [_dict removeObjectForKey:MPMediaItemPropertyTitle];
    } else {
        [_dict setObject:[TiUtils stringValue:title] forKey:MPMediaItemPropertyTitle];
    }
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setAlbumTitle:(id)albumTitle {
    NSLog(@"Now playing \"albumTitle\" = \"%@\".", albumTitle);
    [self replaceValue:albumTitle forKey:@"albumTitle" notification:NO];
    if ([albumTitle isEqual:@""]) {
        [_dict removeObjectForKey:MPMediaItemPropertyAlbumTitle];
    } else {
        [_dict setObject:[TiUtils stringValue:albumTitle] forKey:MPMediaItemPropertyAlbumTitle];
    }
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setArtist:(id)artist {
    NSLog(@"Now playing \"artist\" = \"%@\".", artist);
    [self replaceValue:artist forKey:@"artist" notification:NO];
    if ([artist isEqual:@""]) {
        [_dict removeObjectForKey:MPMediaItemPropertyArtist];
    } else {
        [_dict setObject:[TiUtils stringValue:artist] forKey:MPMediaItemPropertyArtist];
    }
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setAlbumArtist:(id)albumArtist {
    NSLog(@"Now playing \"albumArtist\" = \"%@\".", albumArtist);
    [self replaceValue:albumArtist forKey:@"albumArtist" notification:NO];
    if ([albumArtist isEqual:@""]) {
        [_dict removeObjectForKey:MPMediaItemPropertyAlbumArtist];
    } else {
        [_dict setObject:[TiUtils stringValue:albumArtist] forKey:MPMediaItemPropertyAlbumArtist];
    }
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setGenre:(id)genre {
    NSLog(@"Now playing \"genre\" = \"%@\".", genre);
    [self replaceValue:genre forKey:@"genre" notification:NO];
    if ([genre isEqual:@""]) {
        [_dict removeObjectForKey:MPMediaItemPropertyGenre];
    } else {
        [_dict setObject:[TiUtils stringValue:genre] forKey:MPMediaItemPropertyGenre];
    }
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setComposer:(id)composer {
    NSLog(@"Now playing \"composer\" = \"%@\".", composer);
    [self replaceValue:composer forKey:@"composer" notification:NO];
    if ([composer isEqual:@""]) {
        [_dict removeObjectForKey:MPMediaItemPropertyComposer];
    } else {
        [_dict setObject:[TiUtils stringValue:composer] forKey:MPMediaItemPropertyComposer];
    }
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setDiscNumber:(id)discNumber {
    NSLog(@"Now playing \"discNumber\" = \"%@\".", discNumber);
    [self replaceValue:discNumber forKey:@"discNumber" notification:NO];
    [_dict setObject:[TiUtils numberFromObject:discNumber] forKey:MPMediaItemPropertyDiscNumber];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setDiscCount:(id)discCount {
    NSLog(@"Now playing \"discCount\" = \"%@\".", discCount);
    [self replaceValue:discCount forKey:@"discCount" notification:NO];
    [_dict setObject:[TiUtils numberFromObject:discCount] forKey:MPMediaItemPropertyDiscCount];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setAlbumTrackNumber:(id)albumTrackNumber {
    NSLog(@"Now playing \"albumTrackNumber\" = \"%@\".", albumTrackNumber);
    [self replaceValue:albumTrackNumber forKey:@"albumTrackNumber" notification:NO];
    [_dict setObject:[TiUtils numberFromObject:albumTrackNumber] forKey:MPMediaItemPropertyAlbumTrackNumber];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setAlbumTrackCount:(id)albumTrackCount {
    NSLog(@"Now playing \"albumTrackCount\" = \"%@\".", albumTrackCount);
    [self replaceValue:albumTrackCount forKey:@"albumTrackCount" notification:NO];
    [_dict setObject:[TiUtils numberFromObject:albumTrackCount] forKey:MPMediaItemPropertyAlbumTrackCount];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setPlaybackDuration:(id)playbackDuration {
    NSLog(@"Now playing \"playbackDuration\" = \"%@\".", playbackDuration);
    [self replaceValue:playbackDuration forKey:@"playbackDuration" notification:NO];
    [_dict setObject:[TiUtils numberFromObject:playbackDuration] forKey:MPMediaItemPropertyPlaybackDuration];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setElapsedPlaybackTime:(id)elapsedPlaybackTime {
    NSLog(@"Now playing \"elapsedPlaybackTime\" = \"%@\".", elapsedPlaybackTime);
    NSMutableDictionary *dictClone = [_dict mutableCopy];
    [dictClone setObject:[TiUtils numberFromObject:elapsedPlaybackTime] forKey:MPNowPlayingInfoPropertyElapsedPlaybackTime];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
    [dictClone release];
}

-(void)setPlaybackRate:(id)playbackRate {
    NSLog(@"Now playing \"playbackRate\" = \"%@\".", playbackRate);
    NSMutableDictionary *dictClone = [_dict mutableCopy];
    [dictClone setObject:[TiUtils numberFromObject:playbackRate] forKey:MPNowPlayingInfoPropertyPlaybackRate];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
    [dictClone release];
}

-(void)setArtwork:(id)artwork {
    [self replaceValue:artwork forKey:@"artwork" notification:NO];
    NSLog(@"Now playing \"artwork\" = \"%@\".", artwork);
    if ([artwork isEqual:@""]) {
        [_dict removeObjectForKey:MPMediaItemPropertyArtwork];
        [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
    } else {
        UIImage *image = [self toImage:artwork];
        if (image != nil) {
            NSLog(@"Now playing \"artwork\" image created from \"%@\".", artwork);
            [_dict setObject:[[[MPMediaItemArtwork alloc] initWithImage:image] autorelease] forKey:MPMediaItemPropertyArtwork];
            [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
        } else {
            NSLog(@"Trying to load now playing \"artwork\" image from \"%@\" asynchronously.", artwork);
            NSURL *imageUrl = [TiUtils toURL:artwork proxy:self];
            [self loadAndSetRemoteImage: imageUrl];
        }
    }
}

-(void)loadAndSetRemoteImage:(NSURL *)url {
    dispatch_queue_t loader = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(loader, ^{
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        if (image != nil) {
            NSLog(@"Now playing \"artwork\" image created from \"%@\".", [url absoluteString]);
            [_dict setObject:[[[MPMediaItemArtwork alloc] initWithImage:image] autorelease] forKey:MPMediaItemPropertyArtwork];
            [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
        } else {
            NSLog(@"Now playing \"artwork\" image could not be created from \"%@\".", [url absoluteString]);
        }
    });
}

-(void)clear:(id)ignore {
    [_dict removeAllObjects];
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

- (void)dealloc {
    [_dict release];
    [super dealloc];
}

@end

