#import <MediaPlayer/MPNowPlayingInfoCenter.h>
#import <MediaPlayer/MPMediaItem.h>
#import <ImageLoader.h>
#import <TiApp.h>
#import "DeCodewaveTiMediacontrolsNowPlayingInfoProxy.h"
#import "TiUtils.h"

@implementation DeCodewaveTiMediacontrolsNowPlayingInfoProxy {
    @private NSMutableDictionary *myDictionary;
}

-(NSMutableDictionary *)getDict {
    if (myDictionary == nil) {
        myDictionary = [[NSMutableDictionary alloc] init];
    }
    return myDictionary;
}

-(void)setTitle:(id)title {
    ENSURE_SINGLE_ARG(title, NSString);
    NSLog(@"Now playing \"title\" = \"%@\".", title);
    [[self getDict] setObject:title forKey:MPMediaItemPropertyTitle];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)clearTitle:(id)args {
    NSLog(@"Clearing now playing \"title\".");
    [[self getDict] removeObjectForKey:MPMediaItemPropertyTitle];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setAlbumTitle:(id)albumTitle {
    ENSURE_SINGLE_ARG(albumTitle, NSString);
    NSLog(@"Now playing \"albumTitle\" = \"%@\".", albumTitle);
    [[self getDict] setObject:albumTitle forKey:MPMediaItemPropertyAlbumTitle];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)clearAlbumTitle:(id)args {
    NSLog(@"Clearing now playing \"albumTitle\".");
    [[self getDict] removeObjectForKey:MPMediaItemPropertyAlbumTitle];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setArtist:(id)artist{
    ENSURE_SINGLE_ARG(artist, NSString);
    NSLog(@"Now playing \"artist\" = \"%@\".", artist);
    [[self getDict] setObject:artist forKey:MPMediaItemPropertyArtist];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)clearArtist:(id)args {
    NSLog(@"Clearing now playing \"artist\".");
    [[self getDict] removeObjectForKey:MPMediaItemPropertyArtist];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setAlbumArtist:(id)albumArtist{
    ENSURE_SINGLE_ARG(albumArtist, NSString);
    NSLog(@"Now playing \"albumArtist\" = \"%@\".", albumArtist);
    [[self getDict] setObject:albumArtist forKey:MPMediaItemPropertyAlbumArtist];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)clearAlbumArtist:(id)args {
    NSLog(@"Clearing now playing \"albumArtist\".");
    [[self getDict] removeObjectForKey:MPMediaItemPropertyAlbumArtist];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setGenre:(id)genre{
    ENSURE_SINGLE_ARG(genre, NSString);
    NSLog(@"Now playing \"genre\" = \"%@\".", genre);
    [[self getDict] setObject:genre forKey:MPMediaItemPropertyGenre];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)clearGenre:(id)args {
    NSLog(@"Clearing now playing \"genre\".");
    [[self getDict] removeObjectForKey:MPMediaItemPropertyGenre];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setComposer:(id)composer{
    ENSURE_SINGLE_ARG(composer, NSString);
    NSLog(@"Now playing \"composer\" = \"%@\".", composer);
    [[self getDict] setObject:composer forKey:MPMediaItemPropertyComposer];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)clearComposer:(id)args {
    NSLog(@"Clearing now playing \"composer\".");
    [[self getDict] removeObjectForKey:MPMediaItemPropertyComposer];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setDiscNumber:(id)discNumber{
    ENSURE_SINGLE_ARG(discNumber, NSNumber);
    NSLog(@"Now playing \"discNumber\" = \"%@\".", discNumber);
    [[self getDict] setObject:discNumber forKey:MPMediaItemPropertyDiscNumber];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)clearDiscNumber:(id)args {
    NSLog(@"Clearing now playing \"discNumber\".");
    [[self getDict] removeObjectForKey:MPMediaItemPropertyDiscNumber];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setDiscCount:(id)discCount{
    ENSURE_SINGLE_ARG(discCount, NSNumber);
    NSLog(@"Now playing \"discCount\" = \"%@\".", discCount);
    [[self getDict] setObject:discCount forKey:MPMediaItemPropertyDiscCount];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)clearDiscCount:(id)args {
    NSLog(@"Clearing now playing \"discCount\".");
    [[self getDict] removeObjectForKey:MPMediaItemPropertyDiscCount];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setAlbumTrackNumber:(id)albumTrackNumber{
    ENSURE_SINGLE_ARG(albumTrackNumber, NSNumber);
    NSLog(@"Now playing \"albumTrackNumber\" = \"%@\".", albumTrackNumber);
    [[self getDict] setObject:albumTrackNumber forKey:MPMediaItemPropertyAlbumTrackNumber];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)clearAlbumTrackNumber:(id)args {
    NSLog(@"Clearing now playing \"albumTrackNumber\".");
    [[self getDict] removeObjectForKey:MPMediaItemPropertyAlbumTrackNumber];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setAlbumTrackCount:(id)albumTrackCount{
    ENSURE_SINGLE_ARG(albumTrackCount, NSNumber);
    NSLog(@"Now playing \"albumTrackCount\" = \"%@\".", albumTrackCount);
    [[self getDict] setObject:albumTrackCount forKey:MPMediaItemPropertyAlbumTrackCount];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)clearAlbumTrackCount:(id)args {
    NSLog(@"Clearing now playing \"albumTrackCount\".");
    [[self getDict] removeObjectForKey:MPMediaItemPropertyAlbumTrackCount];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setPlaybackDuration:(id)playbackDuration{
    ENSURE_SINGLE_ARG(playbackDuration, NSNumber);
    NSLog(@"Now playing \"playbackDuration\" = \"%@\".", playbackDuration);
    [[self getDict] setObject:playbackDuration forKey:MPMediaItemPropertyPlaybackDuration];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)clearPlaybackDuration:(id)args {
    NSLog(@"Clearing now playing \"playbackDuration\".");
    [[self getDict] removeObjectForKey:MPMediaItemPropertyPlaybackDuration];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setElapsedPlaybackTime:(id)elapsedPlaybackTime{
    ENSURE_SINGLE_ARG(elapsedPlaybackTime, NSNumber);
    NSLog(@"Now playing \"elapsedPlaybackTime\" = \"%@\".", elapsedPlaybackTime);
    [[self getDict] setObject:elapsedPlaybackTime forKey:MPNowPlayingInfoPropertyElapsedPlaybackTime];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)clearElapsedPlaybackTime:(id)args {
    NSLog(@"Clearing now playing \"elapsedPlaybackTime\".");
    [[self getDict] removeObjectForKey:MPNowPlayingInfoPropertyElapsedPlaybackTime];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setPlaybackRate:(id)playbackRate{
    ENSURE_SINGLE_ARG(playbackRate, NSNumber);
    NSLog(@"Now playing \"playbackRate\" = \"%@\".", playbackRate);
    [[self getDict] setObject:playbackRate forKey:MPNowPlayingInfoPropertyPlaybackRate];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)clearPlaybackRate:(id)args {
    NSLog(@"Clearing now playing \"playbackRate\".");
    [[self getDict] removeObjectForKey:MPNowPlayingInfoPropertyPlaybackRate];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)setArtwork:(id)artwork{
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

-(void)clearArtwork:(id)args {
    NSLog(@"Clearing now playing \"artwork\".");
    [[self getDict] removeObjectForKey:MPMediaItemPropertyArtwork];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:[self getDict]];
}

-(void)clear:(id)args {
    NSLog(@"Clearing all now playing properties.");
    myDictionary = nil;
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

@end

