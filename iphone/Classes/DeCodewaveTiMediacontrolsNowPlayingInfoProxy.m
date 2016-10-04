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

- (void)dealloc {
    [_dict release];
    [super dealloc];
}

-(void)setTitle:(id)title {
    NSLog(@"Now playing \"title\" = \"%@\".", title);
    if ([title isEqual:@""]) {
        [_dict removeObjectForKey:MPMediaItemPropertyTitle];
    } else {
        _dict[MPMediaItemPropertyTitle] = [TiUtils stringValue:title];
    }
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setAlbumTitle:(id)albumTitle {
    NSLog(@"Now playing \"albumTitle\" = \"%@\".", albumTitle);
    if ([albumTitle isEqual:@""]) {
        [_dict removeObjectForKey:MPMediaItemPropertyAlbumTitle];
    } else {
        _dict[MPMediaItemPropertyAlbumTitle] = [TiUtils stringValue:albumTitle];
    }
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setArtist:(id)artist {
    NSLog(@"Now playing \"artist\" = \"%@\".", artist);
    if ([artist isEqual:@""]) {
        [_dict removeObjectForKey:MPMediaItemPropertyArtist];
    } else {
        _dict[MPMediaItemPropertyArtist] = [TiUtils stringValue:artist];
    }
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setAlbumArtist:(id)albumArtist {
    NSLog(@"Now playing \"albumArtist\" = \"%@\".", albumArtist);
    if ([albumArtist isEqual:@""]) {
        [_dict removeObjectForKey:MPMediaItemPropertyAlbumArtist];
    } else {
        _dict[MPMediaItemPropertyAlbumArtist] = [TiUtils stringValue:albumArtist];
    }
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setGenre:(id)genre {
    NSLog(@"Now playing \"genre\" = \"%@\".", genre);
    if ([genre isEqual:@""]) {
        [_dict removeObjectForKey:MPMediaItemPropertyGenre];
    } else {
        _dict[MPMediaItemPropertyGenre] = [TiUtils stringValue:genre];
    }
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setComposer:(id)composer {
    NSLog(@"Now playing \"composer\" = \"%@\".", composer);
    if ([composer isEqual:@""]) {
        [_dict removeObjectForKey:MPMediaItemPropertyComposer];
    } else {
        _dict[MPMediaItemPropertyComposer] = [TiUtils stringValue:composer];
    }
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setDiscNumber:(id)discNumber {
    NSLog(@"Now playing \"discNumber\" = \"%@\".", discNumber);
    _dict[MPMediaItemPropertyDiscNumber] = [TiUtils numberFromObject:discNumber];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setDiscCount:(id)discCount {
    NSLog(@"Now playing \"discCount\" = \"%@\".", discCount);
    _dict[MPMediaItemPropertyDiscCount] = [TiUtils numberFromObject:discCount];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setAlbumTrackNumber:(id)albumTrackNumber {
    NSLog(@"Now playing \"albumTrackNumber\" = \"%@\".", albumTrackNumber);
    _dict[MPMediaItemPropertyAlbumTrackNumber] = [TiUtils numberFromObject:albumTrackNumber];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setAlbumTrackCount:(id)albumTrackCount {
    NSLog(@"Now playing \"albumTrackCount\" = \"%@\".", albumTrackCount);
    _dict[MPMediaItemPropertyAlbumTrackCount] = [TiUtils numberFromObject:albumTrackCount];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setPlaybackDuration:(id)playbackDuration {
    NSLog(@"Now playing \"playbackDuration\" = \"%@\".", playbackDuration);
    _dict[MPMediaItemPropertyPlaybackDuration] = [TiUtils numberFromObject:playbackDuration];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setElapsedPlaybackTime:(id)elapsedPlaybackTime {
    NSLog(@"Now playing \"elapsedPlaybackTime\" = \"%@\".", elapsedPlaybackTime);
    _dict[MPNowPlayingInfoPropertyElapsedPlaybackTime] = [TiUtils numberFromObject:elapsedPlaybackTime];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setPlaybackRate:(id)playbackRate {
    NSLog(@"Now playing \"playbackRate\" = \"%@\".", playbackRate);
    _dict[MPNowPlayingInfoPropertyPlaybackRate] = [TiUtils numberFromObject:playbackRate];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
}

-(void)setArtwork:(id)artwork {
    NSLog(@"Now playing \"artwork\" = \"%@\".", artwork);
    if ([artwork isEqual:@""]) {
        [_dict removeObjectForKey:MPMediaItemPropertyArtwork];
        [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
    } else {
        UIImage *image = [self toImage:artwork];
        if (image != nil) {
            NSLog(@"Now playing \"artwork\" image created from \"%@\".", artwork);
            _dict[MPMediaItemPropertyArtwork] = [[[MPMediaItemArtwork alloc] initWithImage:image] autorelease];
            [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
        } else {
            NSLog(@"Trying to load now playing \"artwork\" image from \"%@\" asynchronously.", artwork);
            NSURL *imageUrl = [TiUtils toURL:artwork proxy:self];
            [self loadAndSetRemoteImage: imageUrl];
        }
    }
}

-(void)clear:(id)ignore {
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:nil];
}

-(void)loadAndSetRemoteImage:(NSURL *)url {
    dispatch_queue_t loader = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(loader, ^{
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        if (image != nil) {
            NSLog(@"Now playing \"artwork\" image created from \"%@\".", [url absoluteString]);
            _dict[MPMediaItemPropertyArtwork] = [[[MPMediaItemArtwork alloc] initWithImage:image] autorelease];
            [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:_dict];
        } else {
            NSLog(@"Now playing \"artwork\" image could not be created from \"%@\".", [url absoluteString]);
        }
    });
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

@end

