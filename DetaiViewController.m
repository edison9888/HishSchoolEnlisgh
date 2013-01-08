//
//  DetaiViewController.m
//  my
//
//  Created by ibokan on 13-1-7.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "DetaiViewController.h"

@interface DetaiViewController ()

@end

@implementation DetaiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	UIImage *image=[UIImage imageNamed:@"background.png"];
    view=[[UIImageView alloc]initWithFrame:(CGRectMake(0, 0, 320, 400))];
    view.image=image;
    [self.view addSubview:view];
    [self setBackGourd];

}
-(void)setAVmp3
{
    NSData *xml=[[NSData alloc]initWithContentsOfURL:self.listh.midFile];
    audioPlayer=[[AVAudioPlayer alloc]initWithData:xml error:nil];
    [audioPlayer prepareToPlay];
    
}

-(void)setBackGourd
{
    UILabel *lable1=[[UILabel alloc]initWithFrame:(CGRectMake(20, 0, 300, 100))];
    lable1.backgroundColor=[UIColor clearColor];
    lable1.text=self.listh.title;
    lable1.lineBreakMode=UILineBreakModeClip;
    lable1.numberOfLines=0;
    [self.view addSubview:lable1];
    [self setAnswerGourd:@"   A. " makeY:100 name:self.listh.optionA];
    [self setAnswerGourd:@"   B. " makeY:140 name:self.listh.optionB];
    [self setAnswerGourd:@"   C. " makeY:180 name:self.listh.optionC];
    
}
-(void)setAnswerGourd:(NSString *)option makeY:(int)Y name:(NSString *)name
{
    UIButton *but=[UIButton buttonWithType:(UIButtonTypeInfoDark)];
    but.frame=CGRectMake(10, Y, 60, 40);
    but.showsTouchWhenHighlighted=YES;
    [but setTitle:option forState:(UIControlStateNormal)];
    [but setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal )];
    [but addTarget:self action:@selector(doAnswer) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:but];
    UILabel *lable2=[[UILabel alloc]initWithFrame:(CGRectMake(70, Y, 250, 40))];
    lable2.backgroundColor=[UIColor clearColor];
    lable2.lineBreakMode=UILineBreakModeClip;
//    lable2.baselineAdjustment=UIBaselineAdjustmentAlignCenters;
//    lable2.textAlignment=uite
    lable2.numberOfLines=0;
    lable2.text=name;
    [self.view addSubview:lable2];
}
-(void)doAnswer
{
    NSLog(@"+++++++++");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
