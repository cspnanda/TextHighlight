//
//  KSBackGroundPlyer.h
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface KSBackGroundPlayer : NSObject <AVAudioPlayerDelegate> {
	AVAudioPlayer *audioPlayer_;
}

+ (KSBackGroundPlayer *)audioPlayer;
- (void)playSoundWithPath:(NSString *)path;
-(void)playSoundWithPathWithPause:(NSString *)path playBackDelay:(NSTimeInterval)delay;
-(void)playBackSkipTo:(NSString *)path playBackDelay:(NSTimeInterval)delay;

- (void)stop;
-(BOOL) isAudioPlaying;
@end

/*
 * Use following 2 methods to play sound:
 *
 * To Start:-
 * [[KSAudioPlayer audioPlayer] playSoundWithPath:filePath];
 *
 * To Stop:-
 * [[KSAudioPlayer audioPlayer] stop];
 *
 */