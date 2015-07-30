//
//  ViewController.m
//  TextHighlight
//
//  Created by Prasanna Nanda on 7/6/15.
//  Copyright (c) 2015 C S Prasanna Nanda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize webView,offsets,wordsInPage;

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
//  [webView loadHTMLString:@"<br><br><h1>The quick brown fox jumps over the lazy dog" baseURL:Nil];
  NSString *filePath = [[NSBundle mainBundle] pathForResource:@"TTS" ofType:@"mp3"];
  [[KSBackGroundPlayer audioPlayer] playSoundWithPath:filePath ];
  NSString *path = [[NSBundle mainBundle] pathForResource:@"SoundOffsets" ofType:@"plist"];
  NSDictionary *wordTimeHash = [NSDictionary dictionaryWithContentsOfFile:path];
  offsets = [wordTimeHash objectForKey:@"offset"];
  self.wordsInPage = [@"The quick brown fox jumps over the lazy dog" componentsSeparatedByString: @" "];

  NSArray *thisWord = [self.offsets objectAtIndex:0];
  
  [NSTimer scheduledTimerWithTimeInterval:[[thisWord objectAtIndex:2] floatValue]
                                   target:self
                                 selector:@selector(highlightText)
                                 userInfo:nil
                                  repeats:NO];
  
  
}

- (void) highlightText {
  NSArray *thisWord = [self.offsets objectAtIndex:0];
  if(currentWord < [self.offsets count])
    thisWord = [self.offsets objectAtIndex:currentWord];
  if(currentWord < ([self.offsets count]))
  {
    
    NSString *header = [NSString stringWithFormat:@"<html><head><style type='text/css'> \n"
                        "span.highlight{color:orange;}</style>\n"
                        "</head><body><p><font size='%f' face='Helvetica' color='%@'>", 20.0,@"black"];
    NSString *footer = @"</body></html>";
    NSString *htmlString = [header stringByAppendingString:@""];
    if([self.wordsInPage count] > 2) {
      for(int j = 0; j < currentWord; j++)
      {
        htmlString = [htmlString stringByAppendingString:[self.wordsInPage objectAtIndex:j]];
        htmlString = [htmlString stringByAppendingString:@" "];
      }
      htmlString = [htmlString stringByAppendingString:@"<span class='highlight'> "];
      htmlString = [htmlString stringByAppendingString:[self.wordsInPage objectAtIndex:currentWord]];
      htmlString = [htmlString stringByAppendingString:@"</span> "];
      for(int j = (currentWord+1); j < [self.wordsInPage count]; j++)
      {
        htmlString = [htmlString stringByAppendingString:[self.wordsInPage objectAtIndex:j]];
        htmlString = [htmlString stringByAppendingString:@" "];
      }
      htmlString = [htmlString stringByAppendingString:@"</p></font>"];
      htmlString = [htmlString stringByAppendingString:footer];
      [webView loadHTMLString:htmlString baseURL:nil];
      currentWord++;
      [timer2 invalidate];
      timer2 = Nil;
      timer2 = [NSTimer scheduledTimerWithTimeInterval:([[thisWord objectAtIndex:2] floatValue]-0.02)
                                                target:self
                                              selector:@selector(highlightText)
                                              userInfo:nil
                                               repeats:NO];
    }
    else {
      // [Audio1 play];
    }
  }
  else
  {
    // [self.timer invalidate];
    // self.timer = nil;
  }
}



- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
