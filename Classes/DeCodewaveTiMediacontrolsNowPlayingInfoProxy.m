#import <MediaPlayer/MPNowPlayingInfoCenter.h>
#import <MediaPlayer/MPMediaItem.h>
#import "DeCodewaveTiMediacontrolsNowPlayingInfoProxy.h"
#import "TiUtils.h"

@implementation DeCodewaveTiMediacontrolsNowPlayingInfoProxy

-(void)setNowPlaying:(id)args {
    NSLog(@"Setting \"now playing\" information");
    NSString *title = [TiUtils stringValue:[self valueForUndefinedKey:MPMediaItemPropertyTitle]];
    NSString *albumTitle = [TiUtils stringValue:[self valueForUndefinedKey:MPMediaItemPropertyAlbumTitle]];
    NSString *artist = [TiUtils stringValue:[self valueForUndefinedKey:MPMediaItemPropertyArtist]];
    NSString *albumArtist = [TiUtils stringValue:[self valueForUndefinedKey:MPMediaItemPropertyAlbumArtist]];
    NSString *genre = [TiUtils stringValue:[self valueForUndefinedKey:MPMediaItemPropertyGenre]];
    NSString *composer = [TiUtils stringValue:[self valueForUndefinedKey:MPMediaItemPropertyComposer]];
    NSNumber *discNumber = [TiUtils numberFromObject:[self valueForUndefinedKey:MPMediaItemPropertyDiscNumber]];
    NSNumber *discCount = [TiUtils numberFromObject:[self valueForUndefinedKey:MPMediaItemPropertyDiscCount]];
    NSNumber *albumTrackNumber = [TiUtils numberFromObject:[self valueForUndefinedKey:MPMediaItemPropertyAlbumTrackNumber]];
    NSNumber *albumTrackCount = [TiUtils numberFromObject:[self valueForUndefinedKey:MPMediaItemPropertyAlbumTrackCount]];
    NSNumber *playbackDuration = [TiUtils numberFromObject:[self valueForUndefinedKey:MPMediaItemPropertyPlaybackDuration]];
    NSNumber *elapsedPlaybackTime = [TiUtils numberFromObject:[self valueForUndefinedKey:MPNowPlayingInfoPropertyElapsedPlaybackTime]];
    NSNumber *playbackRate = [TiUtils numberFromObject:[self valueForUndefinedKey:MPNowPlayingInfoPropertyPlaybackRate]];
    id artworkPropValue = [self valueForUndefinedKey:MPMediaItemPropertyArtwork];
    UIImage *artwork = [TiUtils toImage:artworkPropValue proxy:self];
    NSMutableDictionary *nowPlayingInfo = [[[NSMutableDictionary alloc] init] autorelease];
    if (title != nil) {
        NSLog(@"Now playing \"title\" = \"%@\".", title);
        [nowPlayingInfo setObject:title forKey:MPMediaItemPropertyTitle];
    }
    if (albumTitle != nil) {
        NSLog(@"Now playing \"albumTitle\" = \"%@\".", albumTitle);
        [nowPlayingInfo setObject:albumTitle forKey:MPMediaItemPropertyAlbumTitle];
    }
    if (artist != nil) {
        NSLog(@"Now playing \"artist\" = \"%@\".", artist);
        [nowPlayingInfo setObject:artist forKey:MPMediaItemPropertyArtist];
    }
    if (albumArtist != nil) {
        NSLog(@"Now playing \"albumArtist\" = \"%@\".", albumArtist);
        [nowPlayingInfo setObject:albumArtist forKey:MPMediaItemPropertyAlbumArtist];
    }
    if (genre != nil) {
        NSLog(@"Now playing \"genre\" = \"%@\".", genre);
        [nowPlayingInfo setObject:genre forKey:MPMediaItemPropertyGenre];
    }
    if (composer != nil) {
        NSLog(@"Now playing \"composer\" = \"%@\".", composer);
        [nowPlayingInfo setObject:composer forKey:MPMediaItemPropertyComposer];
    }
    if (discNumber != nil) {
        NSLog(@"Now playing \"discNumber\" = \"%@\".", discNumber);
        [nowPlayingInfo setObject:discNumber forKey:MPMediaItemPropertyDiscNumber];
    }
    if (discCount != nil) {
        NSLog(@"Now playing \"discCount\" = \"%@\".", discCount);
        [nowPlayingInfo setObject:discCount forKey:MPMediaItemPropertyDiscCount];
    }
    if (albumTrackNumber != nil) {
        NSLog(@"Now playing \"albumTrackNumber\" = \"%@\".", albumTrackNumber);
        [nowPlayingInfo setObject:albumTrackNumber forKey:MPMediaItemPropertyAlbumTrackNumber];
    }
    if (albumTrackCount != nil) {
        NSLog(@"Now playing \"albumTrackCount\" = \"%@\".", albumTrackCount);
        [nowPlayingInfo setObject:albumTrackCount forKey:MPMediaItemPropertyAlbumTrackCount];
    }
    if (playbackDuration != nil) {
        NSLog(@"Now playing \"playbackDuration\" = \"%@\".", playbackDuration);
        [nowPlayingInfo setObject:playbackDuration forKey:MPMediaItemPropertyPlaybackDuration];
    }
    if (elapsedPlaybackTime != nil) {
        NSLog(@"Now playing \"elapsedPlaybackTime\" = \"%@\".", elapsedPlaybackTime);
        [nowPlayingInfo setObject:elapsedPlaybackTime forKey:MPNowPlayingInfoPropertyElapsedPlaybackTime];
    }
    if (playbackRate != nil) {
        NSLog(@"Now playing \"playbackRate\" = \"%@\".", playbackRate);
        [nowPlayingInfo setObject:playbackRate forKey:MPNowPlayingInfoPropertyPlaybackRate];
    }
    if (artwork != nil) {
        NSLog(@"Now playing \"artwork\" image created from \"%@\".", artworkPropValue);
        MPMediaItemArtwork *mediaItemArtwork = [[[MPMediaItemArtwork alloc] initWithImage:artwork] autorelease];
        [nowPlayingInfo setObject:mediaItemArtwork forKey:MPMediaItemPropertyArtwork];
    } else if (artworkPropValue != nil) {
        NSLog(@"Now playing \"artwork\" image could not be created from \"%@\".", artworkPropValue);
    }
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:nowPlayingInfo];
}

-(NSMutableDicationary *)getMutableDictionary:(void) {
    NSDictionary *immutableNowPlayingInfo = [MPNowPlayingInfoCenter defaultCenter] getNowPlayingInfo();
    return immutableNowPlayingInfo != nil ? [immutableNowPlayingInfo mutableCopy] : [[[NSMutableDictionary alloc] init] autorelease];
}

-(void)updatePlaybackProgress:(id)args {
    NSMutableDicationary *nowPlayingInfo = getMutableDictionary();
    if (elapsedPlaybackTime != nil) {
        NSLog(@"Now playing \"elapsedPlaybackTime\" = \"%@\".", elapsedPlaybackTime);
        [nowPlayingInfo setObject:elapsedPlaybackTime forKey:MPNowPlayingInfoPropertyElapsedPlaybackTime];
    }
    if (playbackRate != nil) {
        NSLog(@"Now playing \"playbackRate\" = \"%@\".", playbackRate);
        [nowPlayingInfo setObject:playbackRate forKey:MPNowPlayingInfoPropertyPlaybackRate];
    }
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:nowPlayingInfo];
}

@end

