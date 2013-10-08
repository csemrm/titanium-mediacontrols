#import <TiProxy.h>

@interface DeCodewaveTiMediacontrolsNowPlayingInfoProxy : TiProxy

-(void)setTitle:(id)title;
-(void)setAlbumTitle:(id)albumTitle;
-(void)setArtist:(id)artist;
-(void)setAlbumArtist:(id)albumArtist;
-(void)setGenre:(id)genre;
-(void)setComposer:(id)composer;
-(void)setDiscNumber:(id)discNumber;
-(void)setDiscCount:(id)discCount;
-(void)setAlbumTrackNumber:(id)albumTrackNumber;
-(void)setAlbumTrackCount:(id)albumTrackCount;
-(void)setPlaybackDuration:(id)playbackDuration;
-(void)setElapsedPlaybackTime:(id)elapsedPlaybackTime;
-(void)setPlaybackRate:(id)playbackRate;
-(void)setArtwork:(id)artwork;
-(void)clear;

@end

