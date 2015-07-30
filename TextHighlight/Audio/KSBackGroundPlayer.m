//
//  KSBackGroundPlyer.m
//

#import "KSBackGroundPlayer.h"
#define RELEASE(ap) ({if(ap){[ap release];ap=nil;}})

static KSBackGroundPlayer *_audioPlayer = nil;

@implementation KSBackGroundPlayer



+ (KSBackGroundPlayer *)audioPlayer {
	@synchronized (self) {
		if (_audioPlayer == nil) {
			_audioPlayer = [[KSBackGroundPlayer alloc] init];
		}
	}
	return _audioPlayer;
   
}

- (id)init {
	self = [super init];
	if (self) {
		//Initialization code.
	}
	return self;
}

- (void)playSoundWithPath:(NSString *)path {
	NSURL *_URL = [NSURL fileURLWithPath:path];
	audioPlayer_ = [[AVAudioPlayer alloc] initWithContentsOfURL:_URL error:NULL];
	audioPlayer_.delegate = self;
	audioPlayer_.volume = 0.6;
	audioPlayer_.currentTime = 0;
	[audioPlayer_ play];
}



- (void)playSoundWithPathWithPause:(NSString *)path playBackDelay:(NSTimeInterval)delay {
	NSURL *_URL = [NSURL fileURLWithPath:path];
	audioPlayer_ = [[AVAudioPlayer alloc] initWithContentsOfURL:_URL error:NULL];
	audioPlayer_.delegate = self;
	audioPlayer_.volume = 0.6;
    NSTimeInterval playTime = audioPlayer_.deviceCurrentTime + delay;
	[audioPlayer_ playAtTime:playTime];
	[audioPlayer_ play];
}

- (void)playBackSkipTo:(NSString *)path playBackDelay:(NSTimeInterval)delay {
	NSURL *_URL = [NSURL fileURLWithPath:path];
	audioPlayer_ = [[AVAudioPlayer alloc] initWithContentsOfURL:_URL error:NULL];
	audioPlayer_.delegate = self;
	audioPlayer_.volume = 0.6;
    audioPlayer_.currentTime = delay;
    NSTimeInterval playTime = audioPlayer_.deviceCurrentTime + delay;
	[audioPlayer_ playAtTime:playTime];
	[audioPlayer_ play];
}

- (void)stop {
	if (audioPlayer_) {
		[audioPlayer_ stop];
		
    }
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
	
     _audioPlayer = nil;
}
-(BOOL) isAudioPlaying
{
    return [audioPlayer_ isPlaying];
}


@end
