//
//  DetaiViewController.h
//  my
//
//  Created by ibokan on 13-1-7.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Listh.h"
#import <AVFoundation/AVFoundation.h>

@interface DetaiViewController : UIViewController
{
    Listh *listh;
    UIImageView *view;
    UIProgressView *pView;
    AVAudioPlayer *audioPlayer;
    UISlider *slider;
}
@property(nonatomic,retain)Listh *listh;

@end
