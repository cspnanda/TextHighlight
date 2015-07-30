//
//  ViewController.h
//  TextHighlight
//
//  Created by Prasanna Nanda on 7/6/15.
//  Copyright (c) 2015 C S Prasanna Nanda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSBackGroundPlayer.h"
@interface ViewController : UIViewController
{
  int currentWord;
  NSTimer *timer1;
  NSTimer *timer2;
}

@property (strong,nonatomic) IBOutlet UIWebView *webView;
@property (strong,nonatomic) NSArray *offsets;
@property (strong, nonatomic) NSArray *wordsInPage;

@end

