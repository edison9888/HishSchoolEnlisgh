//
//  DetaiViewController.h
//  my
//
//  Created by ibokan on 13-1-7.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Listh.h"
#import "ListhViewController.h"

@class AudioStreamer;

@interface DetaiViewController : UIViewController
{
   
    AudioStreamer *streamer;
    Listh *listh;
    UIImageView *view;
    UIProgressView *pView;
    NSTimer *progressUpdateTimer;
    UISlider *slider;
    UIButton *but;
    NSString *sImage;
    UIButton *optionBut;
    UIButton *optionA;
    UIButton *optionB;
    UIButton *optionC;
    UIButton *optionD;
    UIButton *button;
    int answerX;
    UITextView *answerScrollView;
    UIView *answerView;
    NSMutableArray *copyArray;
}
@property(nonatomic,retain)Listh *listh;
@property(nonatomic,retain)NSMutableArray *copyArray;

@end
